//
//  CV.swift
//  RHMobi
//
//  Created by Edson  Jr on 16/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData


class CV: NSManagedObject {
    
    @NSManaged var id: Int
    @NSManaged var dataCriacao: String
    @NSManaged var url: String //verificar se é aplicavel
    @NSManaged var statusCV: StatusCV
    
    
    //Construtores
    
    //Construto completo
    init(id: Int, dataCriacao: String, url: String, statusCV: StatusCV) {
        
        let entity = NSEntityDescription.entity(forEntityName: "CV", in: CoreDataHelper.getContext())!
        super.init(entity: entity, insertInto: CoreDataHelper.getContext())
        
        
        
        self.id = id
        self.dataCriacao = dataCriacao
        self.url = url
        self.statusCV = statusCV
    }
    
    
    
    @objc //Obrigado a colocar esse init para nao dar erro com o protocolo de NSObjectmanaged
    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    
    
    
    
}
