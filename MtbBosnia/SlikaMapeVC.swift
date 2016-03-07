//
//  SlikaMapeVC.swift
//  MtbBosnia
//
//  Created by Adis Mulabdic on 2/26/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import UIKit

class SlikaMapeVC: UIViewController {

    var iD: Int!
    var tempID: Int!
    
    @IBOutlet weak var imageMapa: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tempID = iD
        imageMapa.image = UIImage(named: "mapa_\(iD)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
