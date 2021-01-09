//
//  CommitListView.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

import UIKit

let reuseIdentifier = "reuseIdentifier"

class CommitListView: UIView {
    
    // MARK: - Properties
    
    let collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    } ()
    
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
