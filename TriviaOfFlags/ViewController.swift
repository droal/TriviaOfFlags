//
//  ViewController.swift
//  TriviaOfFlags
//
//  Created by AppDev on 18/04/18.
//  Copyright © 2018 Droal. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CALayer es un tipo de dato de Core Animation, y es reponsable de la forma como se visualizan las diferentes vistas
        //usamos CALayer para modifiar algunso aspectos de los botones
        button1.layer.borderWidth = 3
        button2.layer.borderWidth = 3
        button3.layer.borderWidth = 3
        
        
        //.cgColor es requerido para que el color pueda ser interpretado por CALayer
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        //button3.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        configFlags()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func configFlags(action: UIAlertAction! = nil){
        //se modifica la matriz aleatoriamente
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        //Asigna un UIImage al boton, el UIImage identificado el nombre indicado
        //for: .normal determina el estado del boton que debe alterarse, en este caso es el estado estandar del boton
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonsTapped(_ sender: UIButton) {
        
        var alertTittle = ""
        
        if sender.tag == correctAnswer{
            alertTittle = "Correct"
            score += 1
        }
        else{
            alertTittle = "Incorrect"
            score -= 1
        }
        
        let alert = UIAlertController(title: alertTittle, message: "Yoyr score is \(score)", preferredStyle: .alert)
        
        //El ultimo parametro "handler" es un tipo de dato closure
        //El closure es un tipo de dato que contiene lineas de codigo, ene ste caso se pasa el nombre del metodo a ejecutar (configFlags)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: configFlags))
        present(alert,animated: true)
    }
    
    
}

