//
//  CV.swift
//  RHMobi
//
//  Created by Edson  Jr on 16/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation


class CV: Decodable, Encodable {
    
    var id: Int
    var dataCriacao: String
    var url: String //verificar se é aplicavel
    var statusCV: StatusCV
    
    init(id: Int, dataCriacao: String, url: String, statusCV: StatusCV) {
        self.id = id
        self.dataCriacao = dataCriacao
        self.url = url
        self.statusCV = statusCV
    }
    
    
}
