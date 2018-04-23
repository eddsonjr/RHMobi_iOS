//
//  CV.swift
//  RHMobi
//
//  Created by Edson  Jr on 16/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData


class CV {
    
    var id: String
    var dataCriacao: String
    var url: String //verificar se é aplicavel
    
    
    //Construtores
    init(id: String, dataCriacao: String, url: String) {
        self.id = id
        self.dataCriacao = dataCriacao
        self.url = url
    }
    
    //TODO - FAZER FUNCOES DE ENCODE E DECODE
    
    
    
    
}
