//
//  FrameProxy.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 09/10/24.
//

import UIKit


internal class FrameProxy: ProxyView {
    
    var view: UIView
    private(set) var constraints: [NSLayoutConstraint] = []
    
    init(view: UIView) {
        self.view = view
    }
    
    func addConstraints(constraint: NSLayoutConstraint) {
        constraints.append(constraint)
    }
    
    func set(constraints: [NSLayoutConstraint]) {
        self.constraints.append(contentsOf: constraints)
    }
    
    func removeAllConstraints() {
        constraints.removeAll()
    }
    
}

