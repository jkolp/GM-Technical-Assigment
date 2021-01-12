//
//  UIImage+Extensions.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/11/21.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
