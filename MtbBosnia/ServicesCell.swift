//
//  ServicesCell.swift
//  MtbBosnia
//
//  Created by Adis Mulabdic on 3/7/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import UIKit

class ServicesCell: UITableViewCell {

    @IBOutlet weak var nazivGrada: UILabel!
    @IBOutlet weak var nazivRadnje: UILabel!
    @IBOutlet weak var slikaRadnje: UIImageView!   
    
    var servisi: Servisi!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func drawRect(rect: CGRect) {
        slikaRadnje.layer.cornerRadius = 10
        slikaRadnje.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(servisi: Servisi) {
        self.servisi = servisi
        
        nazivGrada.text = self.servisi.gradServisa
        nazivRadnje.text = self.servisi.nazivServisa
        slikaRadnje.image = UIImage(named: "\(self.servisi.imgId)")
    }

}
