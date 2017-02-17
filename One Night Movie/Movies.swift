//
//  Movies.swift
//  One Night Movie
//
//  Created by Simon Chrétien on 31/01/2017.
//  Copyright © 2017 Simon Chrétien. All rights reserved.
//

import Foundation
import SwiftyJSON


class Movies {
    var id:Int
    var name:String
    var date:String
    var genres:[Genres]
    var synopsis:String
    var poster:String
    var image:String
    var duree:Int
    var acteurs:[Acteurs]
    var realisateurs:[Realisateurs]
    
    init?(fromData moviesData:[String:AnyObject]) {
        var listGenres = [Genres]()
        for item in (moviesData["genres"] as? [[String: AnyObject]])! {
            if let genre = Genres(fromData: item) {
                listGenres.append(genre)
            }
        }
        
        var listActeurs = [Acteurs]()
        for item in (moviesData["acteurs"] as? [[String: AnyObject]])! {
            if let acteur = Acteurs(fromData: item) {
                listActeurs.append(acteur)
            }
        }
        
        var listRealisateurs = [Realisateurs]()
        for item in (moviesData["realisateurs"] as? [[String: AnyObject]])! {
            if let realisateur = Realisateurs(fromData: item) {
                listRealisateurs.append(realisateur)
            }
        }
        
        guard let id = moviesData["id"] as? Int,
            let name = moviesData["original_title"] as? String,
            let date = moviesData["release_date"] as? String,
            let synopsis = moviesData["overview"] as? String,
            let poster = moviesData["poster_path"] as? String,
            let image = moviesData["backdrop_path"] as? String,
            let duree = moviesData["runtime"] as? Int
            
            else {
                return nil
        }
        self.name = name
        self.id = id
        self.date = date
        self.genres = listGenres
        self.acteurs = listActeurs
        self.realisateurs = listRealisateurs
        self.synopsis = synopsis
        self.poster = poster
        self.image = image
        self.duree = duree
    }
    

    
}
