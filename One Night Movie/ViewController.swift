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
import AlamofireImage

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var genresList:[Genres] = []
    var moviesList:[Movies] = []
    var testList:[String] = ["Action", "Adventure", "Romance", "Mistery", "Documentary", "Crime", "History", "Music", "Thriller", "Science Fiction", "War"]
    
    @IBOutlet weak var collectionViewGenres: UICollectionView!
    @IBOutlet weak var collectionViewMovies: UICollectionView!

    var url:String = "http://one-night-movie.antoinemoreaux.fr:3000/movie"
    var mainStoryboard: UIStoryboard?


    @IBOutlet weak var moviesButton: UIButton!

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // ==================== Requétes alamofire Genres =======================
        
        request(url+"/genrestmd/all", method: .get)
            .validate()
            .responseJSON { (response) in
                if response.result.isSuccess {
                    let rawGenreList = response.result.value as! [[String:AnyObject]]
                    for genresData in rawGenreList {
                        if let genreObject = Genres(fromData: genresData){
                            self.genresList.append(genreObject)
                        }
                    }
//                    self.addButton()
                    self.collectionViewGenres.reloadData()
                }else {
                    print(response.result.error ?? "vide")
                }
        }
        
        // ==================== Requétes alamofire Movies =======================

        
        Alamofire.request(url+"/tenrandommovie", method: .get)
            .validate()
            .responseJSON { (response) in
                if response.result.isSuccess {
                    let rawMoviesList = response.result.value as! [[String:AnyObject]]
                    for moviesData in rawMoviesList {
                        if let moviesObject = Movies(fromData: moviesData){
                            self.moviesList.append(moviesObject)
                           
                        }
                    }
//                    self.addMovies()
                    self.collectionViewMovies.reloadData()
                }else {
                    print(response.result.error ?? "vide")
                }
                
        }
        
        

//        self.scrollViewGenres.frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 19, height: self.scrollViewGenres.frame.height)
//        self.scrollViewGenres.backgroundColor = UIColor.clear
        
        
        
        
        collectionViewGenres.backgroundColor = UIColor.clear
        
        if let layout = collectionViewGenres.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        collectionViewGenres.delegate = self
        collectionViewGenres.dataSource = self
        
        mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

        collectionViewMovies.delegate = self
        collectionViewMovies.dataSource = self
        
        
        
//        self.collectionViewMovies.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellMovies")
        collectionViewMovies.backgroundColor = UIColor.clear
        
        if let layout = collectionViewMovies.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 0
            
        }
        
    }
    
    
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        if collectionView == self.collectionViewGenres {
            return self.genresList.count
            
//            return self.testList.count
        }
        else {
//            print(self.moviesList)
            return self.moviesList.count
        }
        
    }
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//          ==================================  CollectionvViewGenres =========================================================
        
        if collectionView == self.collectionViewGenres {
            

            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellGenres", for: indexPath) as! CollectionViewCellGenres

            cell.buttonGenres.frame = CGRect(x: 0, y: 0, width: cell.bounds.size.width , height: cell.bounds.size.height)

            
            
            cell.buttonGenres.setTitle(genresList[indexPath.row].name, for: .normal)
            cell.buttonGenres.setTitleColor(UIColor.white, for: .normal)
            cell.buttonGenres.titleLabel?.font = UIFont(name: "circular", size: 18)
            
            self.setSizeButton(button: cell.buttonGenres)
//            self.setSizeButton(button: cell)
            
            cell.buttonGenres.layer.cornerRadius = 10
            cell.buttonGenres.layer.borderWidth = 1
            cell.buttonGenres.layer.borderColor = UIColor.white.cgColor
            
            return cell
        }
        
//          ==================================  CollectionvViewMovies =========================================================
        
        else{
        
            
            let cellMovies = collectionViewMovies.dequeueReusableCell(withReuseIdentifier: "cellMovies", for: indexPath) as! CollectionViewCellMovies
            
            cellMovies.backgroundColor = UIColor.white
            cellMovies.bounds.size.width = 311
            cellMovies.bounds.size.height = 385
            cellMovies.layer.cornerRadius = 10

            
            cellMovies.labelMovie.text = moviesList[indexPath.row].name
            cellMovies.labelMovie.font = UIFont(name: "circular", size: 23)
            cellMovies.labelMovie.textColor = UIColor.white
            cellMovies.labelMovie.backgroundColor = UIColor.clear
            cellMovies.labelMovie.isEditable = false
            
            cellMovies.layer.shadowOpacity = 0.4
            cellMovies.layer.shadowOffset = CGSize(width: 3, height: 3)

            
            cellMovies.synopsis.text = moviesList[indexPath.row].synopsis
            cellMovies.synopsis.isEditable = false
//
            cellMovies.imageMovies.af_setImage(withURL: URL(string :"https://image.tmdb.org/t/p/w300" + moviesList[indexPath.row].image)!)
//
//            print(moviesList[indexPath.row].genres)
//            imageView.isUserInteractionEnabled = true
//           imageView.addGestureRecognizer(tapGestureRecognizer)
            
            cellMovies.imagePoster.af_setImage(withURL: URL(string :"https://image.tmdb.org/t/p/w300" + moviesList[indexPath.row].poster)!)
            
//            cellMovies.addSubview(imageView)
//            cellMovies.addSubview(posterView)
//            cellMovies.addSubview(label)
//            cellMovies.addSubview(synopsis)
            

            
            
            return cellMovies
            
    
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
     if collectionView == self.collectionViewGenres {
//            let cellsAcross: CGFloat = 3
//            let spaceBetweenCells: CGFloat = 10
//            let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
//            return CGSize(width: dim, height: dim)
        return CGSize(width: 130, height: collectionView.frame.height)
        
//        let spaceBetweenCells = 12
//        let width = (Int(collectionView.frame.size.width) - spaceBetweenCells * 3) / 3
//        return CGSize(width: width, height: Int(collectionView.frame.height))
     }
        
//        
       else {
//            let cellsAcross: CGFloat = 1
//            let spaceBetweenCells: CGFloat = 1
//            let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
//            return CGSize(width: dim, height: dim)
//    
////            return CGSize(width: UIScreen.main.bounds.width - 40, height: collectionViewMovies.bounds.height - 40)
//
        return CGSize(width: 311, height: collectionView.frame.height)

//
        }
        
            }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionViewMovies.cellForItem(at: indexPath) != nil {
//            performSegue(withIdentifier: "showDetails", sender: cell)
            let secondVC = mainStoryboard?.instantiateViewController(withIdentifier: "moviesID") as! DetailMovieViewController
            secondVC.movie = self.moviesList[indexPath.row]
            present(secondVC, animated: true, completion: nil)
            
        } else {
            // Error indexPath is not on screen: this should never happen.
        }
    }
    
    func didSeletec(cell: CollectionViewCellMovies, indexPath: IndexPath) {
        
        let secondVC = mainStoryboard?.instantiateViewController(withIdentifier: "moviesID") as! DetailMovieViewController
        secondVC.movie = self.moviesList[indexPath.row]
        present(secondVC, animated: true, completion: nil)
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        assert(sender as? UICollectionViewCell != nil, "sender is not a collection view")
        
        if let indexPath = self.collectionViewMovies?.indexPath(for: sender as! UICollectionViewCell) {
            if segue.identifier == "showDetails" {
                let detailVC: DetailMovieViewController = segue.destination as! DetailMovieViewController
                detailVC.movie = self.moviesList[indexPath.row]
                
            }
        } else {
            // Error sender is not a cell or cell is not in collectionView.
        }
    }
    
    
    
