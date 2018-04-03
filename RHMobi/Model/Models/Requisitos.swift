//
//  Requisitos.swift
//  RHMobi
//
//  Created by Edson  Jr on 12/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

class Requisitos {
    
   var id: Int
   var nome: String
    
    
    //Construtores
    //Construtor completo
    init(id: Int, nome: String) {
        
        self.id = id
        self.nome = nome
    }
    
    
    
    
    //Mark: Metodo de decode from json
    static func decode(fromJson: JSON?) -> Any? {
        return Requisitos(id: fromJson!["id"].int!, nome: fromJson!["nome"].string!)
        
    }
    
    
    
}
