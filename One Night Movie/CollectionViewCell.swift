//
//  CollectionViewCell.swift
//  One Night Movie
//
//  Created by Simon Chrétien on 13/02/2017.
//  Copyright © 2017 Simon Chrétien. All rights reserved.
//

import UIKit

class CollectionViewCellGenres: UICollectionViewCell  {
    
    @IBOutlet weak var buttonGenres: UIButton!
    

//    
//     override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.buttonGenres.frame = CGRect(x: 0, y: 0, width: 180 , height: 50 )
//        self.buttonGenres.layer.cornerRadius = 10
//        self.buttonGenres.layer.borderWidth = 1
//        self.buttonGenres.layer.borderColor = UIColor.white.cgColor
//        self.buttonGenres.setTitleColor(UIColor.white, for: .normal)
//        self.buttonGenres.titleLabel?.font = UIFont(name: "circular", size: 18)
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        //custom logic goes here
//    }
    

    
  

   
}

class CollectionViewCellMovies: UICollectionViewCell {
    @IBOutlet weak var imageMovies: UIImageView!
    @IBOutlet weak var synopsis: UITextView!
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var labelMovie: UITextView!
    
}

