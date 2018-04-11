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
    var celular: String
    var convencional: String
    var sexo: String
    var vagasAssociadas: [Vaga]?
    var areasInteresse: [AreasInteresse]?
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
        self.celular = ""
        self.convencional = ""
        self.vagasAssociadas = nil
        self.cv = nil
        self.areasInteresse = nil
    }
    
    
    //Construtor com itens
    init(id: Int, nome: String, sobrenome: String, email: String, senha: String, cpf: String, celular: String, convencional: String, sexo: String,vagasAssociadas: [Vaga]?, cv: CV?, areasInteresse: [AreasInteresse]?) {
        
      
        
        self.id = id
        self.nome = nome
        self.sobrenome = sobrenome
        self.email = email
        self.senha = senha
        self.cpf = cpf
        self.celular = celular
        self.convencional = convencional
        self.sexo = sexo
        self.vagasAssociadas = vagasAssociadas
        self.cv = cv
        self.areasInteresse = areasInteresse
        
    }
    
    
    //TODO - FALTA IMPLEMENTAR O DECODE DO CANDIDATO
    
}
