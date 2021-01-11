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
        cell.addGradientBackground(firstColor: UIColor(red: 1/255, green: 99/255, blue: 206/255, alpha: 1), secondColor: UIColor(red: 3/255, green: 172/255, blue: 198/255, alpha: 1))
        
        return cell
    }
    
    func setCommits(with list: [CommitViewModel]) {
        commitList = list
    }
}
