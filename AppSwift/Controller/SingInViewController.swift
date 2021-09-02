//
//  SingInViewController.swift
//  AppSwift
//
//  Created by COTEMIG on 30/06/21.
//

import UIKit

class SingInViewController: UIViewController {
    
    //MARK: - UI
    
    @IBOutlet var emailText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    public var user: User!
    
    var usserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let listFromdb = usserDefaults.value(forKey: "user") as? [[String: String]]{
            let userDict = listFromdb[0]
            
            let userModel = User(name: userDict["name"] ?? "",
                                 email: userDict["email"] ?? "",
                                 password: userDict["password"] ?? "")
            
           self.user = userModel
            
        }
    }
    
    
    //MARK: - Action
    
    @IBAction func singInButton(_ sender: Any) {
    
        
        if emailText.text == user.email && passwordText.text! == user.password {
            performSegue(withIdentifier: "Logado", sender: nil)
            
        }else{
            let alert = UIAlertController(title: "Error", message: "Usuario ou senha invalido", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default)
            
            alert.addAction(action)
            
            present(alert, animated: true)
        }
    }
    
}
