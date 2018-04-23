//
//  VagaDAOTeste.swift
//  RHMobi
//
//  Created by Edson  Jr on 19/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DAOTeste {
    
    
    private final let dbgmsg = "[DAOTeste]: "
    
    //Mark: variavel do viewmodel da lista de vagas e dos detalhes da vaga
    var viewModel = ListaEDetalheVagaViewModel(url: UrlEnumHelper.vagasDownlodUrl.rawValue)
    var viewModelCadastrar = CadastroViewModel()
    
    
    
    //############# FUNCAO DE TESTES DO BANCO DE DADOS - VAGA #################
    //Mark: Funcao de testes para salvar uma vaga no banco de dados
    func salvarVagaTESTE(){
        
        let areaDeInteresses = [AreasInteresse.init(id: "B0", nome:  "AREA DE INTERESSE 1"),
                                AreasInteresse.init(id: "B1", nome: "AREA DE INTERESSE 2"),
                                AreasInteresse.init(id: "B2", nome: "AREA DE INTERESSE 3")]
        
        let cliente = Cliente(id: "1C", cnpj: "00000000", razaoSocial: "RAZAO SOCIAL TESTES",
                              ramoAtuacao: "TESTE", logradouro: "RUA NAO EXISTE, 00", bairro: "Z", cep: "000001",
                              cidade: "CIDADE TESTES", estado: "ESTADO TESTES")
        
        let vaga = Vaga(id: "A1", nome: "VAGA DE TESTES", tipoContrato: "CONTRATO DE TESTES",
                        funcao: "FUNCAO DE TESTES", experiencia: "1 ANO", prazo: "00/00/00",
                        descricao: "DESCRICAO DA VAGA DE TESTES",
                        requisitos: "REQUISITOS PARA FAZER CORE DATA FUNCIONAR SAO INDISPENSAVEIS",
                        areasInteresse: areaDeInteresses, imgUrl: "",
                        vagaStatus: StatusVagaEnumHelper.emAberto.rawValue, cliente: cliente)
        
        
        //Salvando
        self.viewModel.salvarVaga(vaga: vaga)
        
    }
    
    
    func listarVagas() {
        
        let vagasDoBanco = self.viewModel.listarTodasVagasSalvas()
        
        if vagasDoBanco == nil || vagasDoBanco.count <= 0 {
            print(dbgmsg + "Retornando...")
            return
        }
        
        
        print(dbgmsg + "Retornando do banco: \(vagasDoBanco.count) vagas.")
        print(dbgmsg + "Dados da vaga: ")
        print(dbgmsg + "id: \(vagasDoBanco[0].id) | nome: \(vagasDoBanco[0].nome) | tipoContrato: \(vagasDoBanco[0].tipoContrato)")
        print(dbgmsg + "cliente cnpj: \(vagasDoBanco[0].cliente?.cnpj)")
        print(dbgmsg + "areas de interesse:")
        
        
        for area in vagasDoBanco[0].areasInteresseRelacao! {
            let a = area as? AreasInteresseEntidade
            print(">> Area id: \(a?.id) | nome: \(a?.nome)")
        }
    }
    
    
    func apagarTodasVagas(){
        print(dbgmsg + "Apagando todas as vagas do banco")
        self.viewModel.apagarTodasAsVagas()
    }
    
    
    
    
    
    
    
    
    
    
    //############# FUNCAO DE TESTES DO BANCO DE DADOS - CANDIDATO #################
    //Mark: Salva um candidato de testes
    func salvarCandidatoTESTE() {
        
        
        let areaDeInteresses: [AreasInteresse]?  =
            [AreasInteresse.init(id: "B0", nome:  "AREA DE INTERESSE 1"),
                                AreasInteresse.init(id: "B1", nome: "AREA DE INTERESSE 2"),
                                AreasInteresse.init(id: "B2", nome: "AREA DE INTERESSE 3")]
        
        
       let cv = CV(id: "0001A", dataCriacao: "00/00/0000", url: "url")
        
        
       
        let candidatoTeste = Candidato(id: "01", nome: "CANDIDATO", sobrenome: " TESTE", email: "email@teste.com", senha: "123",
                                       cpf: "00000000-00", celular: "000000000",
                                       convencional: "", sexo: "M",
                                       vagasAssociadas: nil, cv: cv,
                                       areasInteresse: areaDeInteresses)
        
        
        //salvando
        self.viewModelCadastrar.cadastrar(candidato: candidatoTeste)
    }
    
    
    
    
    func listarCandidato() {
        
        let candidatos = self.viewModelCadastrar.listarTodosOsCandidatos()
        
        if candidatos == nil || candidatos.count <= 0 {
            print(dbgmsg + "Retornando...")
            return
        }
        
        
        print(dbgmsg + "Retornando do banco: \(candidatos.count) candidato.")
        print(dbgmsg + "Dados do candidato: ")
        print(dbgmsg + "id: \(candidatos[0].id) | nome: \(candidatos[0].nome) | cpf: \(candidatos[0].cpf)")
        print(dbgmsg + "areas de interesse:")
        
        
        for area in candidatos[0].areasInteresse! {
            let a = area as? AreasInteresseEntidade
            print(">> Area id: \(a?.id) | nome: \(a?.nome)")
        }
        
        
        print(dbgmsg + "CV: \(candidatos[0].cvRelacao?.id) | dataCriacao: \(candidatos[0].cvRelacao?.dataCriacao)")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
