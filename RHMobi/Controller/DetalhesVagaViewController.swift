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
    @IBOutlet weak var viewAncoraXibs: UIView!
    
    //Mark: Variaveis de acesso das containers
    @IBOutlet weak var container1: UIView!
    @IBOutlet weak var container2: UIView!
    
    
    
    //ImageView da imagem da vaga
    @IBOutlet weak var imageView: UIImageView!
    
    
    //Variavel da segmented controll
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    
    //mensagem de debug
    var dbgmsg = "[DetalhesVagaViewController]: "
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(dbgmsg + " View controller carregada")
        print(dbgmsg + "Vaga selecionada: \(VagaHelper.vaga?.nome)")
     
        
        //Setando a imagem da vaga
        self.imageView.downloadedFrom(link: (VagaHelper.vaga?.imgUrl)!)
        
        //Setando o titulo da navigation
        self.navigationItem.title = "Resumo da Vaga"
        
        
        //Configurando a aparicao dos containers
        self.container1.isHidden = true
        self.container2.isHidden = false
        
       
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    //Mark: Funcao para selecionar o tipo de informacao do detalhe da vaga
    @IBAction func switchInfosVagas(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:

            
            break
        case 1:

            break
        case 2: break

            
        default:
            break
        }
        
    }
    
    //Mark: Acao do botao de cadindatar - se
    @IBAction func candidatar_se_a_vaga(_ sender: Any) {
        performSegue(withIdentifier: "segueDetalhesLogin", sender: self)
    }
    
    
    
}
