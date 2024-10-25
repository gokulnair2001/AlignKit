//
//  RelativeFrameAnchorManager.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 15/10/24.
//


import UIKit


class RelativeFrameAnchorManager {

    private let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    func getRelativeAnchor(_ anchor: FrameLayoutAttribute) -> [RelativeFrameLayoutAnchor] {

        switch anchor {
        case .top:
            return [view.topAnchor]
            
        case .bottom:
            return [view.bottomAnchor]
            
        case .left:
            return [view.leftAnchor]
            
        case .right:
            return [view.rightAnchor]
            
        case .leading:
            return [view.leadingAnchor]
            
        case .trailing:
            return [view.trailingAnchor]
            
        case .topMargin:
            return [view.layoutMarginsGuide.topAnchor]
            
        case .bottomMargin:
            return [view.layoutMarginsGuide.bottomAnchor]
            
        case .leftMargin:
            return [view.layoutMarginsGuide.leftAnchor]
            
        case .rightMargin:
            return [view.layoutMarginsGuide.rightAnchor]
            
        case .leadingMargin:
            return [view.layoutMarginsGuide.leadingAnchor]
            
        case .trailingMargin:
            return [view.layoutMarginsGuide.trailingAnchor]
            
        case .width:
            return [view.widthAnchor]
            
        case .height:
            return [view.heightAnchor]
            
        case .lastBaseline:
            return [view.lastBaselineAnchor]
            
        case .firstBaseline:
            return [view.firstBaselineAnchor]
            
        case .centerX:
            return [view.centerXAnchor]
            
        case .centerY:
            return [view.centerYAnchor]
            
        case .centerXWithInMargin:
            return [view.layoutMarginsGuide.centerXAnchor]
            
        case .centerYWithInMargin:
            return [view.layoutMarginsGuide.centerYAnchor]
            
        case .centre:
            return [view.centerXAnchor, view.centerYAnchor]
            
        case .edges:
            return [view.rightAnchor, view.leftAnchor, view.topAnchor, view.bottomAnchor]
            
        case .margins:
            return [view.layoutMarginsGuide.topAnchor, view.layoutMarginsGuide.bottomAnchor, view.layoutMarginsGuide.rightAnchor, view.layoutMarginsGuide.leftAnchor]
            
        case .centreWithInMargins:
            return [view.layoutMarginsGuide.centerXAnchor, view.layoutMarginsGuide.centerYAnchor]
            
        case .size:
            return [view.widthAnchor, view.heightAnchor]
            
        default:
            fatalError("AlignKit: Unknown modifier accessed")
            
        }
    }
}
