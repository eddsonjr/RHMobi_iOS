//
//  UserDefaults+Extension.swift
//  RHMobi
//
//  Created by Edson  Jr on 04/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsEnumHelper.usuarioJaLogado.rawValue)
    }
    
    //Mark: Check verify user is logged
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsEnumHelper.usuarioJaLogado.rawValue)
    }
    
    //MARK: Save User email
    func setUserEmail(value: String){
        set(value, forKey: UserDefaultsEnumHelper.somenteEmailUsuarioLogin.rawValue)
      
    }
    
    //MARK: Retrieve User Email
    func getUserEmail() -> String{
        return String(describing: string(forKey: UserDefaultsEnumHelper.somenteEmailUsuarioLogin.rawValue))
    }
    
    
    
}
