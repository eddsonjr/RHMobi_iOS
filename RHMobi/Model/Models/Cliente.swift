//
//  Cliente.swift
//  RHMobi
//
//  Created by Edson  Jr on 16/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

class Cliente {
    
    var id: Int
    var cnpj: String
    var razaoSocial: String
    var ramoAtuacao: String
    var endereco: Endereco
    
    
    //Construtores
    //Construtor completo
    init(id: Int, cnpj: String, razaoSocial: String, ramoAtuacao: String,
         endereco: Endereco) {
      
        
        self.id = id
        self.cnpj = cnpj
        self.razaoSocial = razaoSocial
        self.ramoAtuacao = ramoAtuacao
        self.endereco = endereco
    }
    
    
    
  
    //Mark: Metodo de decodificacao via json
    static func decode(fromJson: JSON?) -> Any? {
    
        let subjsonEndereco = fromJson!["endereco"] as JSON
        let endereco = Endereco.decode(fromJson: subjsonEndereco) as? Endereco
        let cliente = Cliente.init(id: fromJson!["id"].int!, cnpj: fromJson!["cnpj"].string!,
                                   razaoSocial: fromJson!["razaoSocial"].string!,
                                   ramoAtuacao: fromJson!["ramoAtuacao"].string!,
                                   endereco: endereco!)

        return cliente
        
    }
    
    
}
