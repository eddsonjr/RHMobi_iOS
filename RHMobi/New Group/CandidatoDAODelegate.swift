//
//  CandidatoDAODelegate.swift
//  RHMobi
//
//  Created by Edson  Jr on 20/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit

protocol CandidatoDAODelegate{
    
    func salvar(candidato: Candidato)
    func listarTodos() -> [Candidato]?
    func apagarCandidato(id: Int)
    func procurarCandidato(id: Int) -> Candidato
    func removerTodos()
    
    
}

