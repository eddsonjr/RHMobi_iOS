//
//  VagasTableViewCell.swift
//  RHMobi
//
//  Created by Edson  Jr on 12/03/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class VagasTableViewCell: UITableViewCell {

    
    @IBOutlet weak var vagaImageView: UIImageView!
    @IBOutlet weak var vagaNomeLabel: UILabel!
    @IBOutlet weak var vagaAreaInteresseLabel: UILabel!
    @IBOutlet weak var vagaDataSubmissao: UILabel!
    @IBOutlet weak var vagaCellUIView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
