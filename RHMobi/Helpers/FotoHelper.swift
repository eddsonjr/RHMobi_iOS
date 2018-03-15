//
//  PhotoHelper.swift
//  PhotoTest
//
//  Created by Edson  Jr on 15/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit

class FotoHelper: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var viewController: UIViewController!
    private var imagePicker: UIImagePickerController?
    private let dbgmsg = "[PhotoHelper]: "
    private var image: UIImage?
    
    
    
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    

    func carregarFotoGaleria() {
        print(dbgmsg + "Carregando fotos da galeria")
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            self.imagePicker = UIImagePickerController()
            imagePicker?.delegate = self
            imagePicker?.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker?.allowsEditing = true
            self.viewController.present(imagePicker!, animated: true, completion: nil)
        }else{
            print(dbgmsg + "ATENCAO: BIBLIOTECA DE FOTOS NAO DISPONIVEL!")
        }
        
    }
    
    func carregarFotoCamera() {
        print(dbgmsg + "Tirando foto com a camera")
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.imagePicker = UIImagePickerController()
            imagePicker?.delegate = self
            imagePicker?.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker?.allowsEditing = true
            self.viewController.present(imagePicker!, animated: true, completion: nil)
        }else{
            print(dbgmsg + "ATENCAO: CAMERA NAO DISPONIVEL!")
        }
        
    }
    
    
    // MARK: - UIImagePickerControllerDelegate methods
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(dbgmsg + "Imagem selecionada. Verificando se ela esta no formato correto e dando dismiss...")
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.image = image
        }
        
        self.viewController.dismiss(animated: true, completion: {
            print(self.dbgmsg + "Disparando notificacao para chamar que se possa pegar a imagem...")
            NotificationCenter.default.post(name: Notification.Name(NotificationKeysEnumHelper.fotoPronta.rawValue), object: self)
            
        })
    }
    
    
    

    func getImage() -> UIImage{
        return self.image!
    }
    
}


/*
 USO: Esta classe tem por objetivo permitir o re-uso de codigo para tirar fotos com a camera
 ou pegar fotos da galeria de imagem. Para o seu funcionamento, a classe trabalha com notificacao, permitindo que a imagem tirada ou da camera ou da biblioteca seja depois pega na classe que esta chamanado.
 
 
 Para isso, na classe que você ira precisar da biblioteca, adicione um observer do
 notificationcenter, exemplo:
 
  NotificationCenter.default.addObserver(self, selector: #selector(ViewController.dispararQuandoNotificar), name: NSNotification.Name(rawValue: notificationKey), object: nil)
 
 
 [Coloco que codigo dentro da viewDidLoad]
 
 Depois disso defina uma funcao como coletora da notificacao (um seletor), exemplo:
 
 @objc func dispararQuandoNotificar() {
 print("Notificacao chegou la da PhotoHelper")
 self.imageView.image = photoHelper.getImage()
 }
 
 
 Importante > Adicione as seguintes linhas no info p.list:
 <key>NSPhotoLibraryUsageDescription</key>
 <string>O aplicativo gostaria de poder ter acesso a sua galeria de fotos.</string>
 

 */

