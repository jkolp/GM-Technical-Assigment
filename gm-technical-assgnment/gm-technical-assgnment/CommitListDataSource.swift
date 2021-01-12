//
//  CommitListDataSource.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

import UIKit

class CommitListDataSource: NSObject, UICollectionViewDataSource {
    
    private var commitList = [CommitViewModel]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return commitList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommitCell.cellIdentifier, for: indexPath) as! CommitCell
        
        cell.configureCell(with: commitList[indexPath.item])
        
        return cell
    }
    

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CommitListViewHeader.reuseIdentifier, for: indexPath) as! CommitListViewHeader
        

        return header
    }
    
    func setCommits(with list: [CommitViewModel]) {
        commitList = list
    }
}
