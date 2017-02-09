//
//  DetailMovieViewController.swift
//  One Night Movie
//
//  Created by Simon Chrétien on 06/02/2017.
//  Copyright © 2017 Simon Chrétien. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailMovieViewController: UIViewController {

    @IBOutlet weak var scrollViewDetailMovie: UIScrollView!
    
    var movie:Movies?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()
        
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 245))
        let poster = UIImageView(frame: CGRect(x: 24, y: 134, width: 108 , height: 162))
        let labelFilm = UILabel(frame: CGRect(x: 148, y: 177, width: 173, height: 29))
        let exitButton = UIButton(frame: CGRect(x: 16, y: 26, width: 34, height: 34))
        let synopsis = UITextView(frame : CGRect(x: 24, y: 453, width: 327, height: 140))
        let labelSynopsis = UILabel(frame : CGRect(x: 24, y: 420, width: 82, height: 25))
        let labelDateSortie = UILabel(frame: CGRect(x: 24, y: 320, width: 110, height: 20))
        let labelRealisateur = UILabel(frame: CGRect(x: 24, y: 348 , width: 29, height: 20))
        let labelDuree = UILabel(frame: CGRect(x: 135, y: 348, width: 53, height: 20))
        let labelAvec = UILabel(frame : CGRect(x: 24, y: 376, width: 45, height: 20))
        let labelBandeAnnonce = UILabel(frame: CGRect(x: 24, y: 617, width: 144, height: 25))
        
        
        
        exitButton.addTarget(self, action:#selector(closeDetails), for: .touchUpInside)
        exitButton.setTitle("exit", for: .normal)
        
        synopsis.isScrollEnabled = false
        synopsis.text = movie?.synopsis
        synopsis.isEditable = false
        self.setSizeTextView(textView: synopsis)
        
        labelDateSortie.text = "Date de sortie :"
        labelRealisateur.text = "De :"
        labelDuree.text = "Durée :"
        labelAvec.text = "Avec :"
        labelSynopsis.text = "Synopsis"
        labelBandeAnnonce.text = "Bande Annonce"
        
        labelDateSortie.font = UIFont(name: "circular", size: 16)
        labelRealisateur.font = UIFont(name: "circular", size: 16)
        labelDuree.font = UIFont(name: "circular", size: 16)
        labelAvec.font = UIFont(name: "circular", size: 16)
        labelSynopsis.font = UIFont(name: "circular", size: 20)
        labelBandeAnnonce.font = UIFont(name: "circular", size: 20)
        synopsis.font = UIFont(name: "circular", size: 16)
        
        labelDateSortie.textColor = UIColor(red:0.37, green:0.33, blue:0.39, alpha:1.0)
        labelRealisateur.textColor = UIColor(red:0.37, green:0.33, blue:0.39, alpha:1.0)
        labelDuree.textColor = UIColor(red:0.37, green:0.33, blue:0.39, alpha:1.0)
        labelAvec.textColor = UIColor(red:0.37, green:0.33, blue:0.39, alpha:1.0)
        synopsis.textColor = UIColor(red:0.37, green:0.33, blue:0.39, alpha:1.0)
        labelSynopsis.textColor = UIColor.black
        
        labelFilm.text = movie?.name
        labelFilm.font = UIFont(name: "circular", size: 23)
        labelFilm.textColor = UIColor.white
        
        
        
 
        
        image.af_setImage(withURL: URL(string :"https://image.tmdb.org/t/p/w300" + (movie?.image)!)!)
        poster.af_setImage(withURL: URL(string :"https://image.tmdb.org/t/p/w300" + (movie?.poster)!)!)
        
        
        
        
        
        
        self.scrollViewDetailMovie.addSubview(image)
        self.scrollViewDetailMovie.addSubview(poster)
        self.scrollViewDetailMovie.addSubview(labelFilm)
        self.scrollViewDetailMovie.addSubview(exitButton)
        self.scrollViewDetailMovie.addSubview(synopsis)
        self.scrollViewDetailMovie.addSubview(labelSynopsis)
        self.scrollViewDetailMovie.addSubview(labelDateSortie)
        self.scrollViewDetailMovie.addSubview(labelRealisateur)
        self.scrollViewDetailMovie.addSubview(labelDuree)
        self.scrollViewDetailMovie.addSubview(labelAvec)
        self.scrollViewDetailMovie.addSubview(labelBandeAnnonce)
        

        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeDetails() {
        self.removeAnimate()
//        self.view.removeFromSuperview()
//        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func showAnimate()  {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
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
    
    
    func setSizeTextView(textView:UITextView)
    {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame;
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
