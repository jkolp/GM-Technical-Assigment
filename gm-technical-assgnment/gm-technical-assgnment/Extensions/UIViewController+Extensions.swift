//
//  UIViewController+Extensions.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/10/21.
//

import UIKit

extension UIViewController {
    
    func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
