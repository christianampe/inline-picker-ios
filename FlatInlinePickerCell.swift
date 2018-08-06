//
//  FlatInlinePickerCell.swift
//  FlatInlinePicker
//
//  Created by Ampe on 8/5/18.
//

import Foundation

open class FlatInlinePickerCell: UICollectionViewCell {
    
    // MARK: Storage
    open weak var label: UILabel!
    
    // MARK: Properties
    open var config: FlatInlinePickerCellConfig = .default
    
    open func update(_ string: String) {
        
        label.text = string
    }
    
    open func initConfig(selectedTextColor: UIColor,
                         selectedBackgroundColor: UIColor,
                         selectedBorderColor: CGColor,
                         selectedBorderWidth: CGFloat,
                         unselectedTextColor: UIColor,
                         unselectedBackgroundColor: UIColor,
                         unselectedBorderColor: CGColor,
                         unselectedBorderWidth: CGFloat,
                         cornerRadius: CGFloat,
                         spacing: UIEdgeInsets) {
        
        config = FlatInlinePickerCellConfig(selectedTextColor: selectedTextColor,
                                            selectedBackgroundColor: selectedBackgroundColor,
                                            selectedBorderColor: selectedBorderColor,
                                            selectedBorderWidth: selectedBorderWidth,
                                            unselectedTextColor: unselectedTextColor,
                                            unselectedBackgroundColor: unselectedBackgroundColor,
                                            unselectedBorderColor: unselectedBorderColor,
                                            unselectedBorderWidth: unselectedBorderWidth,
                                            cornerRadius: cornerRadius,
                                            spacing: spacing)
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
        
        contentView.layer.cornerRadius = config.cornerRadius
        contentView.layer.masksToBounds = true
    }
    
    func addViews() {
        
        contentView.addSubview(label)
    }
    
    func addConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: config.spacing.top).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: config.spacing.left).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: config.spacing.right).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: config.spacing.bottom).isActive = true
    }
}

private extension FlatInlinePickerCell {
    func toggleSelection(_ isSelected: Bool) {
        isSelected ? setSelected() : setUnselected()
    }
    
    func setSelected() {
        label.textColor = config.selectedTextColor
        
        contentView.layer.borderColor = config.selectedBorderColor
        contentView.layer.borderWidth = config.selectedBorderWidth
        
        contentView.backgroundColor = config.selectedBackgroundColor
    }
    
    func setUnselected() {
        label.textColor = config.unselectedTextColor
        
        contentView.layer.borderColor = config.unselectedBorderColor
        contentView.layer.borderWidth = config.unselectedBorderWidth
        
        contentView.backgroundColor = config.unselectedBackgroundColor
    }
}
