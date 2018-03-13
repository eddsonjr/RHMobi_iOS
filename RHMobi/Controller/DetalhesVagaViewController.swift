//
//  DetalhesVagaViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 13/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class DetalhesVagaViewController: UIViewController {

    
    @IBOutlet weak var viewContainer: UIView!
    
    
    
    
    //mensagem de debug
    var dbgmsg = "[DetalhesVagaViewController]: "
    
    //Mark: Variavel que contera a vaga selecionada na tableview na tela anterior
    var vaga: Vaga?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dbgmsg + " View controller carregada")
        print(dbgmsg + "Vaga selecionada: \(vaga?.nome)")
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    @IBAction func switchInfosVagas(_ sender: UISegmentedControl) {
    }
    
    
}
