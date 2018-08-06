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
    open var padding: CGRect = FlatInlinePickerConfig.default.padding
    
    @IBInspectable
    open var selectedTextColor: UIColor = FlatInlinePickerConfig.default.cellConfig.selectedTextColor
    
    @IBInspectable
    open var selectedBackgroundColor: UIColor = FlatInlinePickerConfig.default.cellConfig.selectedBackgroundColor
    
    @IBInspectable
    open var selectedBorderColor: CGColor = FlatInlinePickerConfig.default.cellConfig.selectedBorderColor
    
    @IBInspectable
    open var selectedBorderWidth: CGFloat = FlatInlinePickerConfig.default.cellConfig.selectedBorderWidth
    
    @IBInspectable
    open var unselectedTextColor: UIColor = FlatInlinePickerConfig.default.cellConfig.unselectedTextColor
    
    @IBInspectable
    open var unselectedBackgroundColor: UIColor = FlatInlinePickerConfig.default.cellConfig.unselectedBackgroundColor
    
    @IBInspectable
    open var unselectedBorderColor: CGColor = FlatInlinePickerConfig.default.cellConfig.unselectedBorderColor
    
    @IBInspectable
    open var unselectedBorderWidth: CGFloat = FlatInlinePickerConfig.default.cellConfig.unselectedBorderWidth
    
    @IBInspectable
    open var cornerRadius: CGFloat = FlatInlinePickerConfig.default.cellConfig.cornerRadius
    
    @IBInspectable
    open var spacing: UIEdgeInsets = FlatInlinePickerConfig.default.cellConfig.spacing
    
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
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 1, height: 1)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView = collectionView
        
        self.delegate = delegate
        self.dataSource = dataSource
        
        super.init(frame: frame)
        
        setupCollectionView()
        addViews()
        addConstraints()
    }
    
    // MARK: Storyboard Initalizer
    public required init?(coder aDecoder: NSCoder) {
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 40, height: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView = collectionView
        
        super.init(coder: aDecoder)
        
        setupCollectionView()
        addViews()
        addConstraints()
    }
}

extension FlatInlinePicker {
    func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(FlatInlinePickerCell.self,
                                forCellWithReuseIdentifier: FlatInlinePickerCell.reuseIdentifier)
        
        collectionView.backgroundColor = .white
        
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = true
    }
    
    func addViews() {
        
        addSubview(collectionView)
    }
    
    func addConstraints() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
    }
    
    func initConfig(_ config: FlatInlinePickerConfig) {
        
        padding = config.padding
        selectedTextColor = config.cellConfig.selectedTextColor
        selectedBackgroundColor = config.cellConfig.selectedBackgroundColor
        selectedBorderColor = config.cellConfig.selectedBorderColor
        selectedBorderWidth = config.cellConfig.selectedBorderWidth
        unselectedTextColor = config.cellConfig.unselectedTextColor
        unselectedBackgroundColor = config.cellConfig.unselectedBackgroundColor
        unselectedBorderColor = config.cellConfig.unselectedBorderColor
        unselectedBorderWidth = config.cellConfig.unselectedBorderWidth
        cornerRadius = config.cellConfig.cornerRadius
        spacing = config.cellConfig.spacing
    }
}

extension FlatInlinePicker: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
        
        print("selected \(indexPath)")
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               didDeselectItemAt indexPath: IndexPath) {
        
        print("deselected \(indexPath)")
    }
}

extension FlatInlinePicker: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        guard let dataSource = dataSource else {
            
            return 0
        }
        
        return dataSource.numberOfSections()
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        
        guard let dataSource = dataSource else {
            
            return 0
        }
        
        guard let itemCount = dataSource.numberOfItems(for: section) else {
            
            return 0
        }
        
        return itemCount
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlatInlinePickerCell.reuseIdentifier,
                                                            for: indexPath) as? FlatInlinePickerCell else {
                                                                
                                                                assert(false, "collection view cell registration inconsistency")
                                                                return UICollectionViewCell()
        }
        
        guard let dataSource = dataSource else {
            
            assert(false, "a data source must be provided")
            return UICollectionViewCell()
        }
        
        guard let text = dataSource.text(for: indexPath) else {
            
            assert(false, "internal inconsistency - file a bug")
            return UICollectionViewCell()
        }
        
        cell.update(text)
        
        return cell
    }
}
