//
//  Acteurs.swift
//  One Night Movie
//
//  Created by Simon Chrétien on 16/02/2017.
//  Copyright © 2017 Simon Chrétien. All rights reserved.
//

import Foundation
import SwiftyJSON

class Acteurs {
    var id:Int
    var nameCharacter:String
    var nameActor:String
    
    
    init?(fromData acteursData:[String:AnyObject]) {
        guard let id = acteursData["id"] as? Int,
            let nameCharacter = acteursData["character"] as? String,
            let nameActor = acteursData["name"] as? String
            else {
                return nil
        }
        self.nameActor = nameActor
        self.nameCharacter = nameCharacter
        self.id = id
    }
    
    
}


class Realisateurs {
    var id:Int
    var name:String
    
    init?(fromData realisateursData:[String:AnyObject]) {
        guard let id = realisateursData["id"] as? Int,
            let name = realisateursData["name"] as? String
            else {
                return nil
        }
        self.name = name
        self.id = id
    }
    
}
