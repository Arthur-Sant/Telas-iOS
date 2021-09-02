//
//  TableViewController.swift
//  AppSwift
//
//  Created by COTEMIG on 07/07/21.
//

import UIKit

struct Message {
    let imagemView: UIImage?
    let dataMensagem: String
    let textMessage: String
}

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageTop: UIImageView!
    
    var arrayName: Array<String> = ["Arthur", "Rafael", "Fernando", "Pedro","Joao", "Elias"]
    var arrayData: Array<String> = ["Abril, 2021, 20:20", "Maio, 2021, 90:20", "Julho, 2021, 20:20", "JAneiro, 2021, 202:20", "Agosto, 2021, 02:20", "Dezembro, 2021: 20:20"]
    var arrayImage: Array<String> = ["avatar1", "avatar2", "avatar1", "avatar2", "avatar1", "avatar2"]

    var chat: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var i = 0
        
        while i < 6{
            
            chat.append(Message(imagemView: UIImage(named: arrayImage[i]),
                                dataMensagem: arrayData[i],
                                textMessage: arrayName[i]))
            
            i += 1
        }

//        Indica a fonte de daodos
        tableView.dataSource = self
        
        //Indica as acoes do user
        tableView.delegate = self
        
        var imageUrl = Data()
        
        DispatchQueue.global().async {
            imageUrl = try! Data(contentsOf: URL(string: "https://static-cse.canva.com/blob/183499/IMAGE-1.jpg")!)
        }
        
        imageTop.image = UIImage(data: imageUrl)
    }
    
    
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
            return cell
        }else {
//        let cell = UITableViewCell()
        // funcao da table view para reconhecer o layout do storyBoard
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChatCell
    
//        cell.textLabel?.text = arrayName[indexPath.row]
        
        let message = chat[indexPath.row]
        
        cell.imageView?.image = message.imagemView
        cell.dateLabel.text = message.dataMensagem
        cell.textoLabel.text = message.textMessage
        
        return cell
        }
        
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicou na linha \(arrayName[indexPath.row]) de secao \(indexPath.section)")
    }
}

class ChatCell: UITableViewCell {
    
    @IBOutlet weak var imagePerfil: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var textoLabel: UILabel!
}
