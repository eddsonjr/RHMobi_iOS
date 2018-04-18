//
//  RequisitosVagaContainerViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 02/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class RequisitosVagaContainerViewController: UIViewController {

    @IBOutlet weak var reqTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reqTextArea.text = VagaHelper.vaga?.requisitos
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

}
