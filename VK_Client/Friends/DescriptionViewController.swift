//
//  DescriptionViewController.swift
//  VK_Client
//
//  Created by Woodshox on 10.08.21.
//

import UIKit

class DescriptionViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet var collectionView: UICollectionView!
    
    private var reuseID = "DescriptionCollectionViewCell"
}



extension DescriptionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as? DescriptionCollectionViewCell
        else {
            fatalError("{Message error}")
        }
        return cell
    }
}
