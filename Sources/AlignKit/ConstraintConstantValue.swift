//
//  ConstraintConstantValue.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 23/10/24.
//


import UIKit


/// `ConstraintConstantValue` is a protocol that defines a type that can represent
/// constant values used in layout constraints. It allows different numeric types
/// to be treated uniformly as constraint constants.
public protocol ConstraintConstantValue { }

/// Extensions that allow various numeric types to conform to `ConstraintConstantValue`.
extension Int: ConstraintConstantValue { }
extension UInt: ConstraintConstantValue { }
extension Float: ConstraintConstantValue { }
extension Double: ConstraintConstantValue { }
extension CGFloat: ConstraintConstantValue { }
extension CGPoint: ConstraintConstantValue { }
extension CGSize: ConstraintConstantValue { }

extension Array: ConstraintConstantValue where Element == RelativeFrameLayoutAnchor { }

/// Extension on `ConstraintConstantValue` providing functionality to extract
/// a `CGFloat` value based on the provided `FrameLayoutAttribute`.
extension ConstraintConstantValue {
    
    /// Retrieves a `CGFloat` value based on the conforming type and the specified layout attribute.
    /// - Parameter frameLayoutAttribute: The layout attribute for which the value is required.
    /// - Returns: A `CGFloat` value corresponding to the specified layout attribute.
    func value(for frameLayoutAttribute: FrameLayoutAttribute) -> CGFloat {
        
        // If the value is already a CGFloat, return it directly.
        if let value = self as? CGFloat {
            return value
        }
        
        // Cast the value to different numeric types and convert to CGFloat.
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
        
        // Handle CGSize: return width or height based on the attribute.
        if let value = self as? CGSize {
            switch frameLayoutAttribute {
            case .width:
                return value.width
            case .height:
                return value.height
            default:
                return 0.0
            }
        }
        
        // Handle CGPoint: return x or y based on the attribute.
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
        
        // Default case: return 0.0 if no suitable type matched.
        return 0.0
    }
}

