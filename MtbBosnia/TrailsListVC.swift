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
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var index: ListaStaza!
        
        if searchMode {
            index = filterTable[indexPath.row]
        } else {
            index = listaStazaTable[indexPath.row]
        }
        
        performSegueWithIdentifier("DetailStaza", sender: index)
        
    }
    
    @IBAction func homeBtn(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "DetailStaza" {
            if let detailTrailVC = segue.destinationViewController as? DetailTrailVC {
                if let staza = sender as? ListaStaza {
                    detailTrailVC.staza = staza
                }
            }
        }
    }

}
