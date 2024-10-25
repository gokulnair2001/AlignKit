//
//  FrameAnchorable.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 15/10/24.
//


import UIKit


protocol FrameAnchorable {
    
    associatedtype AnchorType
    
    var top: AnchorType { get }
    var bottom: AnchorType { get }
    var left: AnchorType { get }
    var right: AnchorType { get }
    var leading: AnchorType { get }
    var trailing: AnchorType { get }
    var topMargin: AnchorType { get }
    var bottomMargin: AnchorType { get }
    var leftMargin: AnchorType { get }
    var rightMargin: AnchorType { get }
    var margins: AnchorType { get }
    var leadingMargin: AnchorType { get }
    var trailingMargin: AnchorType { get }
    var width: AnchorType { get }
    var height: AnchorType { get }
    var lastBaseline: AnchorType { get }
    var firstBaseline: AnchorType { get }
    var edges: AnchorType { get }
    var centre: AnchorType { get }
    var centreWithInMargins: AnchorType { get }
    var size: AnchorType { get }
    var centreY: AnchorType { get }
    var centreX: AnchorType { get }
    var centerXWithInMargin: AnchorType { get }
    var centerYWithInMargin: AnchorType { get }
    
}

