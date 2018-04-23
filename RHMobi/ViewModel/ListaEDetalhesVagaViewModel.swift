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


class ListaEDetalheVagaViewModel: GenericViewModel {
    
    private final let dbgmsg = "[ListaEDetalhesVagaViewModel]: "
    
    
    //Mark: Construtores
    override init(url: String) {
        super.init(url: url)
    }


    //Mark: Esta funcao serve para baixar os dados via json e codifica - los em um array de vagas
    
    func baixarListaVagaJson(completihonHandler: @escaping ([Vaga])->()){
       super.getDataFromJson { json in
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
                
                //Salvando uma determinada vaga
                //self.salvarVaga(vaga: vaga as! Vaga)
                
            }
            print(self.dbgmsg + "Decodificada \(vagas.count) vagas!")
            
            DispatchQueue.main.async {
                completihonHandler(vagas)
            }
        }
    }
    
    
}
