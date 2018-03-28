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
    @IBOutlet weak var viewContainer: CardReqDescVaga!
    
    
    //Mark: Variaveis para as xibs
    var resumoVagaView: UIView!
    var descricaoVagaView: UIView!
    var requisitosVagaView: UIView!
    
    //ImageView da imagem da vaga
    @IBOutlet weak var imageView: UIImageView!
    
    
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
     
        
        
        //Setando a imagem da vaga
        self.imageView.downloadedFrom(link: (self.vaga?.imgUrl)!)
        
        //Setando o titulo da navigation
        self.navigationItem.title = "Resumo da Vaga"
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    //Mark: Funcao para selecionar o tipo de informacao do detalhe da vaga
    @IBAction func switchInfosVagas(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
//            viewContainer.bringSubview(toFront: self.resumoVagaView)
//            self.navigationItem.title = "Resumo da Vaga"
            break
        case 1:
//            viewContainer.bringSubview(toFront: self.descricaoVagaView)
//            self.navigationItem.title = "Descrição da Vaga"
            break
        case 2: break
//            viewContainer.bringSubview(toFront: self.requisitosVagaView)
//            self.navigationItem.title = "Requisitos da Vaga"
        default:
            break
        }
        
    }
    
    //Mark: Acao do botao de cadindatar - se
    @IBAction func candidatar_se_a_vaga(_ sender: Any) {
        performSegue(withIdentifier: "segueDetalhesLogin", sender: self)
    }
    
    
    
}
