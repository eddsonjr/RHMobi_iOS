//
//  ResumoVagaContainerViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 28/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class ResumoVagaContainerViewController: UIViewController {
    
    
    @IBOutlet weak var tipoContratoLabel: UILabel!
    @IBOutlet weak var localVagaLabel: UILabel!
    @IBOutlet weak var cargoVagaLabel: UILabel!
    @IBOutlet weak var experienciaVagaLabel: UILabel!
    @IBOutlet weak var submissaoVagaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configurando os campos para carregar os dados da vaga
        popularLabels()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func popularLabels(){
        self.tipoContratoLabel.text = VagaHelper.vaga?.tipoContrato
        self.cargoVagaLabel.text = VagaHelper.vaga?.funcao
        self.experienciaVagaLabel.text = VagaHelper.vaga?.experiencia
        self.submissaoVagaLabel.text = VagaHelper.vaga?.prazo
       
        
        let localVaga = (VagaHelper.vaga?.cliente?.cidade)! + "," +  (VagaHelper.vaga?.cliente?.estado)!
        
         self.localVagaLabel.text = localVaga
        
    }



}
