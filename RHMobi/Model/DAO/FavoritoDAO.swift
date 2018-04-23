//
//  FavoritoDAO.swift
//  RHMobi
//
//  Created by Edson  Jr on 23/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class FavoritoDAO: NSObject {
    
    
    //Configurar o contexto para salvar os dados dentro do banco
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    class func salvarFavorito(favorito: Favorito) {
        let dbgmsg = "[FavoritoDAO]: "
        let context = FavoritoDAO.getContext()
        
        let vagaEntityNome: String = "VagaEntidade"
        let clienteEntidadeNome: String = "ClienteEntidade"
        let areaInteresseEntidadeNome: String = "AreasInteresseEntidade"
        let favoritoEntidadeNome: String =  "FavoritoEntidade"
        
        
        //Setando os valores de vagas
        var vagasNSSetRelacao: NSSet?
        var arrayDeVagas = [Vaga]()
        
        print(dbgmsg + "Quantidade de vagas a serem salvas no favorito do usuario \(favorito.idCandidato): \(favorito.vagasFavoritadas?.count)....")
        
        
        for vaga in favorito.vagasFavoritadas! {
            let vagaEntidade: VagaEntidade = NSEntityDescription.insertNewObject(forEntityName: vagaEntityNome, into: context) as! VagaEntidade
            
            //Setando os valores da vaga na entidade da vaga para salvar os dados no banco
            vagaEntidade.setValue(vaga.id, forKey: "id")
            vagaEntidade.setValue(vaga.nome, forKey: "nome")
            vagaEntidade.setValue(vaga.descricao, forKey: "descricao")
            vagaEntidade.setValue(vaga.funcao, forKey: "funcao")
            vagaEntidade.setValue(vaga.imgUrl, forKey: "imgUrl")
            vagaEntidade.setValue(vaga.prazo, forKey: "prazo")
            vagaEntidade.setValue(vaga.experiencia, forKey: "experiencia")
            vagaEntidade.setValue(vaga.vagaStatus, forKey: "vagaStatus")
            vagaEntidade.setValue(vaga.tipoContrato, forKey: "tipoContrato")
            
            
            //Setando o relacionamento entre vaga e areas de entidade
            //Setando os valores das areas de interese
            let areasInteresseNSSetRelacao: NSSet?
            var areaInteresseArray = [AreasInteresseEntidade]()
            
            
            print(dbgmsg + "na vaga \(vaga.nome) ha \(vaga.areasInteresse.count) areas de interesse a serem salvas....")
        
            for area in (vaga.areasInteresse) {
                let areaEntidade: AreasInteresseEntidade =  NSEntityDescription.insertNewObject(forEntityName: areaInteresseEntidadeNome, into: context) as! AreasInteresseEntidade
                        areaEntidade.setValue(area.id, forKey: "id")
                        areaEntidade.setValue(area.nome, forKey: "nome")
                        areaInteresseArray.append(areaEntidade)
                    }
            
            
            
            //Criando a relacao entre areas de interesse e vaga
            areasInteresseNSSetRelacao = NSSet(array: areaInteresseArray)
            vagaEntidade.addToAreasInteresseRelacao(areasInteresseNSSetRelacao!)
            
            
            
            //Configurando agora o relacionamento entre vaga e cliente
            //Setando o cliente
            let clienteEntidade: ClienteEntidade = NSEntityDescription.insertNewObject(forEntityName: clienteEntidadeNome, into: context) as! ClienteEntidade
            
            clienteEntidade.setValue(vaga.cliente.id, forKey: "id")
            clienteEntidade.setValue(vaga.cliente.cnpj, forKey: "cnpj")
            clienteEntidade.setValue(vaga.cliente.razaoSocial, forKey: "razaoSocial")
            clienteEntidade.setValue(vaga.cliente.ramoAtuacao, forKey: "ramoAtuacao")
            clienteEntidade.setValue(vaga.cliente.logradouro, forKey: "logradouro")
            clienteEntidade.setValue(vaga.cliente.bairro, forKey: "bairro")
            clienteEntidade.setValue(vaga.cliente.cep, forKey: "cep")
            clienteEntidade.setValue(vaga.cliente.cidade, forKey: "cidade")
            clienteEntidade.setValue(vaga.cliente.estado, forKey: "estado")
            
            print(dbgmsg + "Nesta vaga ha o cliente \(vaga.cliente.razaoSocial)... ")
            
            
            //Criando o relacionamento entre  cliente e vaga
            vagaEntidade.setValue(clienteEntidade, forKey: "cliente")
            
            
            //Dando append no array de vagas
            arrayDeVagas.append(vaga)
        }
        
        
        //Criando a entidade de favorito
         let favoritoEntidade: FavoritoEntidade = NSEntityDescription.insertNewObject(forEntityName: favoritoEntidadeNome, into: context) as! FavoritoEntidade
        
        //Setando o id do usuario
        favoritoEntidade.setValue(favorito.idCandidato, forKey: "idUsuario")
        
        //Setando o relacionamento entre vaga e favorito
        vagasNSSetRelacao = NSSet(array: arrayDeVagas)
        favoritoEntidade.addToVagaRelacao(vagasNSSetRelacao!)
        
        
        
        //Tentando salvar
        do {
            try context.save()
            print(dbgmsg + "Salvando o favorito do candidato \(favorito.idCandidato) com SUCESSO")
        }catch let err{
            print(dbgmsg + "ERRO AO SALVAR O FAVORITO DO CANDIDAO \(favorito.idCandidato)")
            print(err)
        }
        
        
        
        
    }
    
    
    
    
    

    
    
    
    
}
