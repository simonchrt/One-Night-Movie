//
//  Movies.swift
//  One Night Movie
//
//  Created by Simon Chrétien on 31/01/2017.
//  Copyright © 2017 Simon Chrétien. All rights reserved.
//

import Foundation


class Movies {
    var id:Int
    var name:String
    var years:String
//    var genres:[Genres]
    var synopsis:String
    var poster:String
    var image:String
    init?(fromData moviesData:[String:AnyObject]) {
        guard let id = moviesData["id"] as? Int,
            let name = moviesData["original_title"] as? String,
            let years = moviesData["release_date"] as? String,
       
//          let genres = moviesData["genres"] as? Genres,
            let synopsis = moviesData["overview"] as? String,
            let poster = moviesData["poster_path"] as? String,
            let image = moviesData["backdrop_path"] as? String
            
            else {
                return nil
        }
        self.name = name
        self.id = id
        self.years = years
//        self.genres = [genres]
        self.synopsis = synopsis
        self.poster = poster
        self.image = image
    }
    
}
