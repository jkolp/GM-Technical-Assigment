//
//  CommitListView.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

import UIKit


class CommitListView: UIView {
    
    // MARK: - Properties
    
    let collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
        cv.alwaysBounceVertical = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CommitCell.self, forCellWithReuseIdentifier: CommitCell.cellIdentifier)
        
        return cv
    } ()
    
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
