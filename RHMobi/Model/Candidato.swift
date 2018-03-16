//
//  Candidatos.swift
//  RHMobi
//
//  Created by Edson  Jr on 16/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation

class Candidato: Decodable, Encodable {
    
    var id: Int?
    var nome: String?
    var sobrenome: String?
    var email: String?
    var senha: String?
    var rg: String
    var telefone1: String?
    var telefone2: String?
    var sexo: Character?
    var vagasAssociadas: [Vaga]?
    
    
    init(id: Int?, nome: String?, sobrenome: String?, email: String?, senha: String?, rg: String?, telefone1: String?, telefone2: String?, sexo: Character?) {
        
        self.id = id
        self.nome = nome
        self.sobrenome = sobrenome
        self.email = email
        self.senha = senha
        self.rg = rg
        self.telefone1 = telefone1
        self.telefone2 = telefone2
        self.sexo = sexo
    }
    
    
}
