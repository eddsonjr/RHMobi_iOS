//
//  Candidatos.swift
//  RHMobi
//
//  Created by Edson  Jr on 16/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData

class Candidato {
    
    var id: Int
    var nome: String
    var sobrenome: String
    var email: String
    var senha: String
    var cpf: String
    var telefone1: String
    var telefone2: String
    var sexo: String
    var vagasAssociadas: [Vaga]?
    var cv: CV?
    
    //Construtores
    //Construtor padrao
    init() {
        
        
       
        self.id = 0
        self.nome = ""
        self.sobrenome = ""
        self.email = ""
        self.sexo = ""
        self.senha = ""
        self.cpf = ""
        self.telefone1 = ""
        self.telefone2 = ""
        self.vagasAssociadas = nil
        self.cv = nil
    }
    
    
    //Construtor com itens
    init(id: Int, nome: String, sobrenome: String, email: String, senha: String, cpf: String, telefone1: String, telefone2: String, sexo: String,vagasAssociadas: [Vaga]?, cv: CV?) {
        
      
        
        self.id = id
        self.nome = nome
        self.sobrenome = sobrenome
        self.email = email
        self.senha = senha
        self.cpf = cpf
        self.telefone1 = telefone1
        self.telefone2 = telefone2
        self.sexo = sexo
        self.vagasAssociadas = vagasAssociadas
        self.cv = cv
        
    }
    
    
    //TODO - FALTA IMPLEMENTAR O DECODE DO CANDIDATO
    
}
