//
//  ViewController.swift
//  MtbBosnia
//
//  Created by Adis Mulabdic on 2/24/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageSecond: UIImageView!
    @IBOutlet weak var mtbView: UIView!
    @IBOutlet weak var segmentTrails: UISegmentedControl!
    
    @IBOutlet weak var imageTrails: UIImageView!
    @IBOutlet weak var mtbTrailLbl: UILabel!
    @IBOutlet weak var serviceImg: UIImageView!
    @IBOutlet weak var serviceLbl: UILabel!
    @IBOutlet weak var soonLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentChange(sender: UISegmentedControl) {
        
        switch segmentTrails.selectedSegmentIndex {
        case 0:
            imageTrails.hidden = false
            mtbTrailLbl.hidden = false
            serviceImg.hidden = false
            serviceLbl.hidden = false
            soonLbl.hidden = true
            
        case 1:
            imageTrails.hidden = true
            mtbTrailLbl.hidden = true
            serviceImg.hidden = true
            serviceLbl.hidden = true
            soonLbl.hidden = false
            
        default:
            break
        }
        
    }
    @IBAction func trailsVC(sender: AnyObject) {
        
        self.performSegueWithIdentifier("TrailsVC", sender: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
       
        imageSecond.layer.cornerRadius = 5
        imageSecond.layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        imageSecond.layer.shadowOpacity = 0.8
        imageSecond.layer.shadowRadius = 5.0
        imageSecond.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        imageSecond.clipsToBounds = true
        
        imageTrails.layer.cornerRadius = imageTrails.frame.size.width / 2
        imageTrails.clipsToBounds = true
        
    }
}

