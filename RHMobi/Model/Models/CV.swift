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
    var statusCV: StatusCV
    
    
    //Construtores
    
    //Construto completo
    init(id: String, dataCriacao: String, url: String, statusCV: StatusCV) {
    
        
        self.id = id
        self.dataCriacao = dataCriacao
        self.url = url
        self.statusCV = statusCV
    }
    
    
    
    
}
