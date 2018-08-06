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
    
    // MARK: Initalizers
    public override init(frame: CGRect) {
       
        let label = UILabel()
        self.label = label
        
        super.init(frame: frame)
        
        initViews()
        addViews()
        addConstraints()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        let label = UILabel()
        self.label = label
        
        super.init(coder: aDecoder)
        
        addViews()
        addConstraints()
        
        initViews()
    }
}

public extension FlatInlinePickerCell {
    static let reuseIdentifier = "FlatInlinePickerCell"
}

private extension FlatInlinePickerCell {
    func initViews() {
        
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.cornerRadius = 2
        contentView.layer.borderWidth = 1
    }
    
    func addViews() {
        
        contentView.addSubview(label)
    }
    
    func addConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
    }
}
