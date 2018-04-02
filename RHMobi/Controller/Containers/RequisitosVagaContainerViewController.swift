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
        print("AQUI CARALHO.. PORRA... FILHO DA PUTA")
        self.reqTextArea.text = crirarListaRequisitos()
        print("Lista: \(crirarListaRequisitos())")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    private func crirarListaRequisitos() -> String {
        
        let setRequisitosVaga = VagaHelper.vaga?.requisitos
       
        var reqString = ""
        for req in setRequisitosVaga! {
            reqString = reqString + req.nome + "\n"
        }
        
        return reqString
        
    }

}
