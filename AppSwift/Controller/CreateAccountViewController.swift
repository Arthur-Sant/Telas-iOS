//
//  CreateAccountViewController.swift
//  AppSwift
//
//  Created by COTEMIG on 02/07/21.
//

import UIKit

class CreateAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelar(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    let userDeafult = UserDefaults.standard
    // prepara qual segue vem, caso haja mais de um segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenLogin" {
//           let destination =  segue.destination as! SingInViewController
            
            
            let user = User(name: nameText.text!, email: emailText.text!, password: passwordText.text!)
            
           // userDeafult.set(user.name, forKey: "name")
            
            let dictUser = ["name": user.name,
                            "email": user.email,
                            "password": user.password]
            
            if var lista = userDeafult.value(forKey: "user") as? [[String: String]] {
                lista.append(dictUser)
                userDeafult.setValue(lista, forKey: "user")
            }
            
            let listDict = [dictUser]
        
            userDeafult.set(listDict, forKey: "user")
            
//            destination.user = user
        }
    }
    
    @IBAction func createAccountButton(_ sender: Any) {
        if !nameText.text!.isEmpty && !emailText.text!.isEmpty && !passwordText.text!.isEmpty{
            
            showOk()
            
        }else{
            showMessageAlert(title: "Error", message: "Preencha todas as informacoes");
        }
    }
    
    // MARK: - Methods
    
    private func showOk() {
        let alertLogin = UIAlertController(title: "Logado", message: "Deseja salvar sua senha", preferredStyle: .actionSheet)
        
        let actionYes = UIAlertAction(title: "Sim", style: .default) { (action) in
            self.performSegue(withIdentifier: "OpenLogin", sender: nil)
        }
        
        let actionNo = UIAlertAction(title: "Nao", style: .cancel)
        
        alertLogin.addAction(actionYes)
        alertLogin.addAction(actionNo)
        
        present(alertLogin, animated: true)
    }
}

