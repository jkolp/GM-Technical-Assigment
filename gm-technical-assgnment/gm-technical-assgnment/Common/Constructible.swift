//
//  Constructible.swift
//  gm-technical-assgnment
//
//  Created by Projects on 1/9/21.
//
/*
    Constructible protocol is used as the blueprint for all UIViews.
    All UIViews will contain addConstraints and addSubviews
 
 */

import Foundation

protocol Constructible {
    func addConstraints()
    func addSubViews()
}
