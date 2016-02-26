//
//  TrailsListVC.swift
//  MtbBosnia
//
//  Created by Adis Mulabdic on 2/25/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import UIKit

class TrailsListVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate	 {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var nazivStaze = ["Babanovac – Galica – Šantić – Markovac","Babanovac – Galica – Kraljica – Markovac","Babanovac – Galica – Paljenik – Markovac","Babin dol – Dujmovići – Dejčići – Babin dol","Babin dol – Lukomir – Tarčin","Babin dol – Lukomir – Umoljani – Šabići","Bakovići – Brusnica – Vrankamen","Bakovići – Zec – Vranica – Tovarište","Barice – Čavljak – Skakavac","Bjelašnica – Visočica – Boračko jezero – Konjic"]
    var duzinaStaze = ["17.3 km","29 km","24.7 km","41.7 km","77.7 km","49 km","30.8 km","33.7 km","32.2 km","80.6 km"]
    var visinaRute = ["445m","760m","785m","927m","1082m","1300m","1263m","1677m","1078m","1556m"]
    //var slikaStaze = ["1.jpeg","2.jpeg","3.jpeg","4.jpeg","5.jpeg","6.jpeg","7.jpeg","8.jpeg","9.jpeg","10.jpeg"]
    var slikaStaze = [1,2,3,4,5,6,7,8,9,10]
    
    var listaStazaTable = [ListaStaza]()
    var filterTable = [ListaStaza]()
    var searchMode = false
    var filterNazivi: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        //print(nazivStaze.count)
        searchBar.returnKeyType = UIReturnKeyType.Done
        
        for var i=0; i <= nazivStaze.count-1; ++i {
            let tmp = ListaStaza(imeStaze: nazivStaze[i], duzinaStaze: duzinaStaze[i], visinaStaze: visinaRute[i], imgId: slikaStaze[i])
            listaStazaTable.append(tmp)
        }
        
    }
   

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchMode {
            return filterTable.count
        }
        
        return listaStazaTable.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("TrailCell") as? TrailCell {
            
            let unos: ListaStaza!
            
            if searchMode {
                unos = filterTable[indexPath.row]
                
            } else {
                unos = listaStazaTable[indexPath.row]
            }
            
            
            
            cell.configureCell(unos)
            return cell
            
            /*var img: UIImage!
            
            if(searchMode){
                
                //img = UIImage(named: self.slikaStaze)
                
            } else {
                
            img = UIImage(named: self.slikaStaze[indexPath.row])
            
            cell.confCell(img, nazivLbl: nazivStaze[indexPath.row], usponLbl: visinaRute[indexPath.row], duzinaLbl: duzinaStaze[indexPath.row])
            }
            return cell*/
            
        } else {
            return TrailCell()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            searchMode = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            searchMode = true
            
            let lower = searchBar.text!.lowercaseString
            
            filterTable = listaStazaTable.filter({$0.imeStaze.rangeOfString(lower) != nil })
            tableView.reloadData()
        }
        
        
        
        //if searchBar.text == nil || searchBar.text == "" {
            //searchMode = false
        //} else {
            //searchMode = true
            
           // let lower = searchBar.text!.lowercaseString
            
            /*filterNazivi = nazivStaze.filter({(text) -> Bool in
            
                let tmp: NSString = text
                let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
                return range.location != NSNotFound
            })*/
        //}
        
        /*if(filterNazivi.count == 0){
            searchMode = false
        } else {
            searchMode = true
        }
        
        self.tableView.reloadData()*/
    }
    

}
