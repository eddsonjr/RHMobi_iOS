//
//  CadastroSelecaoAreasViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 11/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit


//View que contem uma tablewView e uma searchbar para pesquisar as areas de interesse para que
//o candidato possa escolher
class CadastroSelecaoAreasViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate  {

    private final let dbgmsg = "[CadastroSelecaoAreasVC]: "
    
    
    //Mark: Searchbar e tableView
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    //Mark: lista de variaveis
    var listaAreasInteresse  = [AreasInteresse]()
    var procurando = false //Controla se a pessoa esta ou nao pesquisando
    var dadosFiltrados = [AreasInteresse]()
    
    
    //Mark: variavel do viewModel
    var viewModel = CadastroViewModel(url: "") //TODO - IMPLEMENTAR A URL PARA BAIXAR A LISTA DE INTERESSES
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configurando o delegate e o datasource da tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //Configurando o delegate da search bar
        self.searchBar.delegate = self
        self.searchBar.returnKeyType = UIReturnKeyType.done
        
        
        
        //Baixando a lista de interesses
        self.viewModel.baixarListaAreasInteresse { areas in
            print(self.dbgmsg + "Tableview com \(areas.count) celulas que vieram do json...")
            self.listaAreasInteresse = areas
            self.tableView.reloadData()
        }
        
        
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //##################### FUNCOES DA TABLEVIEW ########################
    //Mark: funcoes da table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.listaAreasInteresse.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    

}
