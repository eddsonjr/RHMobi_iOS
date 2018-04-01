//
//  Cliente.swift
//  RHMobi
//
//  Created by Edson  Jr on 16/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

class Cliente: NSManagedObject {
    
    @NSManaged var id: Int
    @NSManaged var cnpj: String
    @NSManaged var razaoSocial: String
    @NSManaged var ramoAtuacao: String
    @NSManaged var endereco: Endereco
    
    
    //Construtores
    //Construtor completo
    init(id: Int, cnpj: String, razaoSocial: String, ramoAtuacao: String,
         endereco: Endereco) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Cliente", in: CoreDataHelper.getContext())!
        super.init(entity: entity, insertInto: CoreDataHelper.getContext())
        
        self.id = id
        self.cnpj = cnpj
        self.razaoSocial = razaoSocial
        self.ramoAtuacao = ramoAtuacao
        self.endereco = endereco
    }
    
    
    //Construtor sem relacao com a entidade Endereco
    
    init(id: Int, cnpj: String, razaoSocial: String, ramoAtuacao: String) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Cliente", in: CoreDataHelper.getContext())!
        super.init(entity: entity, insertInto: CoreDataHelper.getContext())
        
        self.id = id
        self.cnpj = cnpj
        self.razaoSocial = razaoSocial
        self.ramoAtuacao = ramoAtuacao
        
    }
    
    
    @objc //Obrigado a colocar esse init para nao dar erro com o protocolo de NSObjectmanaged
    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    
    //Mark: Metodo de decodificacao via json
    static func decode(fromJson json: JSON?) -> Any? {
     
        let endereco = Endereco.decode(fromJson: json) as? Endereco
        
        let cliente = Cliente.init(id: json!["id"].int!, cnpj: json!["cnpj"].string!,
                                   razaoSocial: json!["razaoSocial"].string!, ramoAtuacao: json!["ramoAtuacao"].string!,
                                   endereco: endereco!)
        
        
        return cliente
        
    }
    
    
}
