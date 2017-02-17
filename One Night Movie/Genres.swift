//
//  Genres.swift
//  One Night Movie
//
//  Created by Simon Chrétien on 30/01/2017.
//  Copyright © 2017 Simon Chrétien. All rights reserved.
//

import Foundation
import SwiftyJSON

class Genres {
    var id:Int
    var name:String
    var button:UIButton?
    
    init?(fromData genresData:[String:AnyObject]) {
        guard let id = genresData["id"] as? Int,
            let name = genresData["name"] as? String
            else {
                return nil
        }
        self.name = name
        self.id = id
    }
    

}
