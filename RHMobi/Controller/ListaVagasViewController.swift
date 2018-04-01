//
//  ViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 12/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit


class ListaVagasViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    //Mark: Atributos visuais
    @IBOutlet weak var vagasTableView: UITableView!
    @IBOutlet weak var vagasSearchBar: UISearchBar!
  
    
    private final let dbgmsg = "[ListaVagasViewController]: "
    
    //Mark: Lista de variaveis
    var listaVagas = [Vaga]()
    var procurando = false //Controla se a pessoa esta pesquisando
    var dadosFiltradosBusca = [Vaga]()
    
    
    //Mark: variavel do viewmodel da lista de vagas e dos detalhes da vaga
    var viewModel = ListaEDetalheVagaViewModel()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    

        //Configurando o delegate e o datasource da tableView
        self.vagasTableView.delegate = self
        self.vagasTableView.dataSource = self
        
        //Configurando o delegate da search bar
        self.vagasSearchBar.delegate = self
        self.vagasSearchBar.returnKeyType = UIReturnKeyType.done
    
        
        viewModel.baixarListaVagaJson { vaga in
            print(self.dbgmsg + "Tableview tera \(vaga.count) celulas que vieram do json...")
            self.listaVagas = vaga
            self.vagasTableView.reloadData()
        }
        
      
       
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    //#### FUNCOES DA TABLE VIEW ######
    
    //Mark: Funcoes para conformar com os protocolos da tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.procurando {
            return self.dadosFiltradosBusca.count
        }
        
        return self.listaVagas.count
    }


    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VagasCell") as? VagasTableViewCell
        
        if procurando {
            //Acessando os atributos da celula
            cell?.vagaNomeLabel.text = self.dadosFiltradosBusca[indexPath.row].nome
            cell?.vagaDataSubmissao.text = self.dadosFiltradosBusca[indexPath.row].prazo
            //cell?.vagaAreaInteresseLabel.text = self.dadosFiltradosBusca[indexPath.row].funcao
            
            //Fazendo download da imagem de forma assincrona
            cell?.vagaImageView.downloadedFrom(link: self.dadosFiltradosBusca[indexPath.row].imgUrl)
            
        }else {
            //Acessando os atributos da celula
            cell?.vagaNomeLabel.text = self.listaVagas[indexPath.row].nome
            cell?.vagaDataSubmissao.text = self.listaVagas[indexPath.row].prazo
            //cell?.vagaAreaInteresseLabel.text = self.listaVagas[indexPath.row].funcao
            
            
            //Fazendo download da imagem de forma assincrona
            cell?.vagaImageView.downloadedFrom(link: self.listaVagas[indexPath.row].imgUrl)
            
        }
        
        return cell!
    }


    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Disparar acao ao selecionar uma celula e tambem armazenando a celula no helper
        VagaHelper.vaga = self.listaVagas[(self.vagasTableView.indexPathForSelectedRow?.row)!]
        performSegue(withIdentifier: "segueDetalhesVaga", sender: self)

    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 131
    }
    
    
    
    
    //####### FUNCOES PARA SEARCH BAR #########
    
    
    //Funcao para realizar busca
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Procurando...")
        if(vagasSearchBar.text == nil || vagasSearchBar.text == "") {
                self.procurando = false
                view.endEditing(true)
                self.vagasTableView.reloadData()
        }else {
            procurando = true
            self.dadosFiltradosBusca = self.listaVagas.filter({ vaga -> Bool in
                guard let texto = self.vagasSearchBar.text else {return false}
                return vaga.nome.containsIgnoringCase(find: texto)
            })
            
            self.vagasTableView.reloadData()
            
        }
    }
}

