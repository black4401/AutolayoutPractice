//
//  ViewController.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class AutolayoutPracticeTableViewController: UITableViewController {
    
    var data = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    var visibleSectionIndices = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: "tagCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tagCell")
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
        headerView.addSubview(collectionView)
        tableView.tableHeaderView = collectionView
        
        self.tableView.register(UINib(nibName: "HealthcareProvidersCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.healthcareProviders)
        self.tableView.register(UINib(nibName: "AssociatedDoctorCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.associatedDoctor)
        self.tableView.register(UINib(nibName: "MorningEntryCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.morningEntry)
        self.tableView.register(UINib(nibName: "MorningPainCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.morningPain)
        self.tableView.register(UINib(nibName: "MovementProgressCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.movementProgress)
        self.tableView.register(UINib(nibName: "SavedArticleCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.savedArticle)
        self.tableView.register(UINib(nibName: "PainRateCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.painRate)
        self.tableView.register(UINib(nibName: "PainMonitorCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.painMonitorCell)
        self.tableView.register(UINib(nibName: "ActivityCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.activityCell)
        self.tableView.register(UINib(nibName: "CustomPainCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.customPainCell)
        self.tableView.register(UINib(nibName: "CustomProgressCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.customProgressCell)
        self.tableView.register(UINib(nibName: "BodyPainCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.bodyPainCell)
        self.tableView.register(UINib(nibName: "PainLocationCell", bundle: nil), forCellReuseIdentifier: CellIdentifiers.painLocationCell)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if visibleSectionIndices.contains(section) {
            return 1
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 8:
                return 144
            default:
                return tableView.rowHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard tableView.numberOfRows(inSection: section) > 0 else {
            return nil
        }
        
        switch section {
            case 5:
                let headerView = UIView()
                
                let titleLabel = UILabel()
                titleLabel.setFontToDMSans(with: 20)
                titleLabel.textColor = .brandMainColor
                titleLabel.text = "Recommended for you"
                
                headerView.addSubview(titleLabel)
                
                titleLabel.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
                    titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
                ])
                
                return headerView
            default:
                return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
            case 5:
                return UITableView.automaticDimension
            default:
                return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.healthcareProviders, for: indexPath) as! HealthcareProvidersCell
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
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.painMonitorCell, for: indexPath) as! PainMonitorCell
                let style = CellStyle.evening
                cell.setUpPainLabel(text: style.painText)
                cell.setSecondaryLabelText(text: style.secondaryText)
                cell.setUpIconView(iconName: style.emojiName)
                cell.setUpAvgLabel(value: style.percentValue)
                return cell
            case 8:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.customPainCell, for: indexPath) as! CustomPainCell
                return cell
            case 9:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.customProgressCell, for: indexPath) as! CustomProgressCell
                return cell
            case 10:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.bodyPainCell, for: indexPath) as! BodyPainCell
                return cell
            case 11:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.painLocationCell, for: indexPath) as! PainLocationCell
                return cell
            default:
                return UITableViewCell()
        }
    }
    
}

extension AutolayoutPracticeTableViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return data.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            visibleSectionIndices = data
        } else {
            visibleSectionIndices = [indexPath.item]
        }
        tableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagCollectionViewCell
        
        cell.backgroundColor = .brandWhite
        cell.textLabel.textColor = .brandMainColor
        cell.layer.cornerRadius = 6
        cell.clipsToBounds = true
        cell.closeButton.isHidden = true
        cell.textLabel.setFontToDMSans(with: 15)
        cell.textLabel.textAlignment = .center
        cell.setColorsForStates(normalStateTextColor: .greyscale100!, normalStateBackgroundColor: .brandWhite!, selectedStateTextColor: .brandMainColor!, selectedStateBackgroundColor: .greyscale10!)
        cell.layer.borderColor = UIColor.greyscale10?.cgColor
        cell.layer.borderWidth = 1
        
        if indexPath.section == 0 {
            cell.textLabel.text = "All"
        } else {
            cell.textLabel.text = "Cell \(indexPath.row)"
        }
        return cell
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


