//
//  JsonHelper.swift
//  Alamofire_SwiftJson_UserDefault_Table_test
//
//  Created by Edson  Jr on 25/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


class JsonHelper {
    
    var url: String?

    init(url: String) {
        self.url = url
    }
    
    func getDataFromJson(completion: @escaping (JSON?) -> Void) {
        Alamofire.request(url!).responseJSON { (responseData) -> Void in
            switch responseData.result {
            case .success(let value): DispatchQueue.main.async { completion(JSON(value)) }
            case .failure(_): completion(nil)
            }
        }
    }
    
    
    
    
    
}
