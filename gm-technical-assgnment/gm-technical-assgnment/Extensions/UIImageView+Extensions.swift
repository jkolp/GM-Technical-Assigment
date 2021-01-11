//
//  UIImageView+Extensions.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/10/21.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            } else {
                self.image = UIImage(named: "userImage")
            }
        }
    }
}
