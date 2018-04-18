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



class Vaga: NSObject {
    
   var id: String
   var nome: String
   var tipoContrato: String
   var funcao: String
   var experiencia: String
   var prazo: String
   var descricao: String
   var requisitos: String
   var areasInteresse: [AreasInteresse]
   var imgUrl: String
   var vagaStatus: String
   var cliente: Cliente
   
    
    
    //Construtores
    
    
    //Construtor completo
    init(id: String, nome: String, tipoContrato: String, funcao: String, experiencia: String,
         prazo: String, descricao: String, requisitos: String, areasInteresse: [AreasInteresse], imgUrl: String, vagaStatus: String, cliente: Cliente) {
        
        
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
        
       
        var areasInteresseSet = [AreasInteresse]()

        
        //Decodifica o set de areas de interesse
        for (_, subJson):(String, JSON) in JSON(fromJson!["areasInteresse"]) {
            areasInteresseSet.append(AreasInteresse.decode(fromJson: subJson) as! AreasInteresse)
        }

        let clienteSubjson = fromJson!["cliente"] as JSON
        
        let cliente = Cliente.decode(fromJson: clienteSubjson) as! Cliente
        
        
        let vaga = Vaga(id: fromJson!["id"].string!, nome: fromJson!["nome"].string!, tipoContrato: fromJson!["tipoContrato"].string!,
                        funcao: fromJson!["funcao"].string!, experiencia: fromJson!["experiencia"].string!,
                        prazo: fromJson!["prazo"].string!, descricao:  fromJson!["descricao"].string!, requisitos: fromJson!["requisitos"].string!,
                        areasInteresse: areasInteresseSet, imgUrl: fromJson!["imgUrl"].string!,
                        vagaStatus: fromJson!["vagaStatus"].string!,
                        cliente: cliente)
        return vaga
    }
    
    
}



