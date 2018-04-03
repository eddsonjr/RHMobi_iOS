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
        
        
        
        if(vaga.areasInteresse != nil || vaga.areasInteresse?.count != 0){
            print(dbgmsg + "Ha areas de interesse nesta vaga")
            
            
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
            print( dbgmsg + "Dados salvos com sucesso!")
           
        }catch let err{
            print(err)
            
        }
        
    }
    
    
    
    //Retorna uma lista de objetos vindos do banco
    class func fecthObjec() -> [VagaEntidade]? {
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
    
    
}
