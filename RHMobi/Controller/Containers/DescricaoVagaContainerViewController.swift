//
//  DescReqVagaContainerViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 28/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class DescricaoVagaContainerViewController: UIViewController {
    

    @IBOutlet weak var textArea: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textArea.text = VagaHelper.vaga?.descricao
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    

  
}
