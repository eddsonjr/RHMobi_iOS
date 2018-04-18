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
        let vagaEntity = NSEntityDescription.entity(forEntityName: "VagaEntidade", in: context)
        let vagaManageObject = NSManagedObject(entity: vagaEntity!, insertInto: context)
        
        
        
        //Setando os valores para serem salvos
        vagaManageObject.setValue(vaga.id, forKey: "id")
        vagaManageObject.setValue(vaga.nome, forKey: "nome")
        vagaManageObject.setValue(vaga.descricao, forKey: "descricao")
        vagaManageObject.setValue(vaga.funcao, forKey: "funcao")
        vagaManageObject.setValue(vaga.imgUrl, forKey: "imgUrl")
        vagaManageObject.setValue(vaga.prazo, forKey: "prazo")
        vagaManageObject.setValue(vaga.experiencia, forKey: "experiencia")
        vagaManageObject.setValue(vaga.vagaStatus, forKey: "vagaStatus")
        
        
        if(vaga.areasInteresse != nil || vaga.areasInteresse.count != 0){
            print(dbgmsg + "Ha areas de interesse nesta vaga")
            
            
            // let carEntity = NSEntityDescription.entity(forEntityName: "CarEntity", in: managedContext)!
            
        }
        
        
        
        
        
        
        
//
//        //Criando nsset com os dados da vaga
//        let areasInteresseSet: NSSet = NSSet(array: vaga.areasInteresse!)
//        let requisitosSet: NSSet = NSSet(array: vaga.requisitos!)
//
////        vagaManageObject .setValue(vaga.cliente, forKey: "cliente")
////        vagaManageObject .setValue(areasInteresseSet, forKey: "areasInteresse")
////        vagaManageObject .setValue(requisitosSet, forKey: "requisitos")
        
        
        

        
        
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
