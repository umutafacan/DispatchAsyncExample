//
//  SliderView.swift
//  DispatchAsyncSample
//
//  Created by Umut Afacan on 22.12.2019.
//  Copyright © 2019 Umut Afacan. All rights reserved.
//

import UIKit

extension UIView {

    /// Loads nib and docks to view
    func ownFirstNib() {
        guard let loadedViews = Bundle.main.loadNibNamed(String(describing: classForCoder), owner: self) else {
            return
        }

        guard let loadedView = loadedViews.first as? UIView else {
            return
        }

        addSubview(loadedView)
        loadedView.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: loadedView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: loadedView.bottomAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: loadedView.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: loadedView.rightAnchor).isActive = true
    }
}

final class SliderView: UIView {
    
    var numbers: Int = 0 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            configureCollectionView()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        ownFirstNib()
    }
   
    
    func selectIndex(_ index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        
        collectionView.selectItem(
            at: indexPath,
            animated: false,
            scrollPosition: .centeredHorizontally)
    }
    
    var selectedIndex: Int? {
        return self.collectionView.indexPathsForSelectedItems?.first?.item
    }
}

extension SliderView {
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: SliderCell.identifier, bundle: Bundle.main),
                                forCellWithReuseIdentifier: SliderCell.identifier)
    }
}

extension SliderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCell.identifier,
                                                            for: indexPath) as? SliderCell else {
                                                                return UICollectionViewCell()
        }
        
        cell.titleLabel.text = "\(indexPath.item)"
        
        return cell
    }
}

extension SliderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
