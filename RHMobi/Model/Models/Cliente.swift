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
    static func decode(fromJson: JSON?) -> Any? {
    
        let subjsonEndereco = fromJson!["endereco"] as JSON
        let endereco = Endereco.decode(fromJson: subjsonEndereco) as? Endereco
        let cliente = Cliente.init(id: fromJson!["id"].int!, cnpj: fromJson!["cnpj"].string!,
                                   razaoSocial: fromJson!["razaoSocial"].string!,
                                   ramoAtuacao: fromJson!["ramoAtuacao"].string!,
                                   endereco: endereco!)

        return cliente
        
    }
    
    
}
