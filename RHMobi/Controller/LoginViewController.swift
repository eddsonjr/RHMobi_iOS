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
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(done))
        //navItem.rightBarButtonItem = doneItem
        navItem.leftBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    
    @objc func done() {
        print("")
        
    }
    
    

}
