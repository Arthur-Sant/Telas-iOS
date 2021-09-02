//
//  LogadoViewController.swift
//  AppSwift
//
//  Created by COTEMIG on 30/06/21.
//

import UIKit

class LogadoViewController: UIViewController {
    
    deinit {
        print("A ultima barreira, codigo vai sair da memoria")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Tela carregou ")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Tela vai aparecer")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Tela ja apareceu")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Tela vai desaparecer")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("A tela desapareceu")
    }
    
    @IBAction func logOff(_ sender: UIButton){
        dismiss(animated: true){
            print("A tela terminoiu de desaparecer")
        }
    }
}
