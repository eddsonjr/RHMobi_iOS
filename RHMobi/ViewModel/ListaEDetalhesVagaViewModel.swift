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
    
    
    //Mark: Esta funcao serve para baixar os dados via json e posteriormente
    //popular a tableview
    
    func baixarListaVagaJson(completihonHandler: @escaping ([Vaga])->()){
        var jsonHelper: JsonHelper = JsonHelper(url: UrlEnumHelper.vagasDownlodUrl.rawValue)
        jsonHelper.getDataFromJson { json in
            guard let json = json else {return}
            print(self.dbgmsg + "Json recebido: \n")
            print(json)
            
            
            
            
            
            
        }
    }
    
    
    /*
 
     
     
     let jsonArray = json.array
     print("Tamanho do json array: \(jsonArray?.count)")
     
     for j in jsonArray! {
     print("subjson: \(j)")
     let dono = Dono.fromJSON(json: j)
     self.donos.append(dono)
     print("Tamanho dono: \(self.donos.count)")
     
     
 
 
 var jsonHelper: JsonHelper = JsonHelper(url: "https://api.myjson.com/bins/1fsupr")
 
 jsonHelper.getDataFromJson { json in
 guard let json = json else { return }
 print(json)
 
 print("DECODIFICANDO UM DONO USANDO O JSON RECEBIDO")
 let dono = Dono.decode(fromJson: json)
 
 DispatchQueue.main.async {
 completihonHandler(dono as! Dono)
 }
 
 
 }
 
 */
    
    
}
