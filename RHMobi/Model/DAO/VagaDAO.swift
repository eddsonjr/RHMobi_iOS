//
//  VagaDAO.swift
//  RHMobi
//
//  Created by Edson  Jr on 01/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class VagaDAO: NSObject {
    
    
    
    
    //Configurar o contexto para salvar os dados dentro do banco
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    //Salvar os dados
    class func saveObject(vaga: Vaga){
        let dbgmsg = "[VagaDAO]: "
        let context = getContext()
        
        let vagaEntityNome: String = "VagaEntidade"
        let clienteEntidadeNome: String = "ClienteEntidade"
        let areaInteresseEntidadeNome: String = "AreasInteresseEntidade"
        
        
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
        
        vagaEntidade.setValue(clienteEntidade, forKey: "cliente") //Criando um relacionamento com ClienteEntidade
        
        
        
        //Setando os valores das areas de interese
        let areasInteresseNSSetRelacao: NSSet?
        var areaInteresseArray = [AreasInteresseEntidade]()
        
        
        for area in vaga.areasInteresse {
            let areaEntidade: AreasInteresseEntidade =  NSEntityDescription.insertNewObject(forEntityName: areaInteresseEntidadeNome, into: context) as! AreasInteresseEntidade
            areaEntidade.setValue(area.id, forKey: "id")
            areaEntidade.setValue(area.nome, forKey: "nome")
            areaInteresseArray.append(areaEntidade)
        }
        
        
        
        areasInteresseNSSetRelacao = NSSet(array: areaInteresseArray)
        vagaEntidade.addToAreasInteresseRelacao(areasInteresseNSSetRelacao!)
    
        
        do {
            try context.save()
            print( dbgmsg + "Salvando a vaga \(vaga.nome) com sucesso!")
        }catch let err{
            print(err)
        }
        
    }
    
    
    
    
    
    
    //Retorna uma lista de objetos vindos do banco
    class func fecthAllObjec() -> [VagaEntidade]? {
        let dbgmsg = "[VagaDAO]: "
        let context = getContext()
        var vagas:  [VagaEntidade]? = nil
        
        do {
            vagas = try context.fetch(VagaEntidade.fetchRequest())
            print(dbgmsg + "Quantidade de vagas encontradas no banco: \(vagas?.count)")
            return vagas
        }catch let err{
            print(dbgmsg + "erro: \(err)")
            return vagas
        }
    }
    
    
    
    
    //Apaga todas as vagas da base de dados
    class func cleanDelete() -> Bool {
        let dbgmsg = "[VagaDAO]: "
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: VagaEntidade.fetchRequest())
        do {
            try context.execute(delete)
            print(dbgmsg + "Apagado todos os dados de vaga do banco de dados")
            return true
        }catch {
            return false
        }
    }
    
    
    
    
    //Filtrar Dados
    class func filterData(stringToNSPredicate: String, atributoForWhere: String) ->[VagaEntidade]? {
        let dbgmsg = "[VagaDAO]: "
        let context = getContext()
        let fetchRequest: NSFetchRequest<VagaEntidade> = VagaEntidade.fetchRequest()
        var vagas:[VagaEntidade]?  = nil
        
        
        var predicate = NSPredicate(format: "password contains[c] %@", "2")
        fetchRequest.predicate = predicate
        do{
            vagas = try context.fetch(fetchRequest)
            print(dbgmsg + "Encontrados \(vagas?.count) com essa busca especifica")
            
            return vagas
            
        }catch let err{
            print()
            return vagas
        }
    }
}
