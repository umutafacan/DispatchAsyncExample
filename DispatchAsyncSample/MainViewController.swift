//
//  MainViewController.swift
//  DispatchAsyncSample
//
//  Created by Umut Afacan on 22.12.2019.
//  Copyright © 2019 Umut Afacan. All rights reserved.
//

import Foundation
import UIKit

final class MainViewController: UIViewController {
    
    @IBAction func didTapCatalogButton(_ sender: Any) {
        
        let detailVC = DetailViewController()
        detailVC.selectedIndex = 2
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
