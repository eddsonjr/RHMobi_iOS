//
//  LoginViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 14/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    private let dbgmsg = "[LoginViewController]: "
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    
    var loginViewModel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dbgmsg + "View de login carregada!")
    
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func VoltarNavigationBar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func popularCampoEmail() {
        
        if self.loginViewModel.getEmailUsuarioLogin() != "" {
            print(dbgmsg + "Email do usuario: \(self.loginViewModel.getEmailUsuarioLogin())")
            
            
            self.emailTextField.text = self.loginViewModel.getEmailUsuarioLogin()
            
        }
    }
    
    
    
    @IBAction func entrar(_ sender: Any) {
        
    }
    
    
    @IBAction func entrarComFacebook(_ sender: Any) {
        
    }
    
    @IBAction func entrarComLinekdln(_ sender: Any) {
        
        
    }
    
    
    @IBAction func esqueciMinhaSenha(_ sender: Any) {
        
        
    }
    
    
    
}
