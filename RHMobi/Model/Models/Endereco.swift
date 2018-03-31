//
//  Endereco.swift
//  RHMobi
//
//  Created by Edson  Jr on 15/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

class Endereco: NSManagedObject {
    
    @NSManaged var bairro: String
    @NSManaged var logradouro: String
    @NSManaged var cep: String
    @NSManaged var cidade: String
    @NSManaged var estado: String
    

    
    //Construtores
    
    //Construtor completo
    init(bairro: String, logradouro: String, cep: String,cidade: String, estado: String) {
        let entity = NSEntityDescription.entity(forEntityName: "Endereco", in: CoreDataHelper.getContext())!
        super.init(entity: entity, insertInto: CoreDataHelper.getContext())
        
        self.bairro = bairro
        self.logradouro = logradouro
        self.cep = cep
        self.cidade = cidade
        self.estado = estado
    }
    
    
    @objc //Obrigado a colocar esse init para nao dar erro com o protocolo de NSObjectmanaged
    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    
    
    //Mark: Metodo de codificacao via json: Recebe um json e retonra
    static func decode(fromJson: JSON?) -> Any? {
        return Endereco(bairro: fromJson!["bairro"].string!, logradouro: fromJson!["logradouro"].string!, cep: fromJson!["cep"].string!, cidade: fromJson!["cidade"].string!, estado: fromJson!["estado"].string!)
    }
    
}
