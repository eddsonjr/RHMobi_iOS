//
//  RequisitosVagaViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 13/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class RequisitosVagaViewController: UIViewController {

    //Mark: variavel que ira armazenar a vaga
    static var vaga: Vaga?
    
    
    //Mark: Variaveis de elementos da tela
    @IBOutlet weak var nomeVagaLabel: UILabel!
    @IBOutlet weak var cargoLabel: UILabel!
    @IBOutlet weak var requisitosTextArea: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Carregada a *fragment* de Requisitos")
        
        //Populando os elementos da tela
        self.nomeVagaLabel.text = RequisitosVagaViewController.vaga?.nome
        self.cargoLabel.text = RequisitosVagaViewController.vaga?.cargo
        self.requisitosTextArea.text = extrairRequisitos()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func extrairRequisitos() -> String{
    
        var req: String = ""
        for v in (RequisitosVagaViewController.vaga?.requisitos)! {
            req = req + v.nome + "\n"
        }
        return req
    }
    
}
