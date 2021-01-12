//
//  LoadingView.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/10/21.
//

import UIKit

class LoadingView: UIView {
    
    // MARK: - Propereties
    
    let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints  = false
        return spinner
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        addSubViews()
        addConstraints()
        spinner.startAnimating()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoadingView: Constructible {
    func addConstraints() {
        NSLayoutConstraint.activate([spinner.leftAnchor.constraint(equalTo: leftAnchor), spinner.topAnchor.constraint(equalTo: topAnchor), spinner.bottomAnchor.constraint(equalTo: bottomAnchor),spinner.rightAnchor.constraint(equalTo: rightAnchor)])
    }
    
    func addSubViews() {
        addSubview(spinner)
    }
}
