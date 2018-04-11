//
//  CadastroAreasInteresseViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 11/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit


//View que contem uma collectionview para mostrar as areas de interesse do candidato
class CadastroAreasInteresseViewController: UIViewController {
    
    
    private final let dbgmsg = "[CadastroAreasInteresseVC]: "

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        //Configurando um observador para indicar que uma determinada area de interesse foi cadastrada pelo usuario
        NotificationCenter.default.addObserver(self, selector: #selector(CadastroAreasInteresseViewController.notificarAreaInteresseAdicionada), name: NSNotification.Name(rawValue: NotificationKeysEnumHelper.areaInteresseAdicionada.rawValue), object: nil)

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    
    
    
    
    
    
    
    
    
    
    //############ FUNCAO DE NOTIFICACAO ########################
    //Mark: funcao para notificacao
    @objc func notificarAreaInteresseAdicionada() {
        print(dbgmsg + "Notificando a adesao de uma area de interesse.")
        
        print(dbgmsg + "Vaga adqurida: \(VagaHelper.areaInteresseTroca?.nome)")
        
    }
    


}
