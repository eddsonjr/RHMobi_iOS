//
//  DescricaoVagaViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 13/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class DescricaoVagaViewController: UIViewController {
    
    //Mark: Variavel que recebe a vaga
    static var vaga: Vaga?
    

    //Mark: Variavel dos elementos da tela
    @IBOutlet weak var nomeVagaLabel: UILabel!
    @IBOutlet weak var cargoLabel: UILabel!
    @IBOutlet weak var prazoLabel: UILabel!
    @IBOutlet weak var descricaoVagaTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Carregada a *fragment* de descricao da vaga")
       
        //Populando os elementos na tela
        self.nomeVagaLabel.text = DescricaoVagaViewController.vaga?.nome
        self.cargoLabel.text = DescricaoVagaViewController.vaga?.cargo
        self.prazoLabel.text = DescricaoVagaViewController.vaga?.prazo
        self.descricaoVagaTextArea.text = DescricaoVagaViewController.vaga?.descricao
      
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
