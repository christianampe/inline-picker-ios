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
    public let cellConfig: FlatInlinePickerCellConfig
    
    public init(interitemSpacing: CGFloat,
                lineSpacing: CGFloat,
                padding: CGRect,
                cellConfig: FlatInlinePickerCellConfig) {
        
        self.interitemSpacing = interitemSpacing
        self.lineSpacing = lineSpacing
        self.padding = padding
        self.cellConfig = cellConfig
    }
}
