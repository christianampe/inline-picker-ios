//
//  ViewController.swift
//  FlatInlinePicker
//
//  Created by christianampe on 08/04/2018.
//  Copyright (c) 2018 christianampe. All rights reserved.
//

import UIKit
import FlatInlinePicker

class ViewController: UIViewController {
    
    var pickers: [[String]] =
    [
        ["New","Pending", "Upcoming", "Expired",  "One","Two", "Three", "Four"],
        ["One","Two", "Three", "Four"]
    ]

    @IBOutlet weak var flatInlinePicker: FlatInlinePicker!
}


extension ViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        flatInlinePicker.dataSource = self
        flatInlinePicker.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        flatInlinePicker.collectionView.reloadData()
    }
}

extension ViewController: FlatInlinePickerDelegate {}

extension ViewController: FlatInlinePickerDataSource {}
