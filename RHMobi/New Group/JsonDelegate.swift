//
//  JsonDelegate.swift
//  RHMobi
//
//  Created by Edson  Jr on 12/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation

protocol JsonDelegate {
    func decode(jsonUrl: String, completionHandler: @escaping () -> ())
    func encode(jsonUrl: String)
    
}
