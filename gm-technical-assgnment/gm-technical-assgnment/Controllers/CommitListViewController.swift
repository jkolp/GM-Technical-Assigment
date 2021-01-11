//
//  ViewController.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

import UIKit

class CommitListViewController: BaseViewController<CommitListView> {

    // MARK: - Properties
    private let commitListDataSource: CommitListDataSource
    private let commitListFacilitator: CommitListFacilitator
    
    
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
        title = "GM Technical Assignment"
        
        baseView.collectionView.dataSource = commitListDataSource
        baseView.collectionView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCommits()
    }
}

// MARK: - API

extension CommitListViewController {
    
    func fetchCommits() {
        commitListFacilitator.fetchAll(owner: "jkolp", repoName: "GM-Technical-Assigment") { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
                case .success( let commits ) :
                    self.commitListDataSource.setCommits(with: commits)
                    DispatchQueue.main.async {
                        self.baseView.collectionView.reloadData()
                    }
                case .failure( let error ) :
                    self.showAlert(with: "Oops!", message: error.localizedDescription)
            }
        }
    }
}

#warning("TODO")
// TODO : Move this extension to the Extensions file
extension UIViewController {
    
    func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension CommitListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width - 20 // 10 px margin on left and right
        let height = collectionView.frame.height / 4.75
        
        return CGSize(width: width, height: height)
        
    }
}
