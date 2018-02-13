//
//  ViewController.swift
//  Onde estou
//
//  Created by Ronaldo Cagliari on 13/02/2018.
//  Copyright © 2018 tresrw.com.br. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    //Mapa
    @IBOutlet weak var mapa: MKMapView!
    
    //Gerenciador de localização
    var gerenciadorLocalizacao = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // quem gerencia o CLLocationManager é a própria classe (contexto) ViewController
        gerenciadorLocalizacao.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

