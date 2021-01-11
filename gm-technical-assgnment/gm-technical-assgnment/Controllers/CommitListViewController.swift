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
        title = "GM Technical Assignment"
        
        baseView.collectionView.dataSource = commitListDataSource
        baseView.collectionView.delegate = self
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
