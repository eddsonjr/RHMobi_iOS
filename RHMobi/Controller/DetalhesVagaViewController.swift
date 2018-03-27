//
//  DetalhesVagaViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 13/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class DetalhesVagaViewController: UIViewController {

    //Mark: View de ancora para as xibs
    @IBOutlet weak var viewContainer: UIView!
    
    //Mark: Variaveis para as xibs
    var resumoVagaView: UIView!
    var descricaoVagaView: UIView!
    var requisitosVagaView: UIView!
    
    //Variavel da segmented controll
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    
   
    
    
    
    //mensagem de debug
    var dbgmsg = "[DetalhesVagaViewController]: "
    
    //Mark: Variavel que contera a vaga selecionada na tableview na tela anterior
    var vaga: Vaga?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(dbgmsg + " View controller carregada")
        print(dbgmsg + "Vaga selecionada: \(vaga?.nome)")
        
        configurarXibs() //configura os xibs para exibir as informacoes detalhadas da vaga
        self.segmentedControll.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: UIControlState.selected)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    //Mark: Funcao para selecionar o tipo de informacao do detalhe da vaga
    @IBAction func switchInfosVagas(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            viewContainer.bringSubview(toFront: self.resumoVagaView)
            break
        case 1:
            viewContainer.bringSubview(toFront: self.descricaoVagaView)
            break
        case 2:
            viewContainer.bringSubview(toFront: self.requisitosVagaView)
        default:
            break
        }
        
    }
    
    //Mark: Acao do botao de cadindatar - se
    @IBAction func candidatar_se_a_vaga(_ sender: Any) {
        performSegue(withIdentifier: "segueDetalhesLogin", sender: self)
    }

    
   
    
    
    
    //Mark: Funcao para configurar os dados dos xibs
    func configurarXibs() {
        
        ResumoVagaViewController.vaga = self.vaga
        DescricaoVagaViewController.vaga = self.vaga
        RequisitosVagaViewController.vaga = self.vaga
        
        //Inicializacao das views de resumo, descricao e requisitos da vaga
        self.resumoVagaView = ResumoVagaViewController().view
        self.descricaoVagaView = DescricaoVagaViewController().view
        self.requisitosVagaView = RequisitosVagaViewController().view
        
        
        //Adicionando as views de resumo, descricao e requisitos como subviews da ancora
        self.viewContainer.addSubview(self.requisitosVagaView)
        self.viewContainer.addSubview(self.descricaoVagaView)
        self.viewContainer.addSubview(self.resumoVagaView)
        
        
        
        
       
       
    }

    
    
    
}
