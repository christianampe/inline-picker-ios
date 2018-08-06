//
//  FlatInlinePickerConfig.swift
//  FlatInlinePicker
//
//  Created by Ampe on 8/4/18.
//

import Foundation

public struct FlatInlinePickerConfig {
    public let padding: UIEdgeInsets
    public let cellConfig: FlatInlinePickerCellConfig
    
    public init(padding: UIEdgeInsets,
                cellConfig: FlatInlinePickerCellConfig) {
        
        self.padding = padding
        self.cellConfig = cellConfig
    }
}

public extension FlatInlinePickerConfig {
    public static let `default` = FlatInlinePickerConfig(padding: UIEdgeInsets(top: 20,
                                                                               left: 20,
                                                                               bottom: -20,
                                                                               right: -20),
                                                         cellConfig: .default)
}
