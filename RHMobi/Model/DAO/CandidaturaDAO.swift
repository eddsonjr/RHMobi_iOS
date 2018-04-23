//
//  CandidaturaDAO.swift
//  RHMobi
//
//  Created by Edson  Jr on 19/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class CandidaturaDAO: NSObject{
    
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
}
