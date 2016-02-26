//
//  TrailCell.swift
//  MtbBosnia
//
//  Created by Adis Mulabdic on 2/25/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import UIKit

class TrailCell: UITableViewCell {
    
    @IBOutlet weak var trailImg: UIImageView!
    @IBOutlet weak var nazivStaze: UILabel!
    @IBOutlet weak var visinaStaze: UILabel!
    @IBOutlet weak var duzinaStaze: UILabel!

    var staze: ListaStaza!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func drawRect(rect: CGRect) {
        
        //trailImg.layer.cornerRadius = trailImg.frame.size.width / 2
        trailImg.layer.cornerRadius = 20
        trailImg.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(staze: ListaStaza) {
        self.staze = staze
        
        nazivStaze.text = self.staze.imeStaze
        visinaStaze.text = self.staze.visinaStaze
        duzinaStaze.text = self.staze.duzinaStaze
        trailImg.image = UIImage(named: "\(self.staze.imgId)")
    }
    
    /*func confCell(imgStaze: UIImage, nazivLbl: String, usponLbl: String, duzinaLbl: String) {
        
        trailImg.image = imgStaze
        nazivStaze.text = nazivLbl
        visinaStaze.text = usponLbl
        duzinaStaze.text = duzinaLbl

    }*/

}
