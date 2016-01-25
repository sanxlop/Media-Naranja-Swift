//
//  AniversarioController.swift
//  mediaNaranja
//
//  Created by sanxlop on 8/11/15.
//  Copyright © 2015 UPM. All rights reserved.
//

import UIKit

class AniversarioViewController: UIViewController {
    
    
    var dateNacimiento: NSDate? //variable para guardar la fecha de nacimiento anterior
    var dateNacimiento1: NSDate?
    var dateAniversario: NSDate?
    
    @IBOutlet weak var aniversarioDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Show Resultado" {
            
                dateAniversario = aniversarioDatePicker.date
                dateNacimiento1 = dateNacimiento
            
        }
        
    }
    
    
    
}
