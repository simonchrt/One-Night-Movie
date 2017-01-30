//
//  ViewController.swift
//  One Night Movie
//
//  Created by Simon Chrétien on 12/01/2017.
//  Copyright © 2017 Simon Chrétien. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var genresList:[Genres] = []
    var url:String = "http://2290fd2d.ngrok.io/movie/genrestmd/all"
    
    @IBOutlet weak var collectionViewGenres: UICollectionView!
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        Alamofire.request(url, method: .get)
            .validate()
            .responseJSON { (response) in
                if response.result.isSuccess {
                    let rawGenreList = response.result.value as! [[String:AnyObject]]
                    for genresData in rawGenreList {
                        if let genreObject = Genres(fromData: genresData){
                            
                            self.genresList.append(genreObject)
                            print(genreObject)
                        }
                    }
                    self.collectionViewGenres.reloadData()
                }else {
                    print(response.result.error ?? "vide")
                }
                
        }
        
        
        self.collectionViewGenres.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionViewGenres.backgroundColor = UIColor.clear
        
        if let layout = collectionViewGenres.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        collectionViewGenres.delegate = self
        collectionViewGenres.dataSource = self
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.genresList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionViewGenres.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: cell.bounds.size.height))
        print()
        cell.contentView.addSubview(button)
        button.setTitle(genresList[indexPath.row].name, for: .normal)
        button.setTitleColor(UIColor.yellow, for: .normal)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellsAcross: CGFloat = 3
        let spaceBetweenCells: CGFloat = 1
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        return CGSize(width: dim, height: dim)
    }
    
    
    
}

