//
//  ViewController.swift
//  AppSwift
//
//  Created by COTEMIG on 23/06/21.
//

import UIKit

// MARK: -ViewController

class ViewController: UIViewController {

    
    @IBOutlet weak var labelTitle: UILabel!
    
    
    @IBOutlet weak var buttoGet: UIButton!
    
    @IBAction func clickButton(_ sender: UIButton) {
        sender.backgroundColor = .orange
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View foi carregada")
        
        let geture = UITapGestureRecognizer(target: self, action: #selector(clickLinkLabel))
        
        labelTitle.addGestureRecognizer(geture)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        segue.destination as? ViewController
        
        if let indentifier = segue.identifier{
        print(indentifier)
        }
    }
    
    @objc func clickLinkLabel() {
        print("Open Screen")
        performSegue(withIdentifier: "LinkLabel", sender: nil)
    }
    
}

// MARK: -CreateAcountViewController

    

