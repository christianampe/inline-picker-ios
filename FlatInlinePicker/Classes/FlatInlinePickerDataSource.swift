//
//  FlatInlinePickerDataSource.swift
//  FlatInlinePicker
//
//  Created by Ampe on 8/4/18.
//

import Foundation

public protocol FlatInlinePickerDataSource {
    
    // MARK: Storage
    var pickers: [[String]] { get set }
    
    // Get Methods
    func numberOfItems(for section: Int) -> Int?
    func numberOfSections() -> Int
    func text(for path: IndexPath) -> String?
}

public extension FlatInlinePickerDataSource {
    func numberOfItems(for section: Int) -> Int? {
        guard numberOfSections() >= section + 1 else {
            return nil
        }
        
        return pickers[section].count
    }
    
    func numberOfSections() -> Int {
        return pickers.count
    }
    
    func text(for index: IndexPath) -> String? {
        guard numberOfSections() >= index.section + 1 else {
            
            return nil
        }
        
        guard let rowCount = numberOfItems(for: index.section) else {
            
            return nil
        }
        
        guard rowCount >= index.row + 1 else {
            
            return nil
        }
        
        return pickers[index.section][index.row]
    }
}
