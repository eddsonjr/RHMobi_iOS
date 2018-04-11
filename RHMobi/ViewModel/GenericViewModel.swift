//
//  GenericViewModel.swift
//  RHMobi
//
//  Created by Edson  Jr on 09/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Alamofire
import SwiftyJSON



/*
 Esta classe contem metodos que serao usados mais de uma vez no aplicativo, servindo como uma
 view model generica, que sera herdada por outras view model
 */
class GenericViewModel: NSObject {
    
    
    //Mark: Lista de atributos
    var url: String? //Url responsavel para envio e recebimento de dados via json
    
    override init() {
        
    }
    
    
    //Mark: construtores
    init(url: String) { //Construtor basico para envio e recebimento de dados via json
        self.url = url
    }
    
    
    //Mark: Metodos de envio e recebimento de dados via json
    func getDataFromJson(completion: @escaping (JSON?) -> Void) { //recebe dados via json
        Alamofire.request(url!).responseJSON { (responseData) -> Void in
            switch responseData.result {
            case .success(let value): DispatchQueue.main.async { completion(JSON(value)) }
            case .failure(_): completion(nil)
            }
        }
    }
    
    
    //TODO - ENVIAR DADOS JSON VIA WEB
    
    
    
    
    
    
    

    
  
}
