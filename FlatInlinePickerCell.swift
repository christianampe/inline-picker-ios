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
        
        initViews()
        
        addViews()
        addConstraints()
    }
    
    open override var isSelected: Bool {
        didSet {
            toggleSelection(isSelected)
        }
    }
}

public extension FlatInlinePickerCell {
    static let reuseIdentifier = "FlatInlinePickerCell"
}

private extension FlatInlinePickerCell {
    func initViews() {
        
        contentView.layer.cornerRadius = 3.0
        contentView.layer.masksToBounds = true
    }
    
    func addViews() {
        
        contentView.addSubview(label)
    }
    
    func addConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
    }
}

private extension FlatInlinePickerCell {
    func toggleSelection(_ isSelected: Bool) {
        isSelected ? setSelected() : setUnselected()
    }
    
    func setSelected() {
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.borderWidth = 0
        
        contentView.backgroundColor = UIColor.blue
    }
    
    func setUnselected() {
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        
        contentView.backgroundColor = UIColor.clear
    }
}
