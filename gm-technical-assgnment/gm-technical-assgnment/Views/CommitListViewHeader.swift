//
//  CommitListViewHeader.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/11/21.
//

import UIKit

class CommitListViewHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "CollectionViewHeader"
    
    let gmLogo : UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "gmLogo")
        logo.contentMode = .scaleAspectFill
        logo.clipsToBounds = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return logo
    } ()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Technical Assignment"
        label.font = UIFont(name: "ArialRoundedMTBold", size: 25)
        label.textColor = .black
        
        return label
    } ()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [gmLogo, titleLabel])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CommitListViewHeader: Constructible {
    func addSubViews() {
        addSubViews(stack)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([stack.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     stack.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     stack.topAnchor.constraint(equalTo: topAnchor)
                                    ])
    }
}
