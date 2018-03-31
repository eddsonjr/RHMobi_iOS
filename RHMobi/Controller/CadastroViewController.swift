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
    
    //Helper da foto
    var fotoHelper: FotoHelper!
    
    
    //Variavel do tipo Candidato, para sua prover seu cadastro
    var candidato: Candidato = Candidato()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fotoHelper = FotoHelper(viewController: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(CadastroViewController.trocarImagemCadastro), name: NSNotification.Name(rawValue: NotificationKeysEnumHelper.fotoPronta.rawValue), object: nil)
        
        addTapGestureImageView()

       
        //somente para testes
        //TestarDAO()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //Mark: Actions dos botoes e da segmented
    
    @IBAction func cadastrar(_ sender: Any) {
        adqurirDadosDosCampos()
        print(dbgmsg + "Cadastrando: \(candidato)")
        
//        if(CandidatoDAO.salvar(candidato: self.candidato)){
//            print(dbgmsg + "Candidato cadastrado com sucesso")
//        }else{
//            print(dbgmsg + "Falha ao cadastrar ou esta faltando itens")
//        }
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

    
    
    
    //Somente para testes
//    func TestarDAO() {
//
//        //Criando um objeto candidato para testes
//        var candidato: Candidato = Candidato(id: 1, nome: "Raimundao", sobrenome: "de testes", email: "raimundao@burit.com", senha: "12345", rg: "25151777", telefone1: "994517805", telefone2: "996578901", sexo: "M", vagasAssociadas: nil, cv: nil)
//
//
//        //Salvando
//        if(CandidatoDAO.salvar(candidato: candidato)){
//            print("Salvo com sucesso")
//        }else {
//            print("Deu ruim na hora de salvar")
//        }
//
//        //Pegando os dados
//        var candidatos: [CANDIDATO]? = nil
//        candidatos = CandidatoDAO.listarTodos()
//        print("Lista de candidatos salvos: \(candidatos?.count)")
//
//        for c in candidatos! {
//            print(c)
//        }
//
//
//
//        //Procurando por um candidato
//        var candidatoP: CANDIDATO? = nil
//        candidatoP = CandidatoDAO.procurarCandidato(id: 1)
//        print("Candidato encontrado com id1: \(candidato.nome)")
//
//
//
//        //Apagando todos os dados do banco
//        print("Apagando tudo")
//        if(CandidatoDAO.removerTodos()){
//            print("Todos os itens foram removidos")
//        }else{
//            print("Error ao remover")
//        }
//    }
    
    
    //Action da segmented controll para selecao do sexo
    @IBAction func selecaoSexoSegmented(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: //masculino
            self.candidato.sexo = "M"
            break
        case 1: //feminino
            self.candidato.sexo = "F"
            break
        default:
            self.candidato.sexo = "M"
        }
        
    }
    
    
    
    
    
    //Mark: Funcao para pegar os dados dos campos
    func adqurirDadosDosCampos() {
        
        //Pegando os dados dos campos da tela
        candidato.nome = self.nomeTextField.text!
        candidato.sobrenome = self.sobreNomeTextField.text!
        candidato.email = self.emailTextField.text!
        candidato.rg = self.rgTextField.text!
        candidato.telefone1 = self.telefoneTextField.text!
        candidato.telefone2 = self.telefone2TextField.text!
        candidato.senha = self.senhaTextField.text!
        
        
        
    }
    
    
    

}