//    func addButton()   {
//        var accumulatorSize:Int = 0
//        
//        for genre in self.genresList {
//            let buttonWidth = getSizeOfString(myString: genre.name).width + 20
//            let buttonHeight = getSizeOfString(myString: genre.name).height + 10
//            let button = UIButton(frame: CGRect(x: accumulatorSize, y: 0, width: Int(buttonWidth), height: Int(buttonHeight)))
//            button.setTitle(genre.name, for: .normal)
//            button.setTitleColor(UIColor.white, for: .normal)
//            button.titleLabel?.font = UIFont(name: "circular", size: 18)
//            button.layer.cornerRadius = 10
//            button.layer.borderWidth = 1
//            button.layer.borderColor = UIColor.white.cgColor
//            genre.button = button
//            self.scrollViewGenres.addSubview(button)
//            accumulatorSize = accumulatorSize + Int(buttonWidth) + 20
//        }
//        
//        self.scrollViewGenres.contentSize = CGSize(width: accumulatorSize, height: 50)
//        
//    }
//    
//    
//    
    
    func setSizeButton(button:UIView)
    {
        let fixedWidth = button.frame.size.width
        button.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = button.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = button.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        button.frame = newFrame;
    }
    
    func getSizeOfString(myString:String) -> CGSize {
        var sizeOfString = CGSize()
        if let font = UIFont(name: "circular", size: 18)
        {
            let finalDate = myString
            let fontAttributes = [NSFontAttributeName: font] // it says name, but a UIFont works
            sizeOfString = (finalDate as NSString).size(attributes: fontAttributes)
        }
        return sizeOfString
    }
    
//
//    
//    
//    func addMovies()  {
//        var accumulatorSize:Int = 32
//        
//        for (movie) in self.moviesList {
//            
//            let view = UIView(frame: CGRect(x: accumulatorSize, y: 0, width: 311, height: Int(self.scrollViewMovies.frame.height)))
//            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 233))
//            let posterView = UIImageView(frame: CGRect(x: 16, y: 136, width: 90, height: 135))
//            let label = UILabel(frame: CGRect(x: 122, y: 163, width: 189, height: 29))
//            let synopsis = UITextView(frame: CGRect(x: 16, y: 283, width: 279, height: 81))
//            
//           
//            
//            let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(showDetails))
//            
//            
//            imageView.isUserInteractionEnabled = true
//            imageView.addGestureRecognizer(tapGestureRecognizer)
//
//            
//            view.backgroundColor = UIColor.white
//            view.layer.cornerRadius = 10
//            
//            
//            label.text = movie.name
//            label.font = UIFont(name: "circular", size: 23)
//            label.textColor = UIColor.white
//            
//            synopsis.text = movie.synopsis
//            synopsis.isEditable = false
//            
//            imageView.af_setImage(withURL: URL(string :"https://image.tmdb.org/t/p/w300" + movie.image)!)
//            
//            posterView.af_setImage(withURL: URL(string :"https://image.tmdb.org/t/p/w300" + movie.poster)!)
//            
//            scrollViewMovies.addSubview(view)
//            view.addSubview(imageView)
//            view.addSubview(posterView)
//            view.addSubview(label)
//            view.addSubview(synopsis)
//            
//            
//            accumulatorSize = accumulatorSize + Int(view.frame.width) + 16
//            
//        }
//        
//        self.scrollViewMovies.contentSize = CGSize(width: accumulatorSize , height: Int(self.scrollViewMovies.frame.height))
//
//    }
//    
//    func showDetails(row:Int) {
//        
//        let myVC = storyboard?.instantiateViewController(withIdentifier: "moviesID") as! DetailMovieViewController
//        self.addChildViewController(myVC)
//        myVC.movie = self.moviesList
//        self.view.addSubview(myVC.view)
//        myVC.didMove(toParentViewController: self)
////        myVC.view.frame = self.view.frame
//        
//    }


}

