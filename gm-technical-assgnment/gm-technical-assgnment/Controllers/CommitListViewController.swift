//
//  ViewController.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

import UIKit

class CommitListViewController: BaseViewController<CommitListView> {

    // MARK: - Properties
    private var commitListDataSource = CommitListDataSource()
    
    override func loadView() {
        view = baseView
        
        
        baseView.collectionView.dataSource = commitListDataSource
        baseView.collectionView.delegate = self
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension CommitListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        var height = CGFloat(200)
        
        return CGSize(width: width, height: height)
        
    }
}
