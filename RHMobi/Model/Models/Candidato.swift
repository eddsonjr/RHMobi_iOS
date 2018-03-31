//
//  Candidatos.swift
//  RHMobi
//
//  Created by Edson  Jr on 16/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData

class Candidato: NSManagedObject {
    
    @NSManaged var id: Int
    @NSManaged var nome: String
    @NSManaged var sobrenome: String
    @NSManaged var email: String
    @NSManaged var senha: String
    @NSManaged var rg: String
    @NSManaged var telefone1: String
    @NSManaged var telefone2: String
    @NSManaged var sexo: String
    @NSManaged var vagasAssociadas: Set<Vaga>?
    @NSManaged var cv: CV?
    
    //Construtores
    //Construtor padrao
    init() {
        
        
        let entity = NSEntityDescription.entity(forEntityName: "Candidato", in: CoreDataHelper.getContext())!
        super.init(entity: entity, insertInto: CoreDataHelper.getContext())
        
        self.id = 0
        self.nome = ""
        self.sobrenome = ""
        self.email = ""
        self.sexo = ""
        self.senha = ""
        self.rg = ""
        self.telefone1 = ""
        self.telefone2 = ""
        self.vagasAssociadas = nil
        self.cv = nil
    }
    
    
    //Construtor com itens
    init(id: Int, nome: String, sobrenome: String, email: String, senha: String, rg: String, telefone1: String, telefone2: String, sexo: String,vagasAssociadas: Set<Vaga>?, cv: CV?) {
        
        
        let entity = NSEntityDescription.entity(forEntityName: "Candidato", in: CoreDataHelper.getContext())!
        super.init(entity: entity, insertInto: CoreDataHelper.getContext())
        
        self.id = id
        self.nome = nome
        self.sobrenome = sobrenome
        self.email = email
        self.senha = senha
        self.rg = rg
        self.telefone1 = telefone1
        self.telefone2 = telefone2
        self.sexo = sexo
        self.vagasAssociadas = vagasAssociadas
        self.cv = cv
        
    }
    
    
    @objc //Obrigado a colocar esse init para nao dar erro com o protocolo de NSObjectmanaged
    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    
}
