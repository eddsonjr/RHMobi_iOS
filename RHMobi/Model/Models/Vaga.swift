//
//  Vaga.swift
//  RHMobi
//
//  Created by Edson  Jr on 12/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON



class Vaga: NSManagedObject {
    
    @ NSManaged var id: Int
    @ NSManaged var nome: String
    @ NSManaged var tipoContrato: String
    @ NSManaged var funcao: String
    @ NSManaged var experiencia: String
    @ NSManaged var prazo: String //Mudar posteriormente para um tipo de dados de data
    @ NSManaged var descricao: String
    @ NSManaged var requisitos: Set<Requisitos>
    @ NSManaged var areasInteresse: Set<AreasInteresse>
    @ NSManaged var imgUrl: String
    @ NSManaged var vagaStatus: StatusVaga
    @ NSManaged var cliente: Cliente
    
    
    //Construtores
    
    //Construtor completo
    init(id: Int, nome: String, tipoContrato: String, funcao: String, experiencia: String,
         prazo: String, descricao: String, requisitos: Set<Requisitos>, areasInteresse: Set<AreasInteresse>, imgUrl: String, vagaStatus: StatusVaga, cliente: Cliente) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Vaga", in: CoreDataHelper.getContext())!
        super.init(entity: entity, insertInto: CoreDataHelper.getContext())
        
        
        self.id = id
        self.nome = nome
        self.tipoContrato = tipoContrato
        self.funcao = funcao
        self.experiencia = experiencia
        self.prazo = prazo
        self.descricao = descricao
        self.requisitos = requisitos
        self.areasInteresse = areasInteresse
        self.imgUrl = imgUrl
        self.vagaStatus = vagaStatus
        self.cliente = cliente
        
    }
    
    
    //Construtor simples sem o relacionamento com as outras entidades
    init(id: Int, nome: String, tipoContrato: String, funcao: String, experiencia: String,
         prazo: String, descricao: String,imgUrl: String) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Vaga", in: CoreDataHelper.getContext())!
        super.init(entity: entity, insertInto: CoreDataHelper.getContext())
        
        
        self.id = id
        self.nome = nome
        self.tipoContrato = tipoContrato
        self.funcao = funcao
        self.experiencia = experiencia
        self.prazo = prazo
        self.descricao = descricao
        self.imgUrl = imgUrl
        
    }
    

    
    @objc //Obrigado a colocar esse init para nao dar erro com o protocolo de NSObjectmanaged
    private override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    
    
    
    //Mark: Metodo para decodificar objeto atraves de json
    static func decode(fromJson: JSON?) -> Any? {
        
        var requisitosSet = Set<Requisitos>()
        var areasInteresseSet = Set<AreasInteresse>()
        
        //Decodifica o set de requisitos
        for (_, subJson):(String, JSON) in JSON(fromJson!["requisitos"]) {
            requisitosSet.insert(Requisitos.decode(fromJson: subJson) as! Requisitos)
        }
        
        //Decodifica o set de areas de interesse
        for (_, subJson):(String, JSON) in JSON(fromJson!["areasInteresse"]) {
            areasInteresseSet.insert(AreasInteresse.decode(fromJson: subJson) as! AreasInteresse)
        }

        let statusVagaSubjson = fromJson!["vagaStatus"] as JSON
        let clienteSubjson = fromJson!["cliente"]  as JSON
        
        let statusVaga = StatusVaga.decode(fromJson: statusVagaSubjson) as! StatusVaga
        let cliente = Cliente.decode(fromJson: clienteSubjson) as! Cliente
        
        
        let vaga = Vaga(id: fromJson!["id"].int!, nome: fromJson!["nome"].string!, tipoContrato: fromJson!["tipoContrato"].string!,
                        funcao: fromJson!["funcao"].string!, experiencia: fromJson!["experiencia"].string!,
                        prazo: fromJson!["prazo"].string!, descricao:  fromJson!["descricao"].string!, requisitos: requisitosSet,
                        areasInteresse: areasInteresseSet, imgUrl: fromJson!["imgUrl"].string!, vagaStatus: statusVaga,
                        cliente: cliente)
        
        

        
        return vaga
    }
    
    
}



extension Vaga {
    
}
