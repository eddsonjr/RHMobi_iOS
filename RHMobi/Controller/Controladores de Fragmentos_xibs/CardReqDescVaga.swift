//
//  CadReqDescVaga.swift
//  RHMobi
//
//  Created by Edson  Jr on 28/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class CardReqDescVaga: UIView {

    @IBOutlet weak var textArea: UITextView!
    @IBOutlet var mainView: UIView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CardReqDescVaga", owner: self, options: nil)
        addSubview(mainView)
        mainView.frame = self.bounds
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("CardReqDescVaga", owner: self, options: nil)
        addSubview(mainXibView)
        mainXibView.frame = self.bounds
        mainXibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    

}
