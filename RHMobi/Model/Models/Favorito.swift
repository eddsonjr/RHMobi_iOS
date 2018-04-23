//
//  Favorito.swift
//  RHMobi
//
//  Created by Edson  Jr on 23/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit



class Favorito {
    
    var idCandidato: String?
    var vagasFavoritadas: [Vaga]?
    
    //Construtores
    init(idCandidato: String, vagasFavoritadas: [Vaga]) {
        self.idCandidato = idCandidato
        self.vagasFavoritadas = vagasFavoritadas
    }
}
