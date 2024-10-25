//
//  ConstraintConstantValue.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//


import UIKit


protocol ConstraintConstantValue {
    
}

extension Int: ConstraintConstantValue {
}

extension UInt: ConstraintConstantValue {
}

extension Float: ConstraintConstantValue {
}

extension Double: ConstraintConstantValue {
}

extension CGFloat: ConstraintConstantValue {
}

extension CGPoint: ConstraintConstantValue {
}

extension CGSize: ConstraintConstantValue {
}

extension ConstraintConstantValue {
    
    func value(for frameLayoutAttribute: FrameLayoutAttribute) -> CGFloat {
        
        if let value = self as? CGFloat {
            return value
        }
        
        if let value = self as? Float {
            return CGFloat(value)
        }
        
        if let value = self as? Double {
            return CGFloat(value)
        }
        
        if let value = self as? Int {
            return CGFloat(value)
        }
        
        if let value = self as? UInt {
            return CGFloat(value)
        }
        
        if let value = self as? CGSize {
            if frameLayoutAttribute == .width {
                return value.width
            } else if frameLayoutAttribute == .height {
                return value.height
            } else {
                return 0.0
            }
        }
        
        if let value = self as? CGPoint {
            
            switch frameLayoutAttribute {
            case .left, .right, .leading, .trailing, .centerX, .leftMargin, .rightMargin, .leadingMargin, .trailingMargin, .centerXWithInMargin:
                return value.x
            case .top, .bottom, .centerY, .topMargin, .bottomMargin, .centerYWithInMargin, .lastBaseline, .firstBaseline:
                return value.y
            case .width, .height:
                return 0.0
            default:
                return 0.0
            }
            
        }
        
        return 0.0
    }
}
