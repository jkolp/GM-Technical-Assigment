//
//  CommitListCell.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

import UIKit

struct CommitViewModel {
    let avatarUrl: String
    let commitHash: String
    let author: String
    let message: String
    let commitUrl: String
}

class CommitCell: UICollectionViewCell {
    
    // MARK: - Properties
    static public let cellIdentifier = "CommitCell"
    
    lazy var profileImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "userImage")
        iv.layer.cornerRadius = 25    // ImageVeiw Radius / 2 = 22.5
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    } ()
    
    let authorLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ArialRoundedMTBold", size: 18)
        label.textColor = .white
        label.text = "Place Holder Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let hashLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11.5)
        label.textColor = UIColor(red: 200/255, green: 200/255, blue: 199/255, alpha: 0.8)
        label.text = "534ff2dde69f29dbcd375cf26c48a19972e02ad0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let commentLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ArialRoundedMTBold", size: 13)
        label.textColor = .white
        label.text = "Placeholder comment"
        label.numberOfLines = 5
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [authorLabel, hashLabel])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()
    
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addGradientBackGroundColor()
        dropShadow()
        addSubViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCell(with viewModel: CommitViewModel) {

        authorLabel.text = viewModel.author
        hashLabel.text = viewModel.commitHash
        commentLabel.text = viewModel.message
        if let url = URL(string: viewModel.avatarUrl) {
            profileImageView.load(url: url)
        }
        
    }
    
    func addGradientBackGroundColor() {
        // From UIView extension
        addGradientBackground(firstColor: UIColor(red: 1/255, green: 99/255, blue: 206/255, alpha: 1), secondColor: UIColor(red: 3/255, green: 172/255, blue: 198/255, alpha: 1))
    }
    
    
    

}

extension CommitCell: Constructible {
    
    func addSubViews() {
        addSubViews(profileImageView, stack, commentLabel)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            
            stack.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            commentLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            commentLabel.trailingAnchor.constraint(equalTo: hashLabel.trailingAnchor),
            commentLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 13)

        ])
    }
}

