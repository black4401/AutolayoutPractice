//
//  ViewController.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class AutolayoutPracticeTableViewController: UITableViewController {
    
    var filterCellsData = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    var visibleSectionIndices = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    var painLocationCellData: [TagModel] = [TagModel(textLabel: "Left big toe", labelWidth: 121), TagModel(textLabel: "Right big toe", labelWidth: 121), TagModel(textLabel: "Left knee cap", labelWidth: 121)]
    var painRateCellData: [PainRateTagModel] = [PainRateTagModel(backgroundColor: .yellow10!, textLabel: "Back of left knee (2)", labelWidth: 146, hasCloseButton: false, isTextCentered: true), PainRateTagModel(backgroundColor: .yellow10!, textLabel: "Right knee cap (3)", labelWidth: 146, hasCloseButton: false, isTextCentered: false),PainRateTagModel(backgroundColor: .yellow10!, textLabel: "Back of left knee (2)", labelWidth: 146, hasCloseButton: false, isTextCentered: true), PainRateTagModel(backgroundColor: .yellow10!, textLabel: "Right knee cap (3)", labelWidth: 146, hasCloseButton: false, isTextCentered: false)]
    
    var painLocationCell: PainLocationCell?
    var painRateCell: PainRateCell?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNotificationEnteringForeground()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.tagCellIdentifier)
        
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
                painRateCell = cell
                cell.cellCollectionView.dataSource = self
                cell.cellCollectionView.delegate = self
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
                painLocationCell = cell
                cell.cellCollectionView.delegate = self
                cell.cellCollectionView.dataSource = self
                return cell
            default:
                return UITableViewCell()
        }
    }
}

extension AutolayoutPracticeTableViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case self.collectionView:
                if section == 0 {
                    return 1
                } else {
                    return filterCellsData.count
                }
            case painLocationCell?.cellCollectionView:
                return painLocationCellData.count
            case painRateCell?.cellCollectionView:
                return painRateCellData.count
            default:
                return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch collectionView {
            case self.collectionView:
                return 2
            case painLocationCell?.cellCollectionView:
                return 1
            case painRateCell?.cellCollectionView:
                return 1
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
            case self.collectionView:
                if indexPath.section == 0 {
                    visibleSectionIndices = filterCellsData
                } else {
                    visibleSectionIndices = [indexPath.item]
                }
                tableView.reloadData()
            default:
                return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case self.collectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.tagCellIdentifier, for: indexPath) as! TagCollectionViewCell
                
                cell.setBackGroundColor(to: .brandWhite)
                cell.setLabelTextColor(color: .brandMainColor)
                cell.setCornerRadius(to: 6)
                cell.setLabelFont(to: UIFont.dmSansRegular(ofSize: 15))
                cell.centerLabelText()
                cell.setUpBorder(color: .greyscale10, width: 1)
                cell.setColorsForStates(normalStateTextColor: .greyscale100!, normalStateBackgroundColor: .brandWhite!, selectedStateTextColor: .brandMainColor!, selectedStateBackgroundColor: .greyscale10!)
                
                if indexPath.section == 0 {
                    cell.setLabelText(text: "All")
                    cell.isSelected = true
                } else {
                    cell.setLabelText(text: "Cell \(indexPath.row + 1)")
                }
                return cell
            case painLocationCell?.cellCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.tagCellIdentifier, for: indexPath) as! TagCollectionViewCell
                
                cell.setLabelText(text: painLocationCellData[indexPath.row].textForLabel)
                cell.setLabelFont(to: UIFont.dmSansRegular(ofSize: 15))
                cell.setLabelTextColor(color: .greyscale140)
                cell.setBackGroundColor(to: .greyscale05)
                cell.setConstraintLeadingToTextLabel(value: 6)
                cell.configureCloseButton()
                if painLocationCell != nil {
                    cell.delegate = self
                    painLocationCell!.numberOfTags+=1
                }
                return cell
            case painRateCell?.cellCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.tagCellIdentifier, for: indexPath) as! TagCollectionViewCell
                
                cell.setLabelFont(to: UIFont.dmSansRegular(ofSize: 15))
                cell.setLabelText(text: painRateCellData[indexPath.item].textLabel)
                cell.setCornerRadius(to: 6)
                cell.setBackGroundColor(to: painRateCellData[indexPath.item].backgroundColor!)
                cell.centerLabelText()
                return cell
            default:
                return UICollectionViewCell()
        }
    }
}

extension AutolayoutPracticeTableViewController: TagCollectionViewCellDelegate {
    func didTapClose(on cell: TagCollectionViewCell) {
        guard let painLocationCell = painLocationCell else {
            return
        }
        if let indexPath = painLocationCell.cellCollectionView.indexPath(for: cell) {
            painLocationCell.cellCollectionView.performBatchUpdates {
                painLocationCellData.remove(at: indexPath.item)
                painLocationCell.cellCollectionView.deleteItems(at: [indexPath])
            }
            painLocationCell.numberOfTags-=1
        }
    }
}

extension AutolayoutPracticeTableViewController {
    struct TagModel {
        let textForLabel: String
        let labelWidth: CGFloat
        
        init(textLabel: String, labelWidth: CGFloat) {
            self.textForLabel = textLabel
            self.labelWidth = labelWidth
        }
    }
    struct PainRateTagModel {
        let backgroundColor: UIColor?
        let textLabel: String
        let labelWidth: CGFloat
        let hasCloseButton: Bool
        let isTextCentered: Bool
        
        init(backgroundColor: UIColor, textLabel: String, labelWidth: CGFloat, hasCloseButton: Bool, isTextCentered: Bool) {
            self.backgroundColor = backgroundColor
            self.textLabel = textLabel
            self.labelWidth = labelWidth
            self.hasCloseButton = hasCloseButton
            self.isTextCentered = isTextCentered
        }
    }
}

private extension AutolayoutPracticeTableViewController {
    func addNotificationEnteringForeground() {
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc func appWillEnterForeground() {
        tableView.setContentOffset(.zero, animated: true)
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        collectionView.setContentOffset(.zero, animated: true)
        
        visibleSectionIndices = filterCellsData
        for cell in collectionView.visibleCells {
            cell.isSelected = false
        }
        tableView.reloadData()
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


