//
//  CandidatoDAO.swift
//  RHMobi
//
//  Created by Edson  Jr on 20/03/18.
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
    
    
    
    //Salvando um candidato
    class func salvar(candidato: Candidato) -> Bool {
        let dbgmsg: String = "[CandidatoDAO]: "
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "CANDIDATO", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        
        //Setando os valores para serem salvos no banco
        manageObject.setValue(candidato.id, forKey: "id")
        manageObject.setValue(candidato.nome, forKey: "nome")
        manageObject.setValue(candidato.sobrenome, forKey: "sobrenome")
        manageObject.setValue(candidato.email, forKey: "email")
        manageObject.setValue(candidato.senha, forKey: "senha")
        manageObject.setValue(candidato.rg, forKey: "rg")
        manageObject.setValue(candidato.telefone1, forKey: "telefone1")
        manageObject.setValue(candidato.telefone2, forKey: "telefone2")
        manageObject.setValue(candidato.sexo, forKey: "sexo")
        
        
        //Tentando salvar
        do{
            try context.save()
            return true
        }catch let err {
            print(dbgmsg + "ERRO: NAO FOI POSSIVEL SALVAR OS DADOS NO CORE DATA!")
            print(dbgmsg + "\(err)")
            return false
        }
    }
    
    
    
    //Retornando uma lista de candidatos
    class func listarTodos() -> [CANDIDATO]? {
        let dbgmsg: String = "[CandidatoDAO]: "

        let context = getContext()
        var candidatos: [CANDIDATO]? = nil //variavel do tipo usado no banco de dados
        var candidatosModel: [Candidato]? = nil //Variavel do tipo comum do modelo
        
        //Tentando pegar do banco
        do{
            candidatos = try context.fetch(CANDIDATO.fetchRequest())
            return candidatos
        }catch let err {
            print(dbgmsg + "ERRO: NAO FOI POSSIVEL ADQURIR DADOS DO BANCO")
            print(dbgmsg + "\(err)")
            return candidatos
            
        }
    }
    
    
//
//
//
//    func apagarCandidato(id: Int){
//
//    }
//
//

    
    
    
    //Procura por um determinado candidato
    class func procurarCandidato(id: Int) -> CANDIDATO{
        let dbgmsg: String = "[CandidatoDAO]: "
        let context = getContext()
        let fetchRequest: NSFetchRequest<CANDIDATO> = CANDIDATO.fetchRequest()
        
        var candidato: [CANDIDATO]? = nil
        let predicate = NSPredicate(format: "id = %d", id)
        fetchRequest.predicate = predicate
        
        do{
            candidato = try context.fetch(fetchRequest)
            return (candidato?.first)!
        }catch let err {
            print(dbgmsg + "ERRO: NAO FOI POSSIVEL REALIZAR BUSCA PELO ITEM SUPRACITADO")
            print(dbgmsg + "\(err)")
            return (candidato?.first)!
        }
    }
    
    
    
    //Esta funcao serve para retornar se ja existe um candidato cadastrado com um determinado email
    class func verificarCandidato(email: String) -> Bool {
        let dbgmsg: String = "[CandidatoDAO]: "
        let context = getContext()
        let fetchRequest: NSFetchRequest<CANDIDATO> = CANDIDATO.fetchRequest()
        
        var candidato: [CANDIDATO]? = nil
        let predicate = NSPredicate(format: "email contains[c] %@", email)
        fetchRequest.predicate = predicate
        
        do{
            candidato = try context.fetch(fetchRequest)
            print(dbgmsg + "Encontrado esse candidato ja cadastrado")
            return true
        }catch let err {
            print(dbgmsg + "ERRO: NAO FOI POSSIVEL REALIZAR BUSCA PELO ITEM SUPRACITADO")
            print(dbgmsg + "\(err)")
            return false
        }
        
        return false
        
    }


    
    //Remove todos os candidatos da base de dados
    class  func removerTodos() -> Bool{
        let dbgmsg: String = "[CandidatoDAO]: "
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: CANDIDATO.fetchRequest())
        
        do{
            try context.execute(delete)
            print(dbgmsg + "Deletado todos os candidatos da base de dados!")
            return true
        
        }catch let err {
            print(dbgmsg + "ERRO: NAO FOI POSSIVEL REMOVER DADOS NO CORE DATA!")
            print(dbgmsg + "\(err)")
            return false
            
        }
    }
    
    
    
}
