//
//  AreasInteresse.swift
//  RHMobi
//
//  Created by Edson  Jr on 12/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData


class AreasInteresse: NSManagedObject {
    
    @NSManaged var id: Int
    @NSManaged var nome: String
    
    
    //Construtores
    init(id: Int, nome: String) {
        let entity = NSEntityDescription.entity(forEntityName: "AreasInteresse", in: CoreDataHelper.getContext())!
        super.init(entity: entity, insertInto: CoreDataHelper.getContext())
       
        self.id = id
        self.nome = nome
    }
    
    
    
    @objc //Obrigado a colocar esse init para nao dar erro com o protocolo de NSObjectmanaged
    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    
    
}
