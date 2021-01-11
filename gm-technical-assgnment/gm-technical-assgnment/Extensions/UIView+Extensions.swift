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
}
