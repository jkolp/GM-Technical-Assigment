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
    
    func glassMorphism() {
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = []
    }
    
    func dropShadow(_ contentView: UIView) {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 2
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
}
