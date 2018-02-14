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
        
        gerenciadorLocalizacao.delegate = self // quem gerencia o CLLocationManager é a própria classe (contexto) ViewController
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest // Defini a melhor precisão para localização do usuário
        gerenciadorLocalizacao.requestWhenInUseAuthorization() // Solicita autorização do usuário
        gerenciadorLocalizacao.startUpdatingLocation() // atualiza em tempo real a localização do usuário
        
    }
    
    // Método que verifica se o usuário mudou a autorização de acesso a localização
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        // se a localização está (!= ) diferente de autorizado
        if status != .authorizedWhenInUse {
            //Mensagem de permisão de acesso a localização
            let alertaController = UIAlertController(title: "Permissão de localização",
                                                     message: "Necessário permissão para acesso a sua localização! Por favor habilite.",
                                                     preferredStyle: .alert)
            // acessso as configurações do usuário
            let acaoConfiguracoes = UIAlertAction(title: "Abrir configurações", style: .default, handler: { (alertaConfiguracoes) in
                // Cria uma URL para acessar as configurações do aparelho do usuário
                if let configuracoes = NSURL(string: UIApplicationOpenSettingsURLString){
                    
                        UIApplication.shared.open(configuracoes as URL) // acessa as preferências
                    
                }
                
            })
            
            // botão cancelar
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertaController.addAction(acaoConfiguracoes) // botão de acesso as configurações
            alertaController.addAction(acaoCancelar)      // botão cancelar
            
            present(alertaController, animated: true, completion: nil)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

