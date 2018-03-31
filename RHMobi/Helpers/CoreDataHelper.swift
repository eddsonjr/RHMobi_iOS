//
//  CoreDataHelper.swift
//  CoreDataTeste2
//
//  Created by Edson  Jr on 30/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class CoreDataHelper: NSObject {
    
    //Configurar o contexto para salvar os dados dentro do banco
    static func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
}
