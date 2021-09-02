//
//  GreenViewController.swift
//  AppSwift
//
//  Created by COTEMIG on 02/07/21.
//

import UIKit

class GreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    @IBAction func back(_ sender: UIButton) {
     //   navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>) vai pra outra tela
        
        navigationController?.popViewController(animated: true) // volta pra tela anterior
    }
    
    @IBAction func initial(_ sender: UIButton){
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    

}
