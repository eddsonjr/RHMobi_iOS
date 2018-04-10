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
    func validarNome(nome: String?) throws { //valida o nome
        if(nome == "" || nome == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido
        }else if (nome?.isAllDigits())!{
            throw ErrosValidacaoCadastro.dadoErrado
        }
    }
    
    
   func validarSobrenome(sobrenome: String?) throws{ //valida o sobre nome
        if(sobrenome == "" || sobrenome == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido
        }else if (sobrenome?.isAllDigits())!{
            throw ErrosValidacaoCadastro.dadoErrado
        }
    }
    
    
    
    func validarEmail(email: String?)throws{//valida o email
        if(email == "" || email == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido
        }//TODO - COLOCAR A VALIDACAO VIA REGEX FUNCIONANDO
    }
    
    
    func validarCPF(cpf: String?) throws { //valida o cpf
        if(cpf == "" || cpf == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido
        }//TODO - FAZER VALIDACAO VIA REGEX
    }
    
    
    func validarCelular(celular: String) throws { //valida o numero de celular
        if(celular == "" || celular == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido
        }//TODO - FAZER VALIDACAO VIA REGEX
    }
    
    
    func validarTelefoneFixo(convencional: String) throws { //valida o numero do telefone fixo
        if(convencional == "" || convencional == nil){
            throw ErrosValidacaoCadastro.campoNaoPreenchido
        }//TODO - FAZER VALIDACAO VIA REGEX
    }
    
    
    
    func validarSenhas(senha: String, confirmacaoSenha: String) throws {//valida as senhas
        if((senha == "" || senha == nil) || (confirmacaoSenha == "" || confirmacaoSenha == nil)){
            throw ErrosValidacaoCadastro.campoNaoPreenchido
        }else if(senha != confirmacaoSenha){
            throw ErrosValidacaoCadastro.dadoErrado
        }
    }
    
    
    func cadastrar(id: Int, nome: String, sobrenome: String, sexo: String, cpf: String,
                   email:String, senha:String, celular: String, convencional: String){
        
        let candidato = Candidato(id: 1, nome: nome, sobrenome: sobrenome, email: email, senha: senha, cpf: cpf, celular: celular, convencional: convencional, sexo: sexo, vagasAssociadas: nil, cv: nil)
        
        CandidatoDAO.saveObject(candidato: candidato)
        
    }
    
 
    
    
    func listarTodosOsCandidatos() -> [CandidatoEntidade]{
        return CandidatoDAO.fecthAllObjec()!
    }
    
    
    
}
