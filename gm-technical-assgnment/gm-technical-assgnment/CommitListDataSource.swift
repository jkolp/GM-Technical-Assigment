//
//  CommitListDataSource.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

import UIKit

class CommitListDataSource: NSObject, UICollectionViewDataSource {
    
    private var commitList = [String]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return commitList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommitCell.cellIdentifier, for: indexPath) as! CommitCell
        
        return cell
    }
    
    func setCommits(with list: [String]) {
        commitList = list

    }
}
