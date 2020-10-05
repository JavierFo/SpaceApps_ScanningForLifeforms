//
//  EndangeredSpeciesViewController.swift
//  SpeciesFinder
//
//  Created by Javier Ferrer Ortega on 04/10/20.
//  Copyright © 2020 BiohackersSpaceApps. All rights reserved.
//

import UIKit

class EndangeredSpeciesViewController: UIViewController {

    @IBOutlet weak var imageEndangered: UIImageView!
    @IBOutlet weak var cancel: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageEndangered.image = UIImage(named: "mammals")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        
        var index = (sender as AnyObject).tag
        if index == 0 {
            imageEndangered.image = UIImage(named: "threatedMammals")
        }else {
            imageEndangered.image = UIImage(named: "endangeredMammals")
        }
        
        index! += 1
//        else if index == 2{
//            imageEndangered.image = UIImage(named: "criticallyEndangered")
//        }else if index == 3{
//            dismiss(animated: true, completion: nil)
//        }
        
    }
    
}
