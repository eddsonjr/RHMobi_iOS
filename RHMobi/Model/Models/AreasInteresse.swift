//
//  AreasInteresse.swift
//  RHMobi
//
//  Created by Edson  Jr on 12/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON


class AreasInteresse: NSObject{
    
   var id: String
   var nome: String
    
    
    //Construtores
    init(id: String, nome: String) {
       
        self.id = id
        self.nome = nome
    }
    
    
    
    
    //Mark: Metodo de decode from json
    static func decode(fromJson: JSON?) -> Any? {
        return AreasInteresse(id: fromJson!["id"].string!, nome: fromJson!["nome"].string!)
        
    }
    
    
}
