//
//  CommitListView.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

import UIKit


class CommitListView: UIView {
    
    // MARK: - Properties
    
    var refreshAction: (() -> Void)?
    
    
    let refresh : UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return control
    } ()
    
    let collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
        cv.alwaysBounceVertical = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CommitCell.self, forCellWithReuseIdentifier: CommitCell.cellIdentifier)
        cv.register(CommitListViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CommitListViewHeader.reuseIdentifier)
        let layout = cv.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        return cv
    } ()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubViews()
        addConstraints()
        collectionView.refreshControl = refresh
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    // MARK: - Action
        
    @objc func handleRefresh() {
        refreshAction?()
    }
}

// MARK: - UI Setup

extension CommitListView: Constructible {

    func addSubViews() {
        addSubview(collectionView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                                     collectionView.leftAnchor.constraint(equalTo: leftAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     collectionView.rightAnchor.constraint(equalTo: rightAnchor)])
    }
}
