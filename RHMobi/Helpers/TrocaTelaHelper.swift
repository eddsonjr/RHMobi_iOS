//
//  TrocaTelaHelper.swift
//  RHMobi
//
//  Created by Edson  Jr on 14/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit


//Este helper tem por objetivo solicitar a troca de telas dentro do app, usando
//o storyboard id para tanto
class TrocaTelaHelper {

    private static let dbgmsg = "[TrocaTelaHelper]: "
    
    
    //Funcao para chamar a tela de login do aplicativo
    static func chamarTelaLogin(viewController: UIViewController){
        print(dbgmsg + "Carregando tela de login...")
        let controller = LoginViewController.instantiateFromStoryboard()
        

        viewController.present(controller, animated: true, completion: nil)
        
    }
    
    
}
