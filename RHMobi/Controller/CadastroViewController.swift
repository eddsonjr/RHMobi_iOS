//
//  CadastroViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 15/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {
    
    //Mark: Variaveis de elementos da tela
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var sobreNomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var rgTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    private let dbgmsg = "[CadastroViewController]: "
    
    //Helper da foto
    var fotoHelper: FotoHelper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fotoHelper = FotoHelper(viewController: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(CadastroViewController.trocarImagemCadastro), name: NSNotification.Name(rawValue: NotificationKeysEnumHelper.fotoPronta.rawValue), object: nil)
        
        addTapGestureImageView()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    //Mark: Actions dos botoes e da segmented
    
    @IBAction func cadastrar(_ sender: Any) {
        
    }
    
    
    @IBAction func anexarCurriculo(_ sender: Any) {
        
    }
    
    
  
    @IBAction func areasDeInteresse(_ sender: Any) {
        
    }
    
    
    //Segmented Controll
    
    @IBAction func selecaoSexo(_ sender: UISegmentedControl) {
    }
    
    
    
    //Mark: Funcao para adicionar tap gesture na imageview
    func addTapGestureImageView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }
    
    
    //Funcao de acao do tap gesture
    @objc func imageViewTapped() {
        print(dbgmsg + "Selecionando uma imagem.")
        self.fotoHelper.carregarFotoGaleria()
    }
    

    
    
    
    //Mark: Funcao que sera disparada pela notification para trocar imagem
    @objc func trocarImagemCadastro() {
        print(dbgmsg + "Trocando imagem...")
        self.imageView.image = self.fotoHelper.getImage()
    }


}
