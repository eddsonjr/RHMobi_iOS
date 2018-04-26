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
    
    //############# FUNCAO DE TESTES DO DAO DE FAVORITAR ####################
    func salvarFavorito(){
        
        print(dbgmsg + "Salvando um favorito de testes.....")
        
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
        
        let idCandidato = "C001"
        
        
        //Criando um objeto do tipo favorito para salvar os dados
        let favorito: Favorito = Favorito(idCandidato: idCandidato, vagasFavoritadas: [vaga])
        
        
        
        
        //Salvando diretamente via FavoritoDAO
        FavoritoDAO.salvarFavorito(favorito: favorito)

    }
    
    
    
    //Mark: Funcao para listar todos os favoritos
    func listarTodosOsFavoritos() {
        print(dbgmsg + "Buscando por todos os favoritos registrados no banco....")
        let favoritoEtidade = FavoritoDAO.listarTodosFavoritos()
        
        for favorito in favoritoEtidade! {
            print(dbgmsg + "Favorito usuario id: \(favorito.idUsuario)")
            print(dbgmsg + "Favorito quantidade de Vagas: \(favorito.vagaRelacao?.count)")
            
            for vaga in favorito.vagaRelacao! {
                let v = vaga as! VagaEntidade
                print(dbgmsg + "Vaga nome: \(v.nome)")
                print(dbgmsg + "Nesta vaga temos \(v.areasInteresseRelacao?.count) areas de interesse")
                print(dbgmsg + "Cliente desta vaga: \(v.clienteRelacao?.razaoSocial)")
            }
            
        }
        
    }
    
    
    func apagarTodosFavoritos() {
        print(dbgmsg + "Apagando todos os favoritos da base de dados...")
        if(FavoritoDAO.removerTodosFavoritos()){
            print(dbgmsg + "Todos os favoritos foram removidos da base de dados....")
        }else{
            print(dbgmsg + "Error ao remover todos os favoritos.....")
        }
    
    }
    
    
    func apagarUmDeterminadoFavorito(){
        print(dbgmsg + "Apagando um determinado favorito....")
        
        let favoritosBase = FavoritoDAO.listarTodosFavoritos()
        let f = favoritosBase![0] //Isso pode dar bug! Cuidado
        
        if(FavoritoDAO.removerFavorito(favoritoEntidade: f)){
            print(dbgmsg + "favorito especifico removido com sucesso...")
        }else{
            print(dbgmsg + "favorito nao pode ser removido")
        }
    }
    
    
    func fazerPesquisas() {
        print(dbgmsg +  "Fazendo buscas")
        let stringToNSPredicate = "idUsuario == %@"
        let whereClause = "C001"
        
        let favorito = FavoritoDAO.filtrarDadosFavorito(stringToNSPredicate: stringToNSPredicate, atributoForWhere: whereClause)
        print(dbgmsg + "Encontrado(s) \(favorito?.count) nesta pesquisa....")
        
        
    }
    
    
    func atualizarListaVagasFavorito() {
        print(dbgmsg +  "Atualizando lista de favoritos")
        let idCandidato = "C001"
        
        
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
//
//        let vaga = Vaga(id: "A2", nome: "VAGA DE TESTES2", tipoContrato: "CONTRATO DE TESTES2",
//                        funcao: "FUNCAO DE TESTES2", experiencia: "1 ANO", prazo: "00/00/00",
//                        descricao: "DESCRICAO DA VAGA DE TESTES2",
//                        requisitos: "REQUISITOS PARA FAZER CORE DATA FUNCIONAR SAO INDISPENSAVEIS2",
//                        areasInteresse: areaDeInteresses, imgUrl: "",
//                        vagaStatus: StatusVagaEnumHelper.emAberto.rawValue, cliente: cliente)
        
        
        //FavoritoDAO.atualizarVagasDoFavorito(idCandidato: idCandidato, vaga: vaga)
        //FavoritoDAO.removeTeste()
        FavoritoDAO.removerFavoritoDoCandidato(idCandidato: idCandidato, vaga: vaga)
        
    }
    
    
}
