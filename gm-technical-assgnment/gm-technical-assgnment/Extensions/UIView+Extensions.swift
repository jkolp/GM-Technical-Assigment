//
//  UIView+Extensions.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/10/21.
//

import UIKit

extension UIView {
    
    func addSubViews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
