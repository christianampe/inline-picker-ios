//
//  FlatInlinePickerConfig.swift
//  FlatInlinePicker
//
//  Created by Ampe on 8/4/18.
//

import Foundation

public struct FlatInlinePickerConfig {
    public let padding: CGRect
    public let cellConfig: FlatInlinePickerCellConfig
    
    public init(padding: CGRect,
                cellConfig: FlatInlinePickerCellConfig) {
        
        self.padding = padding
        self.cellConfig = cellConfig
    }
}

public extension FlatInlinePickerConfig {
    public static let `default` = FlatInlinePickerConfig(padding: CGRect(x: 20,
                                                                         y: 20,
                                                                         width: 20,
                                                                         height: 20),
                                                         cellConfig: .default)
}
