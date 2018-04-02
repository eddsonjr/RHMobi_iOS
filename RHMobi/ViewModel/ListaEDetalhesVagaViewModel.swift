//
//  ListaEDetalhesVagaViewModel.swift
//  RHMobi
//
//  Created by Edson  Jr on 01/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//
//  Classe de ViewModel usada tanto funcionalidades de Listagem da Vaga quanto nos detalhes da vaga
//  uma vez que ambas as funcionalidades estao correlacionadas.

import Foundation
import CoreData
import UIKit
import SwiftyJSON


class ListaEDetalheVagaViewModel {
    
    private final let dbgmsg = "[ListaEDetalhesVagaViewModel]: "
    
    
    //Mark: Esta funcao serve para baixar os dados via json e codifica - los em um array de vagas
    
    func baixarListaVagaJson(completihonHandler: @escaping ([Vaga])->()){
        let jsonHelper: JsonHelper = JsonHelper(url: UrlEnumHelper.vagasDownlodUrl.rawValue)
        jsonHelper.getDataFromJson { json in
            guard let json = json else {return}
            print(self.dbgmsg + "Json recebido: \n")
            print(json)
            
            print(self.dbgmsg + "Decodificando o json em vagas vagas!")
            let jsonArray = json.array
            print(self.dbgmsg + "Baixado \(jsonArray?.count) vagas via json!")
            
            var vagas = [Vaga]()
            for j in jsonArray! {
                print(self.dbgmsg + "subjson: \(j)")
                let vaga = Vaga.decode(fromJson: j)
                vagas.append(vaga as! Vaga)
                
            }
            print(self.dbgmsg + "Decodificada \(vagas.count) vagas!")
            
            DispatchQueue.main.async {
                completihonHandler(vagas)
            }
        }
        
        
    }
    
    
    
    
    //Somente para teste
    func salvarVagaTeste() {
        do{
            try CoreDataHelper.getContext().save()
            print("Vaga salva!")
        }catch let err {
            print(err)
        }
    }
    
    
    func getAllVagasTeste()  {
       var vagas: [Vaga]? = nil
        do {
            vagas = try CoreDataHelper.getContext().fetch(Vaga.fetchRequest()) as? [Vaga]
            print("Retornado do banco: \(String(describing: vagas?.count))")
            print("Nome da ultima vaga : \(String(describing: vagas?.last?.nome))")
        }catch let err {
            print(err)
        }
        
    }
    
    
}
