//
//  FlatInlinePickerConfig.swift
//  FlatInlinePicker
//
//  Created by Ampe on 8/4/18.
//

import Foundation

public struct FlatInlinePickerConfig {
    public let interitemSpacing: CGFloat
    public let lineSpacing: CGFloat
    public let padding: CGRect
    
    public init(interitemSpacing: CGFloat,
                lineSpacing: CGFloat,
                padding: CGRect) {
        
        self.interitemSpacing = interitemSpacing
        self.lineSpacing = lineSpacing
        self.padding = padding
    }
}
