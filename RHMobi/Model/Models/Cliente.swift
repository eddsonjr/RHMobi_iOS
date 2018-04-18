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

class Cliente: NSObject {
    
    var id: String
    var cnpj: String
    var razaoSocial: String
    var ramoAtuacao: String
    var bairro: String
    var logradouro: String
    var cep: String
    var cidade: String
    var estado: String
    
    
    //Construtores
    //Construtor completo
    init(id: String, cnpj: String, razaoSocial: String, ramoAtuacao: String, logradouro: String, bairro: String,
         cep: String, cidade: String, estado: String) {
      
        
        self.id = id
        self.cnpj = cnpj
        self.razaoSocial = razaoSocial
        self.ramoAtuacao = ramoAtuacao
        self.logradouro = logradouro
        self.bairro = bairro
        self.cep = cep
        self.cidade = cidade
        self.estado = estado
       
    }
    
    
    
  
    //Mark: Metodo de decodificacao via json
    static func decode(fromJson: JSON?) -> Any? {
    
        let subjsonEndereco = fromJson!["endereco"] as JSON
        let cliente = Cliente.init(id: fromJson!["id"].string!, cnpj: fromJson!["cnpj"].string!,
                                   razaoSocial: fromJson!["razaoSocial"].string!,
                                   ramoAtuacao: fromJson!["ramoAtuacao"].string!,
                                   logradouro: fromJson!["logradouro"].string!,
                                   bairro: fromJson!["bairro"].string!,
                                   cep: fromJson!["cep"].string!,
                                   cidade: fromJson!["cidade"].string!,
                                   estado: fromJson!["estado"].string!)

        return cliente
        
    }
    
    
}
