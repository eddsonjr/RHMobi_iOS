//
//  CadastroAreasInteresseViewController.swift
//  RHMobi
//
//  Created by Edson  Jr on 11/04/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit


//View que contem uma collectionview para mostrar as areas de interesse do candidato
class CadastroAreasInteresseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    //Mark: Componentes da tela
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Mark: CollectionView datasource
    var areasInteresseDataSource = [AreasInteresse]()

    private final let dbgmsg = "[CadastroAreasInteresseVC]: "
    
    
    //Mark: Reuso da celula
    let cellReuse = "collectionViewCell"
    

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
    
    
    //################## FUNCOES DE COLLECTIONVIEW #############
    //Mark: Metodos dos protocolos da collectionview
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.areasInteresseDataSource.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellReuse, for: indexPath as IndexPath) as! AreasInteresseCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.nomeLabelAreaInteresse.text = self.areasInteresseDataSource[indexPath.item].nome
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
}
