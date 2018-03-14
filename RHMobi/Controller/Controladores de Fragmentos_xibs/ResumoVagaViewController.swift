//
//  ResumoVagaViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 13/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class ResumoVagaViewController: UIViewController {
    
    //Mark: Variavel que ira receber o objeto vaga
    static var vaga: Vaga?
    

    
    //Mark: Variaveis que representam os elementos na tela
    @IBOutlet weak var nomeVagaLabel: UILabel!
    @IBOutlet weak var cargoPretendidoLabel: UILabel!
    @IBOutlet weak var prazoLabel: UILabel!
    @IBOutlet weak var tipoContratoLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    @IBOutlet weak var tipoEmpregoLabel: UILabel!
    @IBOutlet weak var experienciaLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Carregada a *fragment* de resumo")
        
        self.nomeVagaLabel.text = ResumoVagaViewController.vaga?.nome
        self.cargoPretendidoLabel.text = ResumoVagaViewController.vaga?.cargo
        self.prazoLabel.text = ResumoVagaViewController.vaga?.prazo
        self.tipoEmpregoLabel.text = ResumoVagaViewController.vaga?.tipoContrato
        self.enderecoLabel.text = "Local de testes"
        self.tipoEmpregoLabel.text = ResumoVagaViewController.vaga?.tipoContrato
        self.experienciaLabel.text = ResumoVagaViewController.vaga?.experiencia
        
     
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    @IBAction func favoritar(_ sender: Any) {
        print("FAVORITANDO VAGA...")
    
    }
    

  

}
