////
////  featureAppsController.swift
////  One Night Movie
////
////  Created by Simon Chrétien on 24/01/2017.
////  Copyright © 2017 Simon Chrétien. All rights reserved.
////
//
//import UIKit
//
//class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//    
//    private let cellId = "cellId"
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        collectionView?.backgroundColor = UIColor.white
//        collectionView?.register(GenresCell.self, forCellWithReuseIdentifier: cellId)
//        
//
//    }
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GenresCell
//        return cell
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 150)
//    }
//    
//}
