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

class Requisitos: NSManagedObject {
    
    @NSManaged var id: Int
    @NSManaged var nome: String
    
    
    //Construtores
    //Construtor completo
    init(id: Int, nome: String) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Requisitos", in: CoreDataHelper.getContext())!
        super.init(entity: entity, insertInto: CoreDataHelper.getContext())
        
        self.id = id
        self.nome = nome
    }
    
    
    
    @objc //Obrigado a colocar esse init para nao dar erro com o protocolo de NSObjectmanaged
    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    
    //Mark: Metodo de decode from json
    static func decode(fromJson: JSON?) -> Any? {
        return Requisitos(id: fromJson!["id"].int!, nome: fromJson!["nome"].string!)
        
    }
    
    
    
}
