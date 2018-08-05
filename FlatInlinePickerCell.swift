//
//  FlatInlinePickerCell.swift
//  FlatInlinePicker
//
//  Created by Ampe on 8/5/18.
//

import Foundation

open class FlatInlinePickerCell: UICollectionViewCell {
    open weak var label: UILabel!
    
    open func update(_ string: String) {
        label.text = string
    }
    
    public required init?(coder aDecoder: NSCoder) {
        let label = UILabel()
        self.label = label
        
        super.init(coder: aDecoder)
        
        initViews()
        addViews()
        addConstraints()
    }
}

public extension FlatInlinePickerCell {
    static let reuseIdentifier = "FlatInlinePickerCell"
}

private extension FlatInlinePickerCell {
    func initViews() {
        label.layer.cornerRadius = 2.0
    }
    
    func addViews() {
        addSubview(label)
    }
    
    func addConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
}
