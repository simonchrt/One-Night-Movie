//
//  DetailMovieViewController.swift
//  One Night Movie
//
//  Created by Simon Chrétien on 06/02/2017.
//  Copyright © 2017 Simon Chrétien. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import YouTubePlayer
import SwiftyJSON

class DetailMovieViewController: UIViewController {

    @IBOutlet weak var scrollViewDetailMovie: UIScrollView!
    
//    @IBOutlet weak var avec: UILabel!
//    @IBOutlet weak var image: UIImageView!
//    @IBOutlet weak var poster: UIImageView!
//    @IBOutlet weak var labelFilm: UITextView!
//    @IBOutlet weak var synopsis: UITextView!
//    @IBOutlet weak var exitButton: UIButton!
//    @IBOutlet weak var date: UILabel!
    
    var movie:Movies?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url:String = "https://api.themoviedb.org/3/movie/\(movie!.id)/videos?api_key=f2b48700559e7dcdf6e8edead951ec6a&language=en-US"
        print(movie!.id)
        
        

        
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 245))
        let poster = UIImageView(frame: CGRect(x: 24, y: 134, width: 108 , height: 162))
        let labelFilm = UILabel(frame: CGRect(x: 148, y: 177, width: 173, height: 29))
        let exitButton = UIButton(frame: CGRect(x: 16, y: 26, width: 34, height: 34))
        let labelGenre = UILabel(frame : CGRect(x: poster.frame.maxX + 16, y: image.frame.maxY + 15, width: 96, height: 36))
        
        let labelDateSortie = UILabel(frame: CGRect(x: poster.frame.minX, y: poster.frame.maxY + 24, width: 110, height: 20))
        let dateSortie = UILabel(frame: CGRect(x: labelDateSortie.frame.maxX + 3, y: labelDateSortie.frame.minY, width: 87, height: 20))
        
        let labelRealisateur = UILabel(frame: CGRect(x: labelDateSortie.frame.minX, y: labelDateSortie.frame.maxY + 8 , width: 29, height: 20))
        let realisateur = UILabel(frame: CGRect(x: labelRealisateur.frame.maxX + 3, y: labelDateSortie.frame.maxY + 8, width: 56, height: 20))
        
        let labelDuree = UILabel(frame: CGRect(x: realisateur.frame.maxX + 8, y: labelDateSortie.frame.maxY + 8, width: 53, height: 20))
        let duree = UILabel(frame: CGRect(x: labelDuree.frame.maxX + 3, y: labelDuree.frame.minY, width: 34, height: 20))

        let labelAvec = UILabel(frame : CGRect(x: labelRealisateur.frame.minX, y: labelRealisateur.frame.maxY + 8, width: 45, height: 20))
        let avec = UITextView(frame : CGRect(x: labelAvec.frame.maxX + 3, y: labelAvec.frame.minY, width: 300, height: 20))
        
        let labelSynopsis = UILabel(frame : CGRect(x: labelAvec.frame.minX, y: labelAvec.frame.maxY + 24, width: 82, height: 25))
        let synopsis = UITextView(frame : CGRect(x: labelSynopsis.frame.minX, y: labelSynopsis.frame.maxY + 8 , width: 327, height: 140))
        
        let labelBandeAnnonce = UILabel(frame: CGRect(x: 24, y: 617, width: 144, height: 25))
        let videoPlayer = YouTubePlayerView(frame: CGRect(x: 24, y: 650, width: 327, height: 184))
   
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json["results"][0]["key"])
                videoPlayer.loadVideoID("\(json["results"][0]["key"])")
                
            case .failure(let error):
                print(error)
            }
        }
        
        
        exitButton.addTarget(self, action:#selector(closeDetails), for: .touchUpInside)
        exitButton.setTitle("exit", for: .normal)

        avec.isEditable = false
        avec.isScrollEnabled = false
        synopsis.isScrollEnabled = false
        synopsis.isEditable = false

        
        
        image.af_setImage(withURL: URL(string :"https://image.tmdb.org/t/p/w300" + (movie?.image)!)!)
        poster.af_setImage(withURL: URL(string :"https://image.tmdb.org/t/p/w300" + (movie?.poster)!)!)
        labelFilm.text = movie?.name
        dateSortie.text = movie?.date
        realisateur.text = movie!.realisateurs[0].name
        duree.text = "\(movie!.duree)"
        avec.text = "\(movie!.acteurs[0].nameActor), \(movie!.acteurs[1].nameActor), \(movie!.acteurs[2].nameActor)"
        synopsis.text = movie?.synopsis
        labelGenre.text = movie?.genres[0].name
        

        
        labelDateSortie.text = "Date de sortie :"
        labelRealisateur.text = "De :"
        labelDuree.text = "Durée :"
        labelAvec.text = "Avec :"
        labelSynopsis.text = "Synopsis"
        labelBandeAnnonce.text = "Bande Annonce"
        
        labelFilm.font = UIFont(name: "circular", size: 23)
        labelDateSortie.font = UIFont(name: "circular", size: 16)
        dateSortie.font = UIFont(name: "circular", size: 16)
        labelRealisateur.font = UIFont(name: "circular", size: 16)
        realisateur.font = UIFont(name: "circular", size: 16)
        labelDuree.font = UIFont(name: "circular", size: 16)
        duree.font = UIFont(name: "circular", size: 16)
        labelAvec.font = UIFont(name: "circular", size: 16)
        avec.font = UIFont(name: "circular", size: 16)
        labelSynopsis.font = UIFont(name: "circular", size: 20)
        labelBandeAnnonce.font = UIFont(name: "circular", size: 20)
        synopsis.font = UIFont(name: "circular", size: 16)
        labelGenre.font = UIFont(name: "circular", size: 16)


        labelDateSortie.textColor = UIColor(red:0.37, green:0.33, blue:0.39, alpha:1.0)
        labelRealisateur.textColor = UIColor(red:0.37, green:0.33, blue:0.39, alpha:1.0)
        labelDuree.textColor = UIColor(red:0.37, green:0.33, blue:0.39, alpha:1.0)
        labelAvec.textColor = UIColor(red:0.37, green:0.33, blue:0.39, alpha:1.0)
        synopsis.textColor = UIColor(red:0.37, green:0.33, blue:0.39, alpha:1.0)
        labelSynopsis.textColor = UIColor.black
        labelFilm.textColor = UIColor.white
        
 
        
        self.scrollViewDetailMovie.addSubview(image)
        self.scrollViewDetailMovie.addSubview(poster)
        self.scrollViewDetailMovie.addSubview(labelFilm)
        self.scrollViewDetailMovie.addSubview(exitButton)
        self.scrollViewDetailMovie.addSubview(labelDateSortie)
        self.scrollViewDetailMovie.addSubview(dateSortie)
        self.scrollViewDetailMovie.addSubview(labelRealisateur)
        self.scrollViewDetailMovie.addSubview(realisateur)
        self.scrollViewDetailMovie.addSubview(labelDuree)
        self.scrollViewDetailMovie.addSubview(duree)
        self.scrollViewDetailMovie.addSubview(labelAvec)
        self.scrollViewDetailMovie.addSubview(avec)
        self.scrollViewDetailMovie.addSubview(labelBandeAnnonce)
        self.scrollViewDetailMovie.addSubview(synopsis)
        self.scrollViewDetailMovie.addSubview(labelSynopsis)
        self.scrollViewDetailMovie.addSubview(videoPlayer)
        self.scrollViewDetailMovie.addSubview(labelGenre)

        self.setSizeView(View: avec)
        labelSynopsis.frame = CGRect(x: labelAvec.frame.minX, y: avec.frame.maxY + 24, width: 82, height: 25)
        self.setSizeView(View: synopsis)
        self.setSizeView(View: realisateur)
        self.setSizeView(View: dateSortie)
        self.setSizeView(View: duree)
        
        avec.frame = CGRect(x: labelAvec.frame.maxX + 3, y: labelAvec.frame.minY + 8, width: avec.frame.width, height: avec.frame.height)
        labelBandeAnnonce.frame = CGRect(x: labelBandeAnnonce.frame.minX, y: synopsis.frame.maxY + 24, width: labelBandeAnnonce.frame.width, height: labelBandeAnnonce.frame.height)
        labelDuree.frame = CGRect(x: realisateur.frame.maxX + 8, y: labelDuree.frame.minY, width: labelDuree.frame.width, height: labelDuree.frame.height)
        duree.frame = CGRect(x: labelDuree.frame.maxX + 3, y: duree.frame.minY, width: 34, height: 20)
        synopsis.frame = CGRect(x: labelSynopsis.frame.minX, y: labelSynopsis.frame.maxY + 8 , width: 327, height: 140)
        videoPlayer.frame = CGRect(x: videoPlayer.frame.minX, y: labelBandeAnnonce.frame.maxY + 8, width: 327, height: 184)
        
        
//        self.scrollViewDetailMovie.contentSize = CGSize(width: self.scrollViewDetailMovie.frame.width, height: 10000)
        
        self.scrollViewDetailMovie.isScrollEnabled = true
        self.setContentSize(scrollView: self.scrollViewDetailMovie)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    func setSizeView(View:UIView) // Change la taille d'une vue en fonction de son contenu
    {
        let fixedWidth = View.frame.size.width
        View.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = View.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = View.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height )
        View.frame = newFrame;
    }
    
    
    func setContentSize(scrollView: UIScrollView) // Change la taille d'une scrollView en fonction de son contenu
    {
        var contentRect = CGRect()
        for view in scrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
    }
    
    func play(player: YouTubePlayerView) {
        player.play()
    }

    func closeDetails()  {
        dismiss(animated: true, completion: nil)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
