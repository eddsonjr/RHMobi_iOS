//
//  CandidatoDAO.swift
//  RHMobi
//
//  Created by Edson  Jr on 03/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import UIKit




class CandidatoDAO: NSObject {
    
    
    //Configurar o contexto para salvar os dados dentro do banco
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    
    
    
    //Salvar os dados
    class func saveObject(candidato: Candidato){
        let dbgmsg = "[CandidatoDAO]: "
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "CandidatoEntidade", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        
        //Setando os valores para serem salvos
        manageObject.setValue(candidato.id, forKey: "id")
        manageObject.setValue(candidato.nome, forKey: "nome")
        manageObject.setValue(candidato.sobrenome, forKey: "sobrenome")
        manageObject.setValue(candidato.email, forKey: "email")
        manageObject.setValue(candidato.rg, forKey: "rg")
        manageObject.setValue(candidato.sexo, forKey: "sexo")
        manageObject.setValue(candidato.senha, forKey: "senha")
        manageObject.setValue(candidato.telefone1, forKey: "telefone1")
        manageObject.setValue(candidato.telefone2, forKey: "telefone2")
        
        //Falta ainda criar o relacionamento com o cv
        
        do {
            try context.save()
            print(dbgmsg + "Dados salvos com sucesso!")
            
        }catch let err{
            print(err)
            
        }
        
    }
    
    
    
    class func fecthObjec() -> [CandidatoEntidade]? {
        let dbgmsg = "[CandidatoDAO]: "
        let context = getContext()
        var candidatos:  [CandidatoEntidade]? = nil
        
        do {
            candidatos = try context.fetch(CandidatoEntidade.fetchRequest())
            print(dbgmsg + "Quantidade de vagas encontradas no banco: \(candidatos?.count)")
            return candidatos
        }catch let err {
            print(dbgmsg + "erro: \(err)")
            return candidatos
        }
    }
    
    
    
    
    class func fectchCandidato(email: String, senha: String) -> Bool {
        let dbgmsg = "[CandidatoDAO]: "
        let context = getContext()
        let fetchRequest: NSFetchRequest<CandidatoEntidade> = CandidatoEntidade.fetchRequest()
        
        var candidatosEntidade: [CandidatoEntidade]? = nil
        
        var predicate = NSPredicate(format: "email = %@ AND senha = %@", argumentArray: [email,senha])
        fetchRequest.predicate = predicate
        
        
        do{
            candidatosEntidade = try context.fetch(fetchRequest)
            if (candidatosEntidade?.first != nil){
                print(dbgmsg +  "Encontrado o candidato: \(candidatosEntidade?.first?.nome)")
                return true
            }else{
                print(dbgmsg + "Usuario nao encontrado!")
                return false
            }
            
        }catch let err {
            print(dbgmsg + "Erro: \(err)")
            return false
        }
    }
    
    
    
    
    
    
    
    
    
}
