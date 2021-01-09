//
//  BaseViewController.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//

/* Discussion:
 
 Controller Layer: BaseViewController
 
 Following a fully programmtic UI, ALL view controllers created must inherit from BaseViewController.
 Controllers that don't have a specific view can just instantiate a basic UIView. Access your custom view using
 the baseView property.
 
 */

import UIKit

class BaseViewController<T: UIView>: UIViewController {
    
    // Properties
    let baseView = T()

    // UIViewController overrides
    override func loadView() {
        
        view = baseView
    }
}
