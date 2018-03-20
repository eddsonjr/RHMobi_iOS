//
//  Endereco.swift
//  RHMobi
//
//  Created by Edson  Jr on 15/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation

class Endereco: Decodable,Encodable {
    
    var bairro: String
    var logradouro: String
    var cep: String
    var cidade: String
    var estado: String
    
    
    //construtor
    init(bairro: String, logradouro: String, cep: String,cidade: String, estado: String) {
        self.bairro = bairro
        self.logradouro = logradouro
        self.cep = cep
        self.cidade = cidade
        self.estado = estado
    }
    
}
