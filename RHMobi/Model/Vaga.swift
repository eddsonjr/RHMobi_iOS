//
//  Vaga.swift
//  RHMobi
//
//  Created by Edson  Jr on 12/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation


class Vaga: Decodable,Encodable {
    
    var id: Int
    var nome: String
    var tipoContrato: String
    var endereco: Endereco
    var funcao: String
    var experiencia: String
    var prazo: String //Mudar posteriormente para um tipo de dados de data
    var descricao: String
    var requisitos: [Requisitos]
    var areasInteresse: [AreasInteresse]
    var imgUrl: String
    var vagaStatus: StatusVaga
    
    
    
    init(id: Int, nome: String, tipoContrato: String,endereco: Endereco, funcao: String, experiencia: String,
         prazo: String, descricao: String, requisitos: [Requisitos], areasInteresse: [AreasInteresse], imgUrl: String, vagaStatus: StatusVaga) {
        
        self.id = id
        self.nome = nome
        self.tipoContrato = tipoContrato
        self.funcao = funcao
        self.endereco = endereco
        self.experiencia = experiencia
        self.prazo = prazo
        self.descricao = descricao
        self.requisitos = requisitos
        self.areasInteresse = areasInteresse
        self.imgUrl = imgUrl
        self.vagaStatus = vagaStatus
        
    }
    
    
}
