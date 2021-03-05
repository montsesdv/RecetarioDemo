//
//  Menu.swift
//  RecetarioDemo
//
//  Created by Montserrat De la Paz on 04/03/21.
//  Copyright © 2021 Montserrat De la Paz. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var nombrebl: UILabel!
    @IBOutlet weak var categoriabl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
