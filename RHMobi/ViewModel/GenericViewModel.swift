//
//  GenericViewModel.swift
//  RHMobi
//
//  Created by Edson  Jr on 09/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Alamofire
import SwiftyJSON



/*
 Esta classe contem metodos que serao usados mais de uma vez no aplicativo, servindo como uma
 view model generica, que sera herdada por outras view model
 */
class GenericViewModel: NSObject {
    
    
    //Mark: Lista de atributos
    var url: String? //Url responsavel para envio e recebimento de dados via json
    
    override init() {
        
    }
    
    
    //Mark: construtores
    init(url: String) { //Construtor basico para envio e recebimento de dados via json
        self.url = url
    }
    
    
    //Mark: Metodos de envio e recebimento de dados via json
    func getDataFromJson(completion: @escaping (JSON?) -> Void) { //recebe dados via json
        Alamofire.request(url!).responseJSON { (responseData) -> Void in
            switch responseData.result {
            case .success(let value): DispatchQueue.main.async { completion(JSON(value)) }
            case .failure(_): completion(nil)
            }
        }
    }
    
    
    //TODO - ENVIAR DADOS JSON VIA WEB
    
    
    
    
    
    
    
    //Mark: Funcoes de validacao de campos que servirao para cadastro do usuario
    func validarNome(nome: String?) -> Bool { //valida o nome
        if(nome == "" || nome == nil){
            return false
        }else if (nome?.isAllDigits())! {
            return false
        }else{
            return true
        }
    }
    
    
    
    
    func validarSobreNome(sobrenome: String?) -> Bool { //valida o sobrenome
        if(sobrenome == "" || sobrenome == nil){
            return false
        }else if (sobrenome?.isAllDigits())! {
            return false
        }else{
            return true
        }
    }
    
    
    
    
    
    func validarSenhas(senha: String, confirmarSenha: String) -> Bool { //valida as senhas
        if(senha == confirmarSenha){
            return true
        }else{
            return false
        }
    }
    
    
    
    
    
    func validarTelefoneCelular(celular: String?) -> Bool { //valida o numero de celular
        if(celular == "" || celular == nil){
            return false
        }else if(!(celular?.isAllDigits())!){
            return false
        }else{
            return true
        }
    }
    
    
    
    func validarTelefoneConvencional(convencional: String?) -> Bool { //valida o telefone convencional
        if(convencional == "" || convencional == nil || (convencional?.isAllDigits())!){
            return true
        }else{
            return false
        }
    }
    
    
    
    func validarEmail(email: String?) -> Bool { //valida o email
        if(email == "" || email == nil) {
            return false
        }else{
            return true
        }
        
        //TODO - VALIDAR O EMAIL USANDO REGEX
    }
}
