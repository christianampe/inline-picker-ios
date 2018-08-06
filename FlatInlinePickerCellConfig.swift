//
//  FlatPickerCellConfig.swift
//  FlatInlinePicker
//
//  Created by Ampe on 8/5/18.
//

import Foundation

public struct FlatInlinePickerCellConfig {
    public let selectedTextColor: UIColor
    public let selectedBackgroundColor: UIColor
    public let selectedBorderColor: CGColor
    public let selectedBorderWidth: CGFloat
    public let unselectedTextColor: UIColor
    public let unselectedBackgroundColor: UIColor
    public let unselectedBorderColor: CGColor
    public let unselectedBorderWidth: CGFloat
    public let cornerRadius: CGFloat
    public let spacing: UIEdgeInsets
    
    public init(selectedTextColor: UIColor,
                selectedBackgroundColor: UIColor,
                selectedBorderColor: CGColor,
                selectedBorderWidth: CGFloat,
                unselectedTextColor: UIColor,
                unselectedBackgroundColor: UIColor,
                unselectedBorderColor: CGColor,
                unselectedBorderWidth: CGFloat,
                cornerRadius: CGFloat,
                spacing: UIEdgeInsets) {
        
        self.selectedTextColor = selectedTextColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.selectedBorderColor = selectedBorderColor
        self.selectedBorderWidth = selectedBorderWidth
        self.unselectedTextColor = unselectedTextColor
        self.unselectedBackgroundColor = unselectedBackgroundColor
        self.unselectedBorderColor = unselectedBorderColor
        self.unselectedBorderWidth = unselectedBorderWidth
        self.cornerRadius = cornerRadius
        self.spacing = spacing
    }
}

public extension FlatInlinePickerCellConfig {
    public static let `default` = FlatInlinePickerCellConfig(selectedTextColor: .white,
                                                             selectedBackgroundColor: .blue,
                                                             selectedBorderColor: UIColor.clear.cgColor,
                                                             selectedBorderWidth: 0,
                                                             unselectedTextColor: .black,
                                                             unselectedBackgroundColor: .clear,
                                                             unselectedBorderColor: UIColor.black.cgColor,
                                                             unselectedBorderWidth: 1,
                                                             cornerRadius: 3,
                                                             spacing: UIEdgeInsets(top: 10,
                                                                                   left: 20,
                                                                                   bottom: -10,
                                                                                   right: -20))
}
