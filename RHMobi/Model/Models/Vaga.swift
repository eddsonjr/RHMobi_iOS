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



class Vaga {
    
   var id: Int
   var nome: String
   var tipoContrato: String
   var funcao: String
   var experiencia: String
   var prazo: String //Mudar posteriormente para um tipo de dados de data
   var descricao: String
   var requisitos: [Requisitos]
   var areasInteresse: [AreasInteresse]
   var imgUrl: String
   var vagaStatus: StatusVaga
   var cliente: Cliente
    
    
    //Construtores
    
    //Construtor completo
    init(id: Int, nome: String, tipoContrato: String, funcao: String, experiencia: String,
         prazo: String, descricao: String, requisitos: [Requisitos], areasInteresse: [AreasInteresse], imgUrl: String, vagaStatus: StatusVaga, cliente: Cliente) {
        
        
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
    
    
  
    
    
    //Mark: Metodo para decodificar objeto atraves de json
    static func decode(fromJson: JSON?) -> Any? {
        
        var requisitosSet = [Requisitos]()
        var areasInteresseSet = [AreasInteresse]()
        
        //Decodifica o set de requisitos
        for (_, subJson):(String, JSON) in JSON(fromJson!["requisitos"]) {
            requisitosSet.append(Requisitos.decode(fromJson: subJson) as! Requisitos)
        }
        
        //Decodifica o set de areas de interesse
        for (_, subJson):(String, JSON) in JSON(fromJson!["areasInteresse"]) {
            areasInteresseSet.append(AreasInteresse.decode(fromJson: subJson) as! AreasInteresse)
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



