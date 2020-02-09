//
//  DetailViewController.swift
//  DispatchAsyncSample
//
//  Created by Umut Afacan on 22.12.2019.
//  Copyright © 2019 Umut Afacan. All rights reserved.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {
    
    var selectedIndex: Int?
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var sliderView: SliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sliderView.numbers = 4
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndex = self.selectedIndex {
            self.sliderView.selectIndex(selectedIndex)
            self.label.text = "initialIndex: \(self.sliderView.selectedIndex ?? -1)"
        }
    }
}
