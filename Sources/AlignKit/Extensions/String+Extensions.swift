//
//  String+Extensions.swift
//  AlignKit
//
//  Created by Gokul Nair(Work) on 08/11/24.
//

import UIKit

/// Console Debug Types
internal enum ConsoleDebugType: String {
    case warning = "⚠️"
    case error = "⛔️"
    case info = "✅"
}


extension String {
    
    /// Returns the string with provided debug type notation
    func highlightForDebug(prefix: String = "AlignKit --", _ type: ConsoleDebugType) -> String {
        
        let trimmedPrefix = prefix.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return "\(type.rawValue) \(trimmedPrefix.isEmpty ? "" : "\(trimmedPrefix) ")\(self)"
    }

}


