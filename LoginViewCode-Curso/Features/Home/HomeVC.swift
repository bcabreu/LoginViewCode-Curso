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
//    var data: [DataUser] = []
    
    
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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setupCell(data: data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
