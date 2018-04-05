//
//  LoginViewModel.swift
//  RHMobi
//
//  Created by Edson  Jr on 04/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class LoginViewModel{
    
    private final let  dbgmsg = "[LoginViewModel]: "
    
    
    //TODO - TROCAR ESSE METODO PARA PEGAR VIA BANCO AO INVES DE VIA USER DEFAULTS
    func getEmailUsuarioLogin() -> String{
        let emailUsuarioDoUserDefaults = UserDefaults.standard.getUserEmail
        return emailUsuarioDoUserDefaults()
    }
    
    
    func logar(email: String, senha: String) -> Bool{
        if CandidatoDAO.fectchCandidato(email: email, senha: senha) {
            print(dbgmsg + "Usuario encontrado!")
            return true
        }else{
            print(dbgmsg + "Usuario nao encontrado!")
            return false
        }
    }
    
    
    func getAllCandidatos() {
        let candidatos = CandidatoDAO.fecthObjec()
        
        for c in candidatos! {
            print(dbgmsg + "Candidato nome: \(c.nome)")
            
        }
    }

    
}
