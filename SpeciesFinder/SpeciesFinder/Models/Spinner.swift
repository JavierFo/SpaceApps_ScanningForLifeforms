//
//  Spinner.swift
//  SpeciesFinder
//
//  Created by Javier Ferrer Ortega on 04/10/20.
//  Copyright © 2020 BiohackersSpaceApps. All rights reserved.
//

import UIKit

var vSpinner : UIView?
private var lblInstrucciones = MyLabel()

extension UIViewController {
   func showSpinner(onView : UIView) {
       let spinnerView = UIView.init(frame: onView.bounds)
       spinnerView.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
       
       let ai = UIActivityIndicatorView.init(style: .whiteLarge)
       ai.style = .whiteLarge
       ai.color = UIColor(red: 207/255.0, green: 181/255.0, blue: 59/255.0, alpha: 1.0)
       ai.startAnimating()
       ai.center = spinnerView.center
       
       let spinnerPositionY = ai.center.y
       lblInstrucciones.font = UIFont.boldSystemFont(ofSize: 15)
       lblInstrucciones.textColor = UIColor.black
       lblInstrucciones =  MyLabel(frame: CGRect(x: 0 , y:  spinnerPositionY + 50, width: (spinnerView.frame.width) , height: 25) )
       lblInstrucciones.textColor = UIColor.black
       lblInstrucciones.font = UIFont.boldSystemFont(ofSize: 15)
       lblInstrucciones.text = "Scanning For Nearby Species..."
       lblInstrucciones.font = UIFont.boldSystemFont(ofSize: 15)
       lblInstrucciones.textColor = UIColor.black
       
       DispatchQueue.main.async {
           spinnerView.addSubview(ai)
           spinnerView.addSubview(lblInstrucciones)
           onView.addSubview(spinnerView)
       }
       
       vSpinner = spinnerView
   }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

class MyLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    
    func initializeLabel() {
        
        self.textAlignment = .center
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 24 )
        //self.textColor = UIColor.black
        
    }
}
