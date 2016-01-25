//
//  ViewController.swift
//  mediaNaranja
//
//  Created by sanxlop on 8/11/15.
//  Copyright © 2015 UPM. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    
    var dateAniversario: NSDate?
    var dateNacimiento: NSDate?
    var flag: Int = 0
    
    @IBOutlet weak var resultadoText: UILabel!
    @IBOutlet weak var tituloText: UILabel!
    
    
    // MARK: Coffee selection - unwind
    
    @IBAction func showResultado(segue: UIStoryboardSegue) {
        
        if let vc = segue.sourceViewController as? AniversarioViewController {
            dateAniversario = vc.dateAniversario
            dateNacimiento = vc.dateNacimiento1
            
            
            //Error: Nacimiento>Día Actual || Aniversario>Día Actual
            //primero: calculamos los días transcurridos hasta hoy de nacmiento y aniversario
            //segundo: comparamos si son mayores y lanzamos flags 1 o 2
            let t1 = dateNacimiento?.timeIntervalSinceNow   //ojo esto da valor negativo "-"
            let t2 = dateAniversario?.timeIntervalSinceNow  //ojo esto da valor negativo "-"
            let d1 = Int(t1!)/60/60/24
            let d2 = Int(t2!)/60/60/24
            
            if (d1 >= 0){
                resultadoText.text = ""
                tituloText.text = ""
                flag = 1
            }
            else if (d2 >= 0){
                resultadoText.text = ""
                tituloText.text = ""
                flag = 2
            }
                
                //Error: Nacimiento>Aniversario
                //primero: devolvemos la fecha de nacimiento "earlier" que tiene que ser la de Nacimiento
                //segundo: si no es la de Nacimiento -- flag3
            else if (dateNacimiento?.earlierDate(dateAniversario!) != dateNacimiento) {
                resultadoText.text = ""
                tituloText.text = ""
                flag = 3
            }
                //Error:Nacimiento = Aniversario
            else if (d1 == d2) {
                resultadoText.text = ""
                tituloText.text = ""
                flag = 4
            }
                //Mostramos la fecha de la muerte
            else {
                //let muerte = dateAniversario?.timeIntervalSinceDate(dateNacimiento!)
                let muerteFecha = NSDate(timeInterval: (dateAniversario?.timeIntervalSinceDate(dateNacimiento!))!, sinceDate: dateAniversario!)
                let muerteDias = abs( Int((dateAniversario?.timeIntervalSinceDate(dateNacimiento!))!)/60/60/24 )
                resultadoText.text = "\(muerteDias) días restantes de vida"
                tituloText.text = "Mueres en: \(muerteFecha)"
                flag = 0
            }
            
        }

        
    }

    
    
    override func viewDidAppear(animated: Bool) {
        
        if flag == 1 {
            let alertController = UIAlertController(title: "Error", message: "Fecha Nacimiento Incorrecta", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            flag = 0
        }
        
        if flag == 2 {
            let alertController = UIAlertController(title: "Error", message: "Fecha de Aniversario Incorrecta", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            flag = 0
        }
        
        if flag == 3 {
            let alertController = UIAlertController(title: "Error", message: "No se puede conocer antes de nacer", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            flag = 0
        }
        
        if flag == 4 {
            let alertController = UIAlertController(title: "Error", message: "No se puede nacer y conocer el mismo día", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            flag = 0
        }

        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultadoText.text = ""
        
    }
    
    @IBAction func goHome1(segue: UIStoryboardSegue){}
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

