//
//  StatusCV.swift
//  RHMobi
//
//  Created by Edson  Jr on 16/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation

class StatusCV: Decodable,Encodable {
    
    var id: Int
    var nome: String
    
    init(id: Int, nome: String) {
        self.id = id
        self.nome = nome
    }
    
    
}
