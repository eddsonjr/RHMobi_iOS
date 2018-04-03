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

class Endereco {
    
    var bairro: String
    var logradouro: String
    var cep: String
    var cidade: String
    var estado: String
    

    
    //Construtores
    
    //Construtor completo
    init(bairro: String, logradouro: String, cep: String,cidade: String, estado: String) {
       
        
        self.bairro = bairro
        self.logradouro = logradouro
        self.cep = cep
        self.cidade = cidade
        self.estado = estado
    }
    
    
   
    
    //Mark: Metodo de codificacao via json: Recebe um json e retonra
    static func decode(fromJson: JSON?) -> Any? {
        return Endereco(bairro: fromJson!["bairro"].string!, logradouro: fromJson!["logradouro"].string!, cep: fromJson!["cep"].string!, cidade: fromJson!["cidade"].string!, estado: fromJson!["estado"].string!)
    }
    
}
