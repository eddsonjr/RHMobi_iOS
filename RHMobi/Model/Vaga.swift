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
    var cargo: String
    var experiencia: String
    var prazo: String //Mudar posteriormente para um tipo de dados de data
    var descricao: String
    var requisitos: [Requisitos]
    var areasInteresse: [AreasInteresse]
    var idUsuario: Int
    var imgUrl: String
    
    
    
    init(id: Int, nome: String, tipoContrato: String, cargo: String, experiencia: String,
         prazo: String, descricao: String, requisitos: [Requisitos], areasInteresse: [AreasInteresse],
         idUsuario: Int, imgUrl: String) {
        
        
        self.id = id
        self.nome = nome
        self.tipoContrato = tipoContrato
        self.cargo = cargo
        self.experiencia = experiencia
        self.prazo = prazo
        self.descricao = descricao
        self.requisitos = requisitos
        self.areasInteresse = areasInteresse
        self.idUsuario = idUsuario
        self.imgUrl = imgUrl
        
    }
    
    
}
