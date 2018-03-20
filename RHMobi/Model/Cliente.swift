//
//  Cliente.swift
//  RHMobi
//
//  Created by Edson  Jr on 16/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation

class Cliente: Decodable, Encodable {
    var id: Int
    var cnpj: String
    var razaoSocial: String
    var ramoAtuacao: String
    var endereco: Endereco
    
    
    init(id: Int, cnpj: String, razaoSocial: String, ramoAtuacao: String,
         endereco: Endereco) {
        self.id = id
        self.cnpj = cnpj
        self.razaoSocial = razaoSocial
        self.ramoAtuacao = ramoAtuacao
        self.endereco = endereco
    }
    
    
}
