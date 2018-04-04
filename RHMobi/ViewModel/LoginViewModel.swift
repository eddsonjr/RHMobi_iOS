//
//  LoginViewModel.swift
//  RHMobi
//
//  Created by Edson  Jr on 04/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class LoginViewModel{
    
    
    //TODO - TROCAR ESSE METODO PARA PEGAR VIA BANCO AO INVES DE VIA USER DEFAULTS
    func getEmailUsuarioLogin() -> String{
        let emailUsuarioDoUserDefaults = UserDefaults.standard.getUserEmail
        return emailUsuarioDoUserDefaults()
    }

    
}
