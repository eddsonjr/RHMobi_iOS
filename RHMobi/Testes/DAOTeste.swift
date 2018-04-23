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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
