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
    @IBOutlet weak var telefone2TextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var confirmarSenhaTextField: UITextField!
    
    private let dbgmsg = "[CadastroViewController]: "
    
    //Mark: Labels e images de confirmacao dos dados
    @IBOutlet weak var nomeLabelConfirmacao: UILabel!
    @IBOutlet weak var nomeImageConfirmacao: UIImageView!
    @IBOutlet weak var sobrenomeLabelConfirmacao: UILabel!
    @IBOutlet weak var sobrenomeImageConfirmacao: UIImageView!
    @IBOutlet weak var emailLabelConfirmacao: UILabel!
    @IBOutlet weak var emailImageConfirmacao: UIImageView!
    @IBOutlet weak var rgLabelConfirmacao: UILabel!
    @IBOutlet weak var rgImageConfirmacao: UIImageView!
    @IBOutlet weak var telefone1LabelConfirmacao: UILabel!
    @IBOutlet weak var telefone1ImageConfirmacao: UIImageView!
    @IBOutlet weak var telefone2LabelConfirmacao: UILabel!
    @IBOutlet weak var telefone2ImageConfirmacao: UIImageView!
    @IBOutlet weak var confirmarSenhaLabelConfirmacao: UILabel!
    @IBOutlet weak var confirmarSesnhaImageConfirmacao: UIImageView!
    
    
    
    
    //Helper da foto
    var fotoHelper: FotoHelper!
    
    
    //View model
    let viewModel: CadastroViewModel = CadastroViewModel()
    
    var sexo: String = "M"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fotoHelper = FotoHelper(viewController: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(CadastroViewController.trocarImagemCadastro), name: NSNotification.Name(rawValue: NotificationKeysEnumHelper.fotoPronta.rawValue), object: nil)
        
        addTapGestureImageView()
        
        
        let l = viewModel.listarTodosOsCandidatos()
        for a in l {
            print("Dados do candidato: \(a.nome) -- \(a.sobrenome) -- \(a.email) -- \(a.id)")
        }
        

       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //Mark: Actions dos botoes e da segmented
    
    @IBAction func cadastrar(_ sender: Any) {
        adqurirDadosDosCampos()

    }
    
    
    @IBAction func anexarCurriculo(_ sender: Any) {
        
    }
    
    
  
    @IBAction func areasDeInteresse(_ sender: Any) {
        
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

    
    
  
    //Action da segmented controll para selecao do sexo
    @IBAction func selecaoSexoSegmented(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: //masculino
            self.sexo = "M"
            break
        case 1: //feminino
            self.sexo = "F"
            break
        default:
           self.sexo = "M"
        }
        
    }
    
    
    
    
    
    //Mark: Funcao para pegar os dados dos campos
    func adqurirDadosDosCampos() {
        
        let nome = nomeTextField.text // Adiquirindo o nome
        
        
        
        
        
        
        
        
        viewModel.cadastrar(id: 1, nome: self.nomeTextField.text!, sobrenome: self.sobreNomeTextField.text!, sexo: self.sexo, rg: self.rgTextField.text!, email: self.emailTextField.text!, senha: self.senhaTextField.text!, telefone1: self.telefoneTextField.text!, telefone2: self.telefone2TextField.text!)
        
        
    }
    
    
    

}
