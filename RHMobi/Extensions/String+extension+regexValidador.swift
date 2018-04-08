//
//  String+extension+regexValidador.swift
//  RHMobi
//
//  Created by Edson  Jr on 03/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    
//    public func isPhone()->Bool {
//        if self.isAllDigits() == true {
//            //let phoneRegex = "/^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$/"
//            //let phoneRegex = "[235689][0-9]{6}([0-9]{3})?"
//            let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
//            return  predicate.evaluate(with: self)
//        }else {
//            return false
//        }
//    }
    
   
    public  func isAllDigits()->Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  self == filtered
    }
    

    public func isEmailValid()->Bool {
        let emailFormat = "^[a-z0-9._]+@[a-z0-9]+\\.[a-z]+(\\.[a-z]+)?$"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with:self)
    }

    
    
    
    
}
    
    

