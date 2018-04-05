//
//  UIImageView+extension.swift
//  JsonTest_v4
//
//  Created by Edson  Jr on 10/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit



//usage : imageView.downloadedFrom(link: "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")

//Esta extensao e resposnavel por realizar o download de imagens da internet de forma assincrona
//e ja coloca - las dentro de uma imageview

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
    
    
    
    
    //UIImageView arredondada
    func makeRounded() {
        let radius = self.frame.size.width/2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        
        //self.layer.masksToBounds = true
    }
    
    
    
    
}
