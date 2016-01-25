//
//  NacimientoController.swift
//  mediaNaranja
//
//  Created by sanxlop on 8/11/15.
//  Copyright © 2015 UPM. All rights reserved.
//

import UIKit

class NacimientoViewController: UIViewController {
    
    
    @IBOutlet weak var nacimientoDatePicker: UIDatePicker! //data picker de nacimiento
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Show Aniversario VC" {
            if let avc = segue.destinationViewController as? AniversarioViewController {
                avc.dateNacimiento = nacimientoDatePicker.date
            }
        }
        
    }
    
    
    @IBAction func goHome2(segue: UIStoryboardSegue){}

    
}

