//
//  LayoutAnchorType.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 29/10/24.
//

import UIKit


enum LayoutAnchorType {
    case yAxis(proxy: NSLayoutYAxisAnchor, superview: NSLayoutYAxisAnchor, negate: Bool)
    case xAxis(proxy: NSLayoutXAxisAnchor, superview: NSLayoutXAxisAnchor, negate: Bool)
    case dimension(proxy: NSLayoutDimension)
}
