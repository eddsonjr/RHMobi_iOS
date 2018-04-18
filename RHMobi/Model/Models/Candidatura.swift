//
//  Candidatura.swift
//  RHMobi
//
//  Created by Edson  Jr on 18/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData

class Candidatura: NSObject {
    
    var idVaga: String
    var idCandidato: String
    var statusCV: String
    
    init(idVaga: String, idCandidato: String, statusCV: String) {
        self.idVaga = idVaga
        self.idCandidato = idCandidato
        self.statusCV = statusCV
    }
    
    
    
    //TODO - FALTA FAZER O DECODE E O ENCODE
}
