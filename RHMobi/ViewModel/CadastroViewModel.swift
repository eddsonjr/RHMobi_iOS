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
    
    
    //Mark: Metodos de validacao de informacoes de cadastro
    func validarNome(nome: String?) throws -> String { //valida o nome
        if(nome == "" || nome == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido.rawValue
        }else if (nome?.isAllDigits()){
            throw ErrosValidacaoCadastro.dadoErrado.rawValue
        }
    }
    
    
    
    func validarSobrenome(sobrenome: String?) throws -> String { //valida o sobre nome
        if(sobrenome == "" || sobrenome == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido.rawValue
        }else if (sobrenome?.isAllDigits()){
            throw ErrosValidacaoCadastro.dadoErrado.rawValue
        }
    }
    
    
    
    func validarEmail(email: String?) throws -> String {//valida o email
        if(email == "" || email == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido.rawValue
        }//TODO - COLOCAR A VALIDACAO VIA REGEX FUNCIONANDO
    }
    
    
    func validarCPF(cpf: String?) throws -> String { //valida o cpf
        if(cpf == "" || cpf == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido
        }//TODO - FAZER VALIDACAO VIA REGEX
    }
    
    
    func validarCelular(celular: String) throws -> String { //valida o numero de celular
        if(celular == "" || celular == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido
        }else if (!celular.isAllDigits()) {
            throw ErrosValidacaoCadastro.dadoErrado
        }
    }
    
    
    func validarTelefoneFixo(convencional: String) throws -> String{ //valida o numero do telefone fixo
        if(convencional == "" || convencional == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido
        }else if(!convencional.isAllDigits()){
            throw ErrosValidacaoCadastro.dadoErrado
        }
    }
    
    
    
    func validarSenhas(senha: String, confirmacaoSenha: String) throws -> String {//valida as senhas
        if((senha == "" || senha == nil) || (confirmacaoSenha == "" || confirmacaoSenha == nil)){
            throw ErrosValidacaoCadastro.campoNaoPreenchido
        }else if(senha != confirmacaoSenha){
            throw ErrosValidacaoCadastro.dadoErrado
        }
    }
    
    
    
    
    
    
    
    
    
    func cadastrar(id: Int, nome: String, sobrenome: String, sexo: String, cpf: String,
                   email:String, senha:String,telefone1: String, telefone2: String){
        
        
        

        
        
        
        
        
        
        
         let candidato = Candidato(id: id, nome: nome, sobrenome: sobrenome, email: email, senha: senha, cpf: cpf, telefone1: telefone1, telefone2: telefone2, sexo: sexo, vagasAssociadas: nil, cv: nil)
        CandidatoDAO.saveObject(candidato: candidato)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func listarTodosOsCandidatos() -> [CandidatoEntidade]{
        return CandidatoDAO.fecthAllObjec()!
    }
    
    
    
}
