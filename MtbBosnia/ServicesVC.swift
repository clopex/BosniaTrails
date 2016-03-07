//
//  ServicesVC.swift
//  MtbBosnia
//
//  Created by Adis Mulabdic on 2/25/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import UIKit

class ServicesVC: UIViewController,UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {

    @IBOutlet weak var tableViewS: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var listaGradova = [Servisi]()
    var filterGradova = [Servisi]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewS.delegate = self
        tableViewS.dataSource = self
        searchBar.delegate = self

        for var i=0; i <= imeGrada.count-1; ++i {
            let tmp = Servisi(nazivServisa: nazivRadnje[i], gradServisa: imeGrada[i], imgId: slikaRadnje[i])
            
            listaGradova.append(tmp)
        }
        
    }

    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return filterGradova.count
        }
        
        return listaGradova.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ServisCell") as? ServicesCell {
            
            let unos: Servisi!
            
            if inSearchMode {
                unos = filterGradova[indexPath.row]
            } else {
                unos = listaGradova[indexPath.row]
            }
            
            cell.configureCell(unos)
            
            return cell
            
        } else {
            return ServicesCell()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var index: Servisi!
        
        if inSearchMode {
            index = filterGradova[indexPath.row]
        } else {
            index = listaGradova[indexPath.row]
        }
        
        //print(index)
        performSegueWithIdentifier("ServiceDetail", sender: index)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ServiceDetail" {
            if let serviceDetail = segue.destinationViewController as? ServiceDetailVC {
                if let tmp = sender as? Servisi {
                    serviceDetail.infoServis = tmp
                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    @IBAction func mainBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            tableViewS.reloadData()
        } else {
            inSearchMode = true
            
            let lower = searchBar.text!.lowercaseString
            filterGradova = listaGradova.filter({$0.gradServisa.rangeOfString(lower) != nil })
            tableViewS.reloadData()
        }
    }
}
