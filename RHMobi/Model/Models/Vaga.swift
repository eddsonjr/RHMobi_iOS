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
    var funcao: String
    var experiencia: String
    var prazo: String //Mudar posteriormente para um tipo de dados de data
    var descricao: String
    var requisitos: [Requisitos]
    var areasInteresse: [AreasInteresse]
    var imgUrl: String
    var vagaStatus: StatusVaga
    var cliente: Cliente
    
    
    
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
    
    
}