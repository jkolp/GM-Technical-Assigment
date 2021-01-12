//
//  ViewController.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

import UIKit

enum CommitListViewControllerState {
    case loading
    case loaded ( CommitProviderError? )
}

protocol DataRefreshing {
    var collectionView: UICollectionView { get }
    func refresh()
}

class CommitListViewController: BaseViewController<CommitListView> {

    // MARK: - Properties
    private let commitListDataSource: CommitListDataSource
    private let commitListFacilitator: CommitListFacilitator
    private var state: CommitListViewControllerState! {
        didSet { handleState() }
    }
    private let loadingView = LoadingView()
    
    // MARK: - LifeCycle
    
    init(commitListDataSource: CommitListDataSource, commitListFacilitator: CommitListFacilitator) {
        self.commitListDataSource = commitListDataSource
        self.commitListFacilitator = commitListFacilitator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = baseView
        
        let gmLogo = UIImage(named: "gmLogo")?.resized(to: CGSize(width: 50.0, height: 50.0))
        navigationItem.titleView = UIImageView(image: gmLogo)
        navigationController?.navigationBar.backgroundColor = .clear
        
        baseView.collectionView.dataSource = commitListDataSource
        baseView.collectionView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCommits()
        baseView.refreshAction = { [weak self] in
            guard let self = self else { return }
            self.refresh()
        }
    }
    
    // MARK: - Helpers
    
    func handleState() {
        
        switch state {
            case .loading : addLoadingView()
            case .loaded( let error ) :
                if let error = error {
                    self.showAlert(with: "Oops!", message: error.rawValue)
                }
                removeLoadingView()
            
            default: return
        }
    }
    
    func addLoadingView() {
        view.addSubview(loadingView)
        NSLayoutConstraint.activate([
                                        loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        loadingView.topAnchor.constraint(equalTo: view.topAnchor),
                                        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                        loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    func removeLoadingView() {
        
        loadingView.removeFromSuperview()
    }
}

// MARK: - API

extension CommitListViewController {
    
    func fetchCommits() {
        state = .loading
        
        commitListFacilitator.fetchAll(owner: "jkolp", repoName: "GM-Technical-Assigment") { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
                case .success( let commits ) :
                    self.commitListDataSource.setCommits(with: commits)
                    DispatchQueue.main.async {
                        self.state = .loaded(nil)
                        self.baseView.collectionView.reloadData()
                        self.baseView.collectionView.refreshControl?.endRefreshing()
                    }
                case .failure( let error ) :
                    self.state = .loaded( error )
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CommitListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width - 20 // 10 px margin on left and right
        let height = collectionView.frame.height / 5
        
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // size of header
        let height = view.frame.height / 8
        let width = view.frame.width
        
        return CGSize(width: view.frame.width, height: height)
    }
}

// MARK: - DataRefreshing

extension CommitListViewController: DataRefreshing {
    var collectionView: UICollectionView {
        return baseView.collectionView
    }
    
    func refresh() {
        fetchCommits()
    }
}
