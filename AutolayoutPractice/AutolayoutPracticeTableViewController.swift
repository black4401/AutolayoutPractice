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
        
        self.tableView.register(UINib(nibName: "HealthcareProvidersCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.healthcareProviders)
        self.tableView.register(UINib(nibName: "AssociatedDoctorCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.associatedDoctor)
        self.tableView.register(UINib(nibName: "MorningEntryCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.morningEntry)
        self.tableView.register(UINib(nibName: "MorningPainCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.morningPain)
        self.tableView.register(UINib(nibName: "MovementProgressCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.movementProgress)
        self.tableView.register(UINib(nibName: "SavedArticleCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.savedArticle)
        self.tableView.register(UINib(nibName: "PainRateCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.painRate)
        self.tableView.register(UINib(nibName: "PainMonitorCell", bundle: nil), forCellReuseIdentifier: "PainMonitorCell")
        self.tableView.register(UINib(nibName: "ActivityCell", bundle: nil), forCellReuseIdentifier: "ActivityCell")
        self.tableView.register(UINib(nibName: "NewCell", bundle: nil), forCellReuseIdentifier: "NewCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 5:
                return "Recommended for you"
            default:
                return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "NewCell", for: indexPath) as! NewCell
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.associatedDoctor, for: indexPath) as! AssociatedDoctorCell
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.morningEntry, for: indexPath) as! MorningEntryCell
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.morningPain, for: indexPath) as! MorningPainCell
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.movementProgress, for: indexPath) as! MovementProgressCell
                return cell
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.savedArticle, for: indexPath) as! SavedArticleCell
                return cell
            case 6:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.painRate, for: indexPath) as! PainRateCell
                return cell
            case 7:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PainMonitorCell", for: indexPath) as! PainMonitorCell
                let style = CellStyle.evening
                cell.setUpPainLabel(text: style.painText)
                cell.setSecondaryLabelText(text: style.secondaryText)
                cell.setUpIconView(iconName: style.emojiName)
                cell.setUpAvgLabel(value: style.percentValue)
                return cell
            case 8:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityCell
                return cell
            default:
                return UITableViewCell()
        }
    }
    
}

enum CellStyle {
    
    case morning
    case evening
    
    var emojiName: String {
        switch self {
            case .morning:
                return "sun_icon"
            case .evening:
                return "moon_icon"
        }
    }
    
    var painText: String {
        switch self {
            case .morning:
                return "MORNING PAIN"
            case .evening:
                return "EVENING PAIN"
        }
    }
    
    var secondaryText: String {
        switch self {
            case .morning:
                return "8% lower than last period"
            case .evening:
                return "8% higher than last period"
        }
    }
    
    var percentValue: String {
        switch self {
            case .morning:
                return "7.4"
            case .evening:
                return "6.4"
        }
    }
}


