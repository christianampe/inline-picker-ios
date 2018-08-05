//
//  FlatInlinePicker.swift
//  FlatInlinePicker
//
//  Created by Ampe on 8/4/18.
//

import Foundation

@IBDesignable
open class FlatInlinePicker: UIView {
    
    // MARK: Views
    open weak var collectionView: UICollectionView!
    
    // MARK: Storage
    open var delegate: FlatInlinePickerDelegate?
    open var dataSource: FlatInlinePickerDataSource?
    
    // MARK: IBInspectables
    @IBInspectable
    open var interitemSpacing: CGFloat = 2.0
    
    @IBInspectable
    open var lineSpacing: CGFloat = 2.0
    
    @IBInspectable
    open var padding: CGSize = .zero
    
    
    // MARK: Designable Initalizers
    public convenience init() {
        
        self.init(frame: CGRect.zero)
    }
    
    public override convenience init(frame: CGRect) {
        
        self.init(frame: frame)
    }
    
    // MARK: Programmatic Initalizer
    public init(_ frame: CGRect,
                config: FlatInlinePickerConfig,
                delegate: FlatInlinePickerDelegate?,
                dataSource: FlatInlinePickerDataSource?) {
        
        self.delegate = delegate
        self.dataSource = dataSource
        
        super.init(frame: frame)
    }
    
    // MARK: Storyboard Initalizer
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}

extension FlatInlinePicker: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
        
        
    }
}

extension FlatInlinePicker: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlatInlinePickerCell.reuseIdentifier,
                                                            for: indexPath) as? FlatInlinePickerCell else {
                                                                
                                                                assert(false, "collection view cell registration inconsistency")
                                                                return UICollectionViewCell()
        }
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        
        
    }
}
