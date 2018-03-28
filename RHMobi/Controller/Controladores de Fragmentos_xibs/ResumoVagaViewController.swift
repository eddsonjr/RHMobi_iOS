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
    @IBOutlet weak var tipoContratoLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    @IBOutlet weak var tipoEmpregoLabel: UILabel!
    @IBOutlet weak var experienciaLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Carregada a *fragment* de resumo")
        
        self.tipoContratoLabel.text = ResumoVagaViewController.vaga?.tipoContrato
        self.enderecoLabel.text = criarStringParaEndereco()
        //self.tipoEmpregoLabel.text = ResumoVagaViewController.vaga?.
        self.experienciaLabel.text = ResumoVagaViewController.vaga?.experiencia
        
       
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func criarStringParaEndereco() -> String {
        var end: String = (ResumoVagaViewController.vaga?.cliente.endereco.logradouro)! + "," + "\n" +
            (ResumoVagaViewController.vaga?.cliente.endereco.bairro)! + "," + "\n" +
            (ResumoVagaViewController.vaga?.cliente.endereco.cep)!
        
        return end
    }
    
    

  

}
