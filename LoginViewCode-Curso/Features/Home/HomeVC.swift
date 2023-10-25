//
//  HomeVC.swift
//  LoginViewCode-Curso
//
//  Created by Bruno Abreu on 24/10/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen?
    var data:[DataUser] = [
        DataUser(name: "Bruno", nameImage: "menino1"),
        DataUser(name: "Jocimar", nameImage: "menino2"),
        DataUser(name: "Kelty", nameImage: "menina1"),
    ]
    
    private var dataSport: [Sport] = [
        Sport(name: "Corrida", ImageName: "corrida"),
        Sport(name: "Ciclismo", ImageName: "ciclismo"),
        Sport(name: "Yoga", ImageName: "yoga"),
    ]
    
    override func loadView() {
        super.loadView()
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            cell?.dataCollection(data: dataSport)
            return cell ?? UITableViewCell()
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
            cell?.setupCell(data: data[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}



