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
        var arrayDeVagas = [VagaEntidade]()
        
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
            vagaEntidade.setValue(clienteEntidade, forKey: "clienteRelacao")
            
            
            //Dando append no array de vagas
            arrayDeVagas.append(vagaEntidade)
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
    
    
    
    
    //Retornando todos os favoritos
    class func listarTodosFavoritos() -> [FavoritoEntidade]? {
        let dbgmsg = "[FavoritoDAO]: "
        let context = getContext()
        var favoritos:  [FavoritoEntidade]? = nil
     
        do{
            favoritos = try context.fetch(FavoritoEntidade.fetchRequest())
            print(dbgmsg + "Quantidade de favoritos encontrados no banco: \(favoritos?.count)")
            return favoritos
        }catch let err{
            print(dbgmsg + "erro: \(err)")
            return favoritos
        }
    }
    
    
    
    
    //Pesquisando favoritos com base em predicado
    class func filtrarDadosFavorito(stringToNSPredicate: String, atributoForWhere: String) -> [FavoritoEntidade]?{
        let dbgmsg = "[FavoritoDAO]: "
        let context = getContext()
        let fetchRequest: NSFetchRequest<FavoritoEntidade> = FavoritoEntidade.fetchRequest()
        var favoritos:[FavoritoEntidade]?  = nil
        
        
        var predicate = NSPredicate(format: stringToNSPredicate,atributoForWhere)

        fetchRequest.predicate = predicate
        do{
            favoritos = try context.fetch(fetchRequest)
            print(dbgmsg + "[Busca]: Predicado: \(stringToNSPredicate) | where: \(atributoForWhere)")
            print(dbgmsg + "Encontrados \(favoritos?.count) com essa busca especifica")
            return favoritos
        }catch let err{
            print()
            return favoritos
        }
    }
    
    
    
    //Retorna somente as vagas daquele candidato
    class func retornarSomenteVagasDoCandidato(idCandidato: String) -> [VagaEntidade]{
        let dbgmsg = "[FavoritoDAO]: "
        
        let stringToNSPredicate = "idUsuario == %@"
        let arrayDeFavoritosDesteCandidatoEntidade = filtrarDadosFavorito(stringToNSPredicate: stringToNSPredicate, atributoForWhere: idCandidato)
        var arrayVagas = [VagaEntidade]()
        
        if(arrayDeFavoritosDesteCandidatoEntidade?.first?.vagaRelacao != nil) {
            for vaga in (arrayDeFavoritosDesteCandidatoEntidade?.first?.vagaRelacao)! {
                let v = vaga as! VagaEntidade
                arrayVagas.append(v)
            }
        }

        print(dbgmsg + "Retornando \(arrayVagas.count) vagas do candidato \(idCandidato) ")
        return arrayVagas
        
    }
    
    
    
    //Apagando todos os favoritos da base de dados
    class func removerTodosFavoritos() -> Bool {
        let dbgmsg = "[FavoritoDAO]: "
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: FavoritoEntidade.fetchRequest())
        do {
            try context.execute(delete)
            print(dbgmsg + "Apagado todos os dados de favorito do banco de dados")
            return true
        }catch {
            return false
        }
    }
    
    
    //Apagando um determinado favorito
    class func removerFavorito(favoritoEntidade: FavoritoEntidade) -> Bool{
        let dbgmsg = "[FavoritoDAO]: "
        let context = getContext()
        context.delete(favoritoEntidade)
        
        do{
            try context.save()
            return true
        }catch let err {
            print(dbgmsg + "Erro ao apagar favorito solicitado")
            return false
        }
    }
    
    
    
    
    
    
    
    
    

    class func atualizarVagasDoFavorito(idCandidato: String, vaga: Vaga){
        let dbgmsg = "[FavoritoDAO]: "
        let context = getContext()

        //Primeiramente, fazendo uma busca para saber qual candidato pegar
        let stringToNSPredicate = "idUsuario == %@"

        let favoritos = filtrarDadosFavorito(stringToNSPredicate: stringToNSPredicate, atributoForWhere: idCandidato)


        //Verificando agora se a vaga passada corresponde a alguma vaga encontrada na busca
        var arrayDeVagas = retornarSomenteVagasDoCandidato(idCandidato: idCandidato)

        if(arrayDeVagas.count > 0){
            for i in 0...arrayDeVagas.count-1 {
                if arrayDeVagas[i].id == vaga.id {
                    print(dbgmsg + "Essa vaga ja existe, apagando ela....")
                
                    favoritos?.first?.removeFromVagaRelacao(converterVagaParaVagaEntidade(vaga: vaga))
                    print(dbgmsg + "Removido uma vaga. Agora este candidato possui \(favoritos?.first?.vagaRelacao?.count) vagas favoritadas...")
                }else{
                    print(dbgmsg + "Essa vaga ainda nao existe, salvando - a pela primeira vez...")
                    arrayDeVagas.append(converterVagaParaVagaEntidade(vaga: vaga))
                }
            }
        }else{
            print(dbgmsg + "Nao ha nenhum cadastro de usuario (candidato) feito no sistema")
            print(dbgmsg + "Cadastrando pela primeira vez esse favorito....")
            let favorito: Favorito = Favorito(idCandidato: idCandidato, vagasFavoritadas: [vaga])
            salvarFavorito(favorito: favorito)
        }
    }


    
    class func updateFavoritoEntidade(favoritoEntidade: FavoritoEntidade,vagasRelacao: NSSet) {
        let dbgmsg = "[FavoritoDAO]: "
        let context = getContext()
        
        print(dbgmsg + "Atualizando a relacao entre favoritos e vaga....")
        favoritoEntidade.addToVagaRelacao(vagasRelacao)
      
        //Tentando salvar
        do {
            try context.save()
            print(dbgmsg + "Atualizado o \(favoritoEntidade.idUsuario) com SUCESSO")
        }catch let err{
            print(dbgmsg + "ERRO AO ATUALIZAR... \(favoritoEntidade.idUsuario)")
            print(err)
        }
        
        
        
        
        
    }
    


    //Funcao para converter Vaga para VagaEntidade
    class func converterVagaParaVagaEntidade(vaga: Vaga) -> VagaEntidade{
        let context = getContext()
        
        let vagaEntidade = VagaEntidade.init(entity: NSEntityDescription.entity(forEntityName: "VagaEntidade", in: context)! , insertInto: context)
        
        vagaEntidade.id = vaga.id
        vagaEntidade.nome = vaga.nome
        vagaEntidade.tipoContrato = vaga.tipoContrato
        vagaEntidade.funcao = vaga.funcao
        vagaEntidade.experiencia = vaga.experiencia
        vagaEntidade.prazo = vaga.prazo
        vagaEntidade.descricao = vaga.descricao
        vagaEntidade.requisitos = vaga.requisitos
        vagaEntidade.imgUrl = vaga.imgUrl
        vagaEntidade.vagaStatus = vaga.vagaStatus

        var areaInteresseArray = [AreasInteresseEntidade]()
        let areasInteresseNSSetRelacao: NSSet?
        
        for area in (vaga.areasInteresse) {
            let areaEntidade: AreasInteresseEntidade =  NSEntityDescription.insertNewObject(forEntityName: "AreasInteresseEntidade", into: context) as! AreasInteresseEntidade
            areaEntidade.setValue(area.id, forKey: "id")
            areaEntidade.setValue(area.nome, forKey: "nome")
            areaInteresseArray.append(areaEntidade)
        }
        
        
        
        //Criando a relacao entre areas de interesse e vaga
        areasInteresseNSSetRelacao = NSSet(array: areaInteresseArray)
        vagaEntidade.addToAreasInteresseRelacao(areasInteresseNSSetRelacao!)
        
        
        //Criando uma entidade de cliente
        let clienteEntidade: ClienteEntidade = NSEntityDescription.insertNewObject(forEntityName: "ClienteEntidade", into: context) as! ClienteEntidade
        clienteEntidade.bairro = vaga.cliente.bairro
        clienteEntidade.cep = vaga.cliente.cep
        clienteEntidade.cidade = vaga.cliente.cidade
        clienteEntidade.cnpj = vaga.cliente.cnpj
        clienteEntidade.estado = vaga.cliente.estado
        clienteEntidade.id = vaga.cliente.id
        clienteEntidade.logradouro = vaga.cliente.logradouro
        clienteEntidade.ramoAtuacao = vaga.cliente.ramoAtuacao
        clienteEntidade.razaoSocial = vaga.cliente.razaoSocial
        
        
        
        
        return vagaEntidade

    }

    
    
    
    
    
    
    

    
    
    
    
}
