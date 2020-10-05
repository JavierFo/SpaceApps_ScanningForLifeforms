//
//  ShowScannedSpeciesViewController.swift
//  SpeciesFinder
//
//  Created by Javier Ferrer Ortega on 04/10/20.
//  Copyright © 2020 BiohackersSpaceApps. All rights reserved.
//

import UIKit

class ShowScannedSpeciesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //showSpinner(onView: self.view)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissTable(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return speciesTableValues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpeciesCell", for: indexPath)
        
        cell.textLabel?.text = speciesTableValues[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}
