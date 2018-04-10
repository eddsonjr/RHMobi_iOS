//
//  CadastroViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 15/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController,UITextFieldDelegate {
    
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
        
        //Configurando
        self.nomeTextField.delegate = self
        self.sobreNomeTextField.delegate = self
        self.rgTextField.delegate = self
        self.telefoneTextField.delegate = self
        self.telefone2TextField.delegate = self
        self.emailTextField.delegate = self
        self.senhaTextField.delegate = self
        self.confirmarSenhaTextField.delegate = self
        
        
        
        
        self.fotoHelper = FotoHelper(viewController: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(CadastroViewController.trocarImagemCadastro), name: NSNotification.Name(rawValue: NotificationKeysEnumHelper.fotoPronta.rawValue), object: nil)
        
        addTapGestureImageView()
        
        
        let l = viewModel.listarTodosOsCandidatos()
        for a in l {
            print("Dados do candidato: \(a.nome) -- \(a.sobrenome) -- \(a.email) -- \(a.id)")
        }
        
        
        
        //Teclado
        NotificationCenter.default.addObserver(self, selector: #selector(CadastroViewController.keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(CadastroViewController.keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        
        addDoneButtonOnKeyboard() //Adicionando um done nos teclados numericos
        

       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //Mark: Actions dos botoes e da segmented
    
    @IBAction func cadastrar(_ sender: Any) {
        print(dbgmsg + "Pressionado o botao de cadastrar")
        if(adqurirDadosDosCamposEValidando()){
            cadastrarCandidato()
           
        }else{
            print(dbgmsg + "Erros encontrados durante o cadastro.")
        }

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
    func adqurirDadosDosCamposEValidando() -> Bool {
        
        //Adquirindo dados dos campos de texto da tela e validando
        let retornoVerificar = self.viewModel.validarDadosUsuario(nome: self.nomeTextField.text, sobrenome: self.sobreNomeTextField.text, sexo: self.sexo, cpf: self.rgTextField.text, email: self.emailTextField.text, senha: self.senhaTextField.text, confirmarSenha: self.confirmarSenhaTextField.text, celular: self.telefoneTextField.text, convencional: self.telefone2TextField.text)

        
        
        
        
        
        return retornoVerificar.0
    }
    
    
    
    
    
    func cadastrarCandidato(){
        
        print(dbgmsg + "Chamando a funcao para cadastrar")
        
        //Salvando o email no UserDefaults
        UserDefaults.standard.setUserEmail(value: self.emailTextField.text!)
        
        //Cadastrando...
        viewModel.cadastrar(id: 1, nome: self.nomeTextField.text!, sobrenome: self.sobreNomeTextField.text!, sexo: self.sexo, cpf: self.rgTextField.text!, email: self.emailTextField.text!, senha: self.senhaTextField.text!, telefone1: self.telefoneTextField.text!, telefone2: self.telefone2TextField.text!)
        
        self.navigationController?.popViewController(animated: true)
        
        
        
    }
    
    
    
    
    func trocarLabelEImagemDeValidacao(label: UILabel, image: UIImageView, status: Int){
        
        //Codigo de status
        //0: Incorreto
        //1: Incompleto
        //Default: Confirmado
        
        
        switch status {
        case 0:
                label.text = "Preencha"
                label.textColor = UIColor(red: 233/256, green: 162/256, blue: 67/256, alpha: 1.0)
                image.image = #imageLiteral(resourceName: "Botao atenção")
                image.isHidden = false
                label.isHidden = false
                break
        case 1:
                label.text = "Verifique"
                label.textColor = UIColor(red: 227/256, green: 82/256, blue: 101/256, alpha: 1.0)
                image.image = #imageLiteral(resourceName: "Botao errado")
                image.isHidden = false
                label.isHidden = false
                break
            
        default:
                label.text = "Confirmado"
                label.textColor = UIColor(red: 53/256, green: 157/256, blue: 132/256, alpha: 1.0)
                image.image = #imageLiteral(resourceName: "Botao confirmado")
                image.isHidden = false
                label.isHidden = false
        }
        
    }
    
    
    
    
    
    
    
    
    //Mark: Metodos de teclado e interacao via teclado
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
 
    
    
    
    
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(CadastroViewController.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.telefoneTextField.inputAccessoryView = doneToolbar
        self.telefone2TextField.inputAccessoryView = doneToolbar
        self.rgTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.rgTextField.resignFirstResponder()
        self.telefoneTextField.resignFirstResponder()
        self.telefone2TextField.resignFirstResponder()
    }
    
    

}
