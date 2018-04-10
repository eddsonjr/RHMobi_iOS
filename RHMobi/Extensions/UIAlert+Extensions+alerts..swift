//
//  UIAlert+Extensions+alerts..swift
//  RHMobi
//
//  Created by Edson  Jr on 05/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController{
    
    static var alertaProximasVersoes: UIAlertController {
        get{
             let alerta: UIAlertController = UIAlertController(title: "Ooops!", message: "Essa funcionalidade estará disponível em breve nas próximas versões", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            alerta.addAction(okAction)
            return alerta
        }
    }
    
    static var alertaLoginErrado: UIAlertController {
        let alerta: UIAlertController = UIAlertController(title: "Dados incorretos", message: "E-mail ou senha incorretos. Favor verifique e tente novamente", preferredStyle: UIAlertControllerStyle.alert)
        
         let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
         alerta.addAction(okAction)
         return alerta
    }
    
    
    
    static var alertaLoginCorreto: UIAlertController {
        let alerta: UIAlertController = UIAlertController(title: "Bem vindo", message: "Seja bem vindo ao RHMobi", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ action in
            print("Pressionado o Ok do login realizad. Voltando...")
            NotificationCenter.default.post(name: Notification.Name(NotificationKeysEnumHelper.loginRealizado.rawValue), object: self)
        }
        alerta.addAction(okAction)
        return alerta
    }
    
    
    
    static var alertaCadastroRealizadoSucesso: UIAlertController {
        let alerta: UIAlertController = UIAlertController(title: "Cadastro realizado!", message: "Cadastro realizado com sucesso", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        alerta.addAction(okAction)
        return alerta
        
    }
    
    
    static var alertaUsuarioJaCadastrado: UIAlertController {
        let alerta: UIAlertController = UIAlertController(title: "Usuário já cadastrado!", message: "Já existe um usuário cadastrado neste disposivito. Tente fazer login!", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        alerta.addAction(okAction)
        return alerta
        
    }
    
    
    
    
}



/*
 
 
 let alertController = UIAlertController(title: "Destructive", message: "Simple alertView demo with Destructive and Ok.", preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
 let DestructiveAction = UIAlertAction(title: "Destructive", style: UIAlertActionStyle.Destructive) {
 (result : UIAlertAction) -> Void in
 print("Destructive")
 }
 
 // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
 let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
 (result : UIAlertAction) -> Void in
 print("OK")
 }
 
 alertController.addAction(DestructiveAction)
 alertController.addAction(okAction)
 self.presentViewController(alertController, animated: true, completion: nil)
 
 */
