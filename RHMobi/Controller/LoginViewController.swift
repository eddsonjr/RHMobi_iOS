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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dbgmsg + "View carregada!")
        setNavigationBar()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 60, width: screenSize.width, height: 96))
        let navItem = UINavigationItem(title: "Login")
        let back = UIBarButtonItem(title: "Back",style: .plain, target: nil,action: #selector(goBack))
        navItem.leftBarButtonItem = back
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    
    
    @objc func goBack() {
        print("Go Back pressionado")
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
