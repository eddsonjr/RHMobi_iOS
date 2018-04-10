//
//  LoginViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 14/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    private let dbgmsg = "[LoginViewController]: "
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    
    var loginViewModel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dbgmsg + "View de login carregada!")
        
        
        print(dbgmsg + "Usuarios na base de dados: ")
        loginViewModel.getAllCandidatos()
    
        
        //Configurando o delegate dos uitextview para que as funcoes do teclado
        //sejam executadas
        self.emailTextField.delegate = self
        self.senhaTextField.delegate = self
        
        
        //Notificacao para troca de tela
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.voltarParaTeladeListagem), name: NSNotification.Name(rawValue: NotificationKeysEnumHelper.loginRealizado.rawValue), object: nil)
        
        
        
        
        //Configuracao do teclado para recolher e expandir no caso de edicao
        
        NotificationCenter.default.addObserver(self, selector: #selector(CadastroViewController.keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(CadastroViewController.keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    
        
        
        
       
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
        if loginViewModel.logar(email: emailTextField.text!, senha: senhaTextField.text!){
            self.present(UIAlertController.alertaLoginCorreto, animated: true, completion: nil)
        }else {
            self.present(UIAlertController.alertaLoginErrado, animated: true, completion: nil)
        }
        
        
    }
    
    
    @IBAction func entrarComFacebook(_ sender: Any) {
        print(dbgmsg + "Proximas versoes....")
        self.present(UIAlertController.alertaProximasVersoes, animated: true, completion: nil)
        
    }
    
    @IBAction func entrarComLinekdln(_ sender: Any) {
         print(dbgmsg + "Proximas versoes....")
         self.present(UIAlertController.alertaProximasVersoes, animated: true, completion: nil)
        
    }
    
    
    @IBAction func esqueciMinhaSenha(_ sender: Any) {
        print(dbgmsg + "Proximas versoes....")
        self.present(UIAlertController.alertaProximasVersoes, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    //Mark: Funcoes para  fazer o teclado ficar sempre abaixo dos textView e recolher ao clicar em done
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    
    
    
    //Mark: Funcao para carregar o teclado
    @objc func voltarParaTeladeListagem() {
        print(dbgmsg + "Chamando a tela de listagem de vaga.")
        
    }

    
    
    
}
