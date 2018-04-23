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
        
        let candidatoEntidadeNome = "CandidatoEntidade"
        let areasInteresseEntidadeNome = "AreasInteresseEntidade"
        let cvEntidadeNome = "CVEntidade"
    
        let candidatoEntidade: CandidatoEntidade  = NSEntityDescription.insertNewObject(forEntityName: candidatoEntidadeNome, into: context) as! CandidatoEntidade
        
        
        //Setando os valores para serem salvos
        candidatoEntidade.setValue(candidato.id, forKey: "id")
        candidatoEntidade.setValue(candidato.nome, forKey: "nome")
        candidatoEntidade.setValue(candidato.sobrenome, forKey: "sobrenome")
        candidatoEntidade.setValue(candidato.email, forKey: "email")
        candidatoEntidade.setValue(candidato.cpf, forKey: "cpf")
        candidatoEntidade.setValue(candidato.sexo, forKey: "sexo")
        candidatoEntidade.setValue(candidato.senha, forKey: "senha")
        candidatoEntidade.setValue(candidato.celular, forKey: "celular")
        candidatoEntidade.setValue(candidato.convencional, forKey: "convencional")
        
        let cvEntidade: CVEntidade = NSEntityDescription.insertNewObject(forEntityName: cvEntidadeNome, into: context) as! CVEntidade
        
        cvEntidade.setValue(candidato.cv?.id, forKey: "id")
        cvEntidade.setValue(candidato.cv?.url, forKey: "url")
        cvEntidade.setValue(candidato.cv?.dataCriacao, forKey: "dataCriacao")
        
        
        //Setando o relacionamento com CV
        candidatoEntidade.setValue(cvEntidade, forKey: "cvRelacao")
        
        
        
        //Verificando se ha areas de interesse relacioandas com esse candidato
        if(candidato.areasInteresse != nil){
            print(dbgmsg + "Salvando as \(candidato.areasInteresse?.count) areas de interesse dele....")
            let areasInteresseEntidadeNome = "AreasInteresseEntidade"
            
            //Setando os valores das areas de interese
            let areasInteresseNSSetRelacao: NSSet?
            var areaInteresseArray = [AreasInteresseEntidade]()
            
            for area in candidato.areasInteresse! {
                let areaEntidade: AreasInteresseEntidade =  NSEntityDescription.insertNewObject(forEntityName: areasInteresseEntidadeNome, into: context) as! AreasInteresseEntidade
                areaEntidade.setValue(area.id, forKey: "id")
                areaEntidade.setValue(area.nome, forKey: "nome")
                areaInteresseArray.append(areaEntidade)
            }
            //Salvando a relacao de candidato com as areas e interesse
            areasInteresseNSSetRelacao = NSSet(array: areaInteresseArray)
            candidatoEntidade.addToAreasInteresse(areasInteresseNSSetRelacao!)
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        do {
            try context.save()
            print(dbgmsg + "Dados salvos com sucesso!")
            
        }catch let err{
            print(err)
            
        }
        
    }
    
    
    
    class func fecthAllObjec() -> [CandidatoEntidade]? {
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
    
    
    
    
    
    //Apaga todos os Candidatos da base de dados
    class func cleanDelete() -> Bool {
        let dbgmsg = "[CandidatoDAO]: "
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: CandidatoEntidade.fetchRequest())
        do {
            try context.execute(delete)
            print(dbgmsg + "Apagado todos os dados de candidato do banco de dados")
            return true
        }catch {
            return false
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
