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
        iv.layer.cornerRadius = 22.5    // ImageVeiw Radius / 2 = 22.5
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    } ()
    
    let authorLabel : UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.text = "JasperK"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let hashLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.text = "534ff2dde69f29dbcd375cf26c48a19972e02ad0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let commentLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.text = "First Comment made and what what what First Comment made and what what whaFirst Comment made and what what whaFirst Comment made and what what wha"
        label.numberOfLines = 5
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
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
}

extension CommitCell: Constructible {
    
    func addSubViews() {
        addSubViews(profileImageView, authorLabel, hashLabel, commentLabel)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            profileImageView.widthAnchor.constraint(equalToConstant: 45),
            profileImageView.heightAnchor.constraint(equalToConstant: 45),
            
            authorLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            authorLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            authorLabel.heightAnchor.constraint(equalToConstant: 15),
            
            hashLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            hashLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
            hashLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 5),
            hashLabel.heightAnchor.constraint(equalToConstant: 15),
            
            commentLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            commentLabel.trailingAnchor.constraint(equalTo: hashLabel.trailingAnchor),
            commentLabel.topAnchor.constraint(equalTo: centerYAnchor)

        ])
    }
}

