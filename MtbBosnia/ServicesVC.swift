//
//  ServicesVC.swift
//  MtbBosnia
//
//  Created by Adis Mulabdic on 2/25/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import UIKit

class ServicesVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewS: UITableView!
    
    var nazivRadnje = ["Babanovac – Galica – Šantić – Markovac","Babanovac – Galica – Kraljica – Markovac","Babanovac – Galica – Paljenik – Markovac","Babin dol – Dujmovići – Dejčići – Babin dol","Babin dol – Lukomir – Tarčin","Babin dol – Lukomir – Umoljani – Šabići","Bakovići – Brusnica – Vrankamen","Bakovići – Zec – Vranica – Tovarište","Barice – Čavljak – Skakavac","Bjelašnica – Visočica – Boračko jezero – Konjic"]
    var imeGrada = ["17.3km","29km","24.7km","41.7km","77.7km","49km","30.8km","33.7km","32.2km","80.6km",]
    //var brojTelefona = ["445m","760m","785m","927m","1082m","1300m","1263m","1677m","1078m","1556m",]
    var slikaRadnje = ["1.jpeg","2.jpeg","3.jpeg","4.jpeg","5.jpeg","6.jpeg","7.jpeg","8.jpeg","9.jpeg","10.jpeg",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewS.delegate = self
        tableViewS.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("TrailCell") as? TrailCell {
            
            var img: UIImage!
            
            //img = UIImage(named: self.slikaStaze[indexPath.row])
            
            //cell.confCell(img, nazivLbl: nazivStaze[indexPath.row], usponLbl: visinaRute[indexPath.row], duzinaLbl: duzinaStaze[indexPath.row])
            
            return cell
            
        } else {
            return TrailCell()
        }
    }
}
