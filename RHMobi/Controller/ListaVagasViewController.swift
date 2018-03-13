//
//  ViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 12/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit


class ListaVagasViewController: UIViewController,JsonDelegate,UITableViewDelegate,UITableViewDataSource {
    
    //Mark: Atributos visuais
    @IBOutlet weak var vagasTableView: UITableView!
    
    
    //Mark: Lista de variaveis
    var listaVagas = [Vaga]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Configurando o delegate e o datasource da tableView
        self.vagasTableView.delegate = self
        self.vagasTableView.dataSource = self
        
        //Fazendo download do json
        decode(jsonUrl: UrlEnumHelper.vagasDownlodUrl.rawValue) {
            print("Download sucessfull....")
            self.vagasTableView.reloadData()
        }
        
       
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
    
    
    
    //Mark: Funcoes do delegate JsonDelegate
    func decode(jsonUrl: String, completionHandler: @escaping () -> ()) {
        let url = URL(string: jsonUrl)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do{
                    self.listaVagas = try JSONDecoder().decode([Vaga].self, from: data!)
                    
                    //Somente para impressao
                    print("Json downloaded: ")
                    print(String(data: data!, encoding: .utf8))
                    
                    DispatchQueue.main.async {
                        completionHandler()
                    }
                }catch let err {
                    print("Json error")
                    print(err)
                }
            }
            
            }.resume()
        
        
    }

    
    func encode(jsonUrl: String) {
        //Nothing todo here!
    }

    
    
    
    
    
    //Mark: Funcoes para conformar com os protocolos da tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listaVagas.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VagasCell") as? VagasTableViewCell
        
        //Acessando os atributos da celula
        cell?.vagaNomeLabel.text = self.listaVagas[indexPath.row].nome
        cell?.vagaDataSubmissao.text = self.listaVagas[indexPath.row].prazo
        cell?.vagaAreaInteresseLabel.text = self.listaVagas[indexPath.row].cargo
        
        
        //Fazendo download da imagem de forma assincrona
        cell?.vagaImageView.downloadedFrom(link: self.listaVagas[indexPath.row].imgUrl)
        
        return cell!
        
        
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Disparar acao ao selecionar uma celula

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}

