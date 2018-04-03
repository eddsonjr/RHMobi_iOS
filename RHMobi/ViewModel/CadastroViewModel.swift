//
//  CadastrarLogarViewModel.swift
//  RHMobi
//
//  Created by Edson  Jr on 03/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import UIKit



class CadastroViewModel {
    
    
    func cadastrar(id: Int, nome: String, sobrenome: String, sexo: String, rg: String,
                   email:String, senha:String,telefone1: String, telefone2: String){

        
        let candidato = Candidato(id: id, nome: nome, sobrenome: sobrenome, email: email, senha: senha, rg: rg, telefone1: telefone1, telefone2: telefone2, sexo: sexo, vagasAssociadas: nil, cv: nil)
        
        CandidatoDAO.saveObject(candidato: candidato)
        
    }
    
    
    

    
    
    func listarTodosOsCandidatos() -> [CandidatoEntidade]{
        return CandidatoDAO.fecthObjec()!
    }
    
    
    
}
