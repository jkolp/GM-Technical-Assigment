//
//  CALayer+Extensions.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/11/21.
//

import UIKit

extension CALayer {
  func applySketchShadow(color: UIColor = .black,
                         alpha: Float = 0.5,
                         x: CGFloat = 0,
                         y: CGFloat = 2,
                         blur: CGFloat = 4,
                         spread: CGFloat = 0)
  {
    
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: 20).cgPath
        }
  }
}
