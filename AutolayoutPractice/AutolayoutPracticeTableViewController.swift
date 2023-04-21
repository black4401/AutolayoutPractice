//
//  ViewController.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class AutolayoutPracticeTableViewController: UITableViewController {
    
    var visibleSectionIndices = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    var painLocationCellData: [TagModel] = [TagModel(labelText: "Left big toe", hasCloseButton: true, isSelectable: false, isTextCentered: true, horizontalPadding: 4, verticalPadding: 4, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .greyscale05), TagModel(labelText: "Right big toe", hasCloseButton: true, isSelectable: false, isTextCentered: true, horizontalPadding: 4, verticalPadding: 4, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .greyscale05), TagModel(labelText: "Left knee cap", hasCloseButton: true, isSelectable: false, isTextCentered: true, horizontalPadding: 4, verticalPadding: 4, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .greyscale05)]
    
    var painRateCellData: [TagModel] = [TagModel(labelText: "Back of left knee (2)", hasCloseButton: false, isSelectable: false, isTextCentered: true, horizontalPadding: 3, verticalPadding: 3, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .yellow10), TagModel(labelText: "Back of right knee (6)", hasCloseButton: false, isSelectable: false, isTextCentered: true, horizontalPadding: 3, verticalPadding: 3, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .yellow10), TagModel(labelText: "Back of left knee (3)", hasCloseButton: false, isSelectable: false, isTextCentered: true, horizontalPadding: 3, verticalPadding: 3, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .yellow10)]
    
    var bodyPainCellData: [TagModel] = [TagModel(labelText: "Overall", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Front of right head", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Right face", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite)]
    
    var filterCellsData: [TagModel] = [TagModel(labelText: "All", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "First", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Second", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Third", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Forth", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Fifth", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Sixth", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Seventh", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Seventh", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Eight", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Ninght", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Tenth", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Eleventh", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite)]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let listOfCells = [HealthcareProvidersCell.self, AssociatedDoctorCell.self, MorningEntryCell.self, MorningPainCell.self, MovementProgressCell.self, SavedArticleCell.self, PainRateCell.self, PainMonitorCell.self, CustomPainCell.self, CustomProgressCell.self, BodyPainCell.self, CustomProgressCell.self, BodyPainCell.self, PainLocationCell.self]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .brandMainColor
        addNotificationEnteringForeground()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(TagCollectionViewCell.self)
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
        headerView.addSubview(collectionView)
        tableView.tableHeaderView = collectionView
        
        for cell in listOfCells {
            tableView.register(cell)
        }
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
                cell.collectionViewModels = painRateCellData
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
                cell.collectionViewModels = bodyPainCellData
                return cell
            case 11:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.painLocationCell, for: indexPath) as! PainLocationCell
                cell.collectionViewModels = painLocationCellData
                return cell
            default:
                return UITableViewCell()
        }
    }
}

extension AutolayoutPracticeTableViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterCellsData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            visibleSectionIndices = filterCellsData.enumerated().map { $0.offset }
        } else {
            visibleSectionIndices = [indexPath.item - 1]
        }
        tableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.tagCellIdentifier, for: indexPath) as! TagCollectionViewCell
        
        if indexPath.row == 0 {
            cell.isSelected = true
        }
        cell.configureCell(with: filterCellsData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        let model = filterCellsData[indexPath.row]
        label.text = model.labelText
        let size = label.sizeThatFits(CGSize(width: 200, height: 100))
        return CGSize(width: size.width + model.horizontalPadding*2, height: size.height + model.verticalPadding*2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}

private extension AutolayoutPracticeTableViewController {
    func addNotificationEnteringForeground() {
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func appWillEnterForeground() {
        tableView.setContentOffset(.zero, animated: true)
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        collectionView.setContentOffset(.zero, animated: true)
        visibleSectionIndices = filterCellsData.enumerated().map { $0.offset }
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


