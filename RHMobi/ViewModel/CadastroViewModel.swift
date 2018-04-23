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



class CadastroViewModel: GenericViewModel {
    
    private final let dbgmsg = "[CadastroViewModel]: "
    
    
    override init() {
        super.init()
    }
    
    //Mark: Construtores
    override init(url: String) {
        super.init(url: url)
    }
    
    
    //################## METODOS DE VALIDACAO DADOS CADASTRO #######################
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
    
    
    
    
    
    
    
    
    //#################### FUNCOES PARA CADASTRAR O USUARIO ##########################
    //Mark: Metodos para cadastro do usuiario
    
    //Cadastro parcial - sem o relacionamento entre as entidades cv, areasInteresse e vagasAssociadas
    func cadastrar(id: Int, nome: String, sobrenome: String, sexo: String, cpf: String,
                   email:String, senha:String, celular: String, convencional: String){
        
        let candidato = Candidato(id: "1", nome: nome, sobrenome: sobrenome, email: email, senha: senha, cpf: cpf, celular: celular, convencional: convencional, sexo: sexo, vagasAssociadas: nil, cv: nil, areasInteresse: nil)

        
        CandidatoDAO.saveObject(candidato: candidato)
        
    }
    
    
    
    
    func cadastrar(id: Int, nome: String, sobrenome: String, sexo: String, cpf: String,
                   email:String, senha:String, celular: String, convencional: String, vagasAssociadas: [Vaga], cv: CV, areasInteresse: [AreasInteresse] ){
        
        let candidato = Candidato(id: "1", nome: nome, sobrenome: sobrenome, email: email, senha: senha, cpf: cpf, celular: celular, convencional: convencional, sexo: sexo, vagasAssociadas: vagasAssociadas, cv: cv, areasInteresse: areasInteresse)
        
        CandidatoDAO.saveObject(candidato: candidato)
        
    }
    
    
    //Listagem de todos os candidatos
    func listarTodosOsCandidatos() -> [CandidatoEntidade]{
        return CandidatoDAO.fecthAllObjec()!
    }
    
    
    
    func cadastrar(candidato: Candidato){
        CandidatoDAO.saveObject(candidato: candidato)
    }
    
    
    
    
    
    
    
    
    
    //####################### DOWNLOAD/ENVIO DE DADOS VIA JSON ##########################
    //Mark: Baixando  a lista de areas de interesse
    func baixarListaAreasInteresse(completihonHandler: @escaping ([AreasInteresse])->()){
        super.getDataFromJson { json in
            guard let json = json else {return}
            print(self.dbgmsg + "Json recebido: \n")
            print(json)
            
            print(self.dbgmsg + "Decodificando o json em areas de interesse!")
            let jsonArray = json.array
            print(self.dbgmsg + "Baixado \(jsonArray?.count) areas de interesse via json!")
            
            var areasInteresse = [AreasInteresse]()
            for j in jsonArray! {
                print(self.dbgmsg + "subjson: \(j)")
                let area = AreasInteresse.decode(fromJson: j)
                areasInteresse.append(area as! AreasInteresse)
                
                //Salvando uma determinada vaga
                //self.salvarVaga(vaga: vaga as! Vaga)
                
            }
            print(self.dbgmsg + "Decodificada \(areasInteresse.count) vagas!")
            
            DispatchQueue.main.async {
                completihonHandler(areasInteresse)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
