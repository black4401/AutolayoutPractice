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
        
        self.tableView.register(UINib(nibName: "HealthcareProvidersCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.healthcareProviders)
        self.tableView.register(UINib(nibName: "AssociatedDoctorCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.associatedDoctor)
        self.tableView.register(UINib(nibName: "MorningEntryCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.morningEntry)
        self.tableView.register(UINib(nibName: "MorningPainCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.morningPain)
        self.tableView.register(UINib(nibName: "MovementProgressCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.movementProgress)
        self.tableView.register(UINib(nibName: "SavedArticleCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.savedArticle)
        self.tableView.register(UINib(nibName: "PainRateCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.painRate)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 5:
                return 270
            default:
                return tableView.rowHeight
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
//            case 0:
//                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.healthcareProviders, for: indexPath) as! HealthcareProvidersCell
//                return cell
//            case 1:
//                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.associatedDoctor, for: indexPath) as! AssociatedDoctorCell
//                return cell
//            case 2:
//                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.morningEntry, for: indexPath) as! MorningEntryCell
//                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.morningPain, for: indexPath) as! MorningPainCell
                return cell
//            case 4:
//                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.movementProgress, for: indexPath) as! MovementProgressCell
//                return cell
//            case 5:
//                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.savedArticle, for: indexPath) as! SavedArticleCell
//                return cell
//            case 6:
//                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.painRate, for: indexPath) as! PainRateCell
//                return cell
            default:
                return UITableViewCell()
        }
    }
    
}


