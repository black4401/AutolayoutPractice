//
//  ViewController.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class AutolayoutPracticeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        self.tableView.register(UINib(nibName: "CustomTableViewCell1", bundle: nil), forCellReuseIdentifier: "Cell1")
        self.tableView.register(UINib(nibName: "CustomTableViewCell2", bundle: nil), forCellReuseIdentifier: "Cell2")
        self.tableView.register(UINib(nibName: "CustomTableViewCell4", bundle: nil), forCellReuseIdentifier: "Cell4")
        self.tableView.register(UINib(nibName: "CustomTableViewCell5", bundle: nil), forCellReuseIdentifier: "Cell5")
        self.tableView.register(UINib(nibName: "CustomTableViewCell6", bundle: nil), forCellReuseIdentifier: "Cell6")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomTableViewCell1
                cell.iconView.image = UIImage(named: "doctor_bag_icon")
                cell.label.text = "Healthcare Providers"
                cell.accessoryType = .disclosureIndicator
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! CustomTableViewCell2
                cell.icon.image = UIImage(named: "doctor_icon")
                cell.mainLabel.text = "Associated Doctor"
                cell.label.text = "123456"
                
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! CustomTableViewCell4
                cell.mainLabel.text = "Morning entry"
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5", for: indexPath) as! CustomTableViewCell5
                cell.iconView.image = UIImage(named: "sun_icon")
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell6", for: indexPath) as! CustomTableViewCell6
                cell.iconView.image = UIImage(named: "movement_icon")
                return cell
            default:
                return UITableViewCell()
        }
    }

}


