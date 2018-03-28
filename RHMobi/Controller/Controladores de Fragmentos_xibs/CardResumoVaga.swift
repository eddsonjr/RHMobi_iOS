//
//  CardResumoVaga.swift
//  RHMobi
//
//  Created by Edson  Jr on 28/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit
import Foundation

class CardResumoVaga: UIView {
    
    //Variavel da vaga
   static var vaga: Vaga?
    
    
    //Elementos visuais
    @IBOutlet var mainXibView: UIView!
    @IBOutlet weak var tipoContratoLabel: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    @IBOutlet weak var cargoLabel: UILabel!
    @IBOutlet weak var experienciaLabel: UILabel!
    @IBOutlet weak var dataSubmissaoLabel: UILabel!
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CardResumoVaga", owner: self, options: nil)
        addSubview(mainXibView)
        mainXibView.frame = self.bounds
        mainXibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("CardResumoVaga", owner: self, options: nil)
        addSubview(mainXibView)
        mainXibView.frame = self.bounds
        mainXibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    
    func initElements() {
        self.tipoContratoLabel.text = CardResumoVaga.vaga?.tipoContrato
        self.cargoLabel.text = CardResumoVaga.vaga?.funcao
        self.experienciaLabel.text = CardResumoVaga.vaga?.experiencia
        self.localLabel.text = getLocalVaga()
        
        
    }
    
    
    private func getLocalVaga() -> String{
        return (CardResumoVaga.vaga?.cliente.endereco.cidade)! + "," + (CardResumoVaga.vaga?.cliente.endereco.estado)!
    }
    
    
}
