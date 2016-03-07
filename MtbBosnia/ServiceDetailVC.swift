//
//  ServiceDetailVC.swift
//  MtbBosnia
//
//  Created by Adis Mulabdic on 3/7/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import UIKit

class ServiceDetailVC: UIViewController {

    var infoServis: Servisi!
    var brIndex: Int!
    
    @IBOutlet weak var imgRadnje: UIImageView!
    @IBOutlet weak var gradLbl: UILabel!
    @IBOutlet weak var nazivLbl: UILabel!
    @IBOutlet weak var adresaLbl: UILabel!
    @IBOutlet weak var telefonLbl: UILabel!
    @IBOutlet weak var siteLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataDetail()
    }

    
    func loadDataDetail(){
        
        gradLbl.text = infoServis.gradServisa
        nazivLbl.text = infoServis.nazivServisa
        imgRadnje.image = UIImage(named: "\(infoServis.imgId)")
        
        switch infoServis.imgId {
            case "ser_1":
            adresaLbl.text = adresa[0]
            telefonLbl.text = telefon[0]
            siteLbl.text = webAdresa[0]
            
            case "ser_2":
                adresaLbl.text = adresa[1]
                telefonLbl.text = telefon[1]
                siteLbl.text = webAdresa[1]
            
        case "ser_3":
            adresaLbl.text = adresa[2]
            telefonLbl.text = telefon[2]
            siteLbl.text = webAdresa[2]
            
        case "ser_1_1":
            adresaLbl.text = adresa[4]
            telefonLbl.text = telefon[4]
            siteLbl.text = webAdresa[4]
        
        case "ser_4":
            adresaLbl.text = adresa[5]
            telefonLbl.text = telefon[5]
            siteLbl.text = webAdresa[5]
            
        case "ser_5":
            adresaLbl.text = adresa[6]
            telefonLbl.text = telefon[6]
            siteLbl.text = webAdresa[6]
            
        case "ser_6":
            adresaLbl.text = adresa[7]
            telefonLbl.text = telefon[7]
            siteLbl.text = webAdresa[7]
            
        case "ser_7":
            adresaLbl.text = adresa[8]
            telefonLbl.text = telefon[8]
            siteLbl.text = webAdresa[8]
            
        case "ser_1_2":
            adresaLbl.text = adresa[9]
            telefonLbl.text = telefon[9]
            siteLbl.text = webAdresa[9]
            
        case "ser_8":
            adresaLbl.text = adresa[10]
            telefonLbl.text = telefon[10]
            siteLbl.text = webAdresa[10]
            
        case "ser_9":
            adresaLbl.text = adresa[11]
            telefonLbl.text = telefon[11]
            siteLbl.text = webAdresa[11]
            
        case "ser_10":
            adresaLbl.text = adresa[12]
            telefonLbl.text = telefon[12]
            siteLbl.text = webAdresa[12]
            
        default:
            break
            
            
        }
        
        //performSegueWithIdentifier("WebViewLink", sender: siteLbl.text)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "WebViewLink" {
            let webView: WebViewVC = segue.destinationViewController as! WebViewVC
            webView.url = siteLbl.text
        }
        
    }
    

}
