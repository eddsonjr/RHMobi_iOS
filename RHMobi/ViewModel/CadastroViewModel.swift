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
    
    
    
    //Esta funcao serve para validar os campos do usuario de acordo com o cadastro - com senha
    func validarDadosUsuario(nome: String?, sobrenome: String?, sexo: String?, cpf: String?,
                             email:String?, senha:String?, confirmarSenha: String?,celular: String?, convencional: String?) -> (Bool, [Int]){
        
        var podeCadastrar = true
        var codigoValidacao = [Int]()
        
        
        
        //Validando o nome
        if(nome == "" || nome == nil){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.preencher.rawValue)
        }else if (nome?.isAllDigits())! {
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.verificar.rawValue)
        }else{
           codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
            
        }
        
        
        //Validando o sobrenome
        if(sobrenome == "" || sobrenome == nil){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.preencher.rawValue)
        }else if (sobrenome?.isAllDigits())! {
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.verificar.rawValue)
        }else{
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }
        
        
        
        //Validando o email
        if(email == "" || email == nil) {
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.preencher.rawValue)
        }else{ //TODO - VERIFICAR USANDO REGEX
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }
        
        
        //Validando o CPF
        if(cpf == "" || cpf == nil){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.preencher.rawValue)
        }else if (cpf?.isAllDigits())!{
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.verificar.rawValue)
        }else {
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }
        
        
        //Validando o telefone celular (telefone 1)
        if(celular == "" || celular == nil){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.preencher.rawValue)
        }else if(!(celular?.isAllDigits())!){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.verificar.rawValue)
        }else{
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }
        
        
        //validando o telefone convencional  (telefone 2)
        if(convencional == "" || convencional == nil){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }else if(!(convencional?.isAllDigits())!){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.verificar.rawValue)
        }else{
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }
        
        
        
        //validando as senhas
        if((senha == "" || senha == nil) || (confirmarSenha == "" || confirmarSenha == nil)){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.preencher.rawValue)
        }else if (senha != confirmarSenha) {
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.verificar.rawValue)
        }else {
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }
        
        return (podeCadastrar,codigoValidacao)
        
        
    }
    
    
    
    
    //Esta funcao serve para validar os campos do usuario de acordo com o cadastro - com senha
    func validarDadosUsuario(nome: String?, sobrenome: String?, sexo: String?, cpf: String?,
                             email:String?,celular: String?, convencional: String?) -> (Bool, [Int]){
        
        var podeCadastrar = true
        var codigoValidacao = [Int]()
        
        //Validando o nome
        if(nome == "" || nome == nil){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.preencher.rawValue)
        }else if (nome?.isAllDigits())! {
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.verificar.rawValue)
        }else{
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
            
        }
        
        
        //Validando o sobrenome
        if(sobrenome == "" || sobrenome == nil){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.preencher.rawValue)
        }else if (sobrenome?.isAllDigits())! {
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.verificar.rawValue)
        }else{
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }
        
        
        
        //Validando o email
        if(email == "" || email == nil) {
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.preencher.rawValue)
        }else{ //TODO - VERIFICAR USANDO REGEX
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }
        
        
        //Validando o CPF
        if(cpf == "" || cpf == nil){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.preencher.rawValue)
        }else if (cpf?.isAllDigits())!{
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.verificar.rawValue)
        }else {
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }
        
        
        //Validando o telefone celular (telefone 1)
        if(celular == "" || celular == nil){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.preencher.rawValue)
        }else if(!(celular?.isAllDigits())!){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.verificar.rawValue)
        }else{
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }
        
        
        //validando o telefone convencional  (telefone 2)
        if(convencional == "" || convencional == nil){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }else if(!(convencional?.isAllDigits())!){
            podeCadastrar = false
            codigoValidacao.append(CadastroEnumValidacao.verificar.rawValue)
        }else{
            codigoValidacao.append(CadastroEnumValidacao.completo.rawValue)
        }
        
        return (podeCadastrar,codigoValidacao)
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
