//
//  AutolayoutPracticeViewController.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 26.04.23.
//

import UIKit

class AutolayoutPracticeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var visibleSectionIndices = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    var painLocationCellData: [TagModel] = [TagModel(labelText: "Left big toe", hasCloseButton: true, isSelectable: false, isTextCentered: true, horizontalPadding: 4, verticalPadding: 4, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .greyscale05), TagModel(labelText: "Right big toe", hasCloseButton: true, isSelectable: false, isTextCentered: true, horizontalPadding: 4, verticalPadding: 4, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .greyscale05), TagModel(labelText: "Left knee cap", hasCloseButton: true, isSelectable: false, isTextCentered: true, horizontalPadding: 4, verticalPadding: 4, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .greyscale05)]
    
    var painRateCellData: [TagModel] = [TagModel(labelText: "Back of left knee (2)", hasCloseButton: false, isSelectable: false, isTextCentered: true, horizontalPadding: 3, verticalPadding: 3, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .yellow10), TagModel(labelText: "Back of right knee (6)", hasCloseButton: false, isSelectable: false, isTextCentered: true, horizontalPadding: 3, verticalPadding: 3, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .yellow10), TagModel(labelText: "Back of left knee (3)", hasCloseButton: false, isSelectable: false, isTextCentered: true, horizontalPadding: 3, verticalPadding: 3, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .yellow10)]
    
    var bodyPainCellData: [TagModel] = [TagModel(labelText: "Overall", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Front of right head", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite), TagModel(labelText: "Right face", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite)]
    
    var filterData: [TagModel] = []
    
    private let listOfCells = [HealthcareProvidersCell.self, AssociatedDoctorCell.self, MorningEntryCell.self, MorningPainCell.self, MovementProgressCell.self, SavedArticleCell.self, PainRateCell.self, PainMonitorCell.self, CustomPainCell.self, CustomProgressCell.self, BodyPainCell.self, PainLocationCell.self]
    
    
    @IBOutlet weak var filterHorizontalScrollView: HorizontalScrollView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        for index in 0...11 {
            filterData.append(TagModel(labelText: "Cell \(index)", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite))
            filterData[0].labelText = "All"
        }
        
        tableView.backgroundColor = .brandMainColor
        addNotificationEnteringForeground()
        
        filterHorizontalScrollView.delegate = self
        
        filterHorizontalScrollView.data = filterData
        tableView.tableHeaderView = filterHorizontalScrollView
        tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: (tableView.tableHeaderView?.frame.width)!, height: 60)
        
        for cell in listOfCells {
            tableView.register(cell)
        }
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if visibleSectionIndices.contains(section) {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 3:
                return 144
            case 7:
                return 144
            case 8:
                return 144
            default:
                return tableView.rowHeight
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = listOfCells[indexPath.section].reuseIdentifier
        
        let cell = tableView.dequeueCell(withReuseIdentifier: identifier, for: indexPath)
            if let cell = cell as? PainRateCell {
                cell.collectionViewModels = painRateCellData
            } else if let cell = cell as? BodyPainCell {
                cell.collectionViewModels = bodyPainCellData
            } else if let cell = cell as? PainLocationCell {
                cell.collectionViewModels = painLocationCellData
            }
            return cell
    }
}

extension AutolayoutPracticeViewController: HorizontalScrollViewDelegate {
    func didSelectCell(at indexPath: Int) {
                if indexPath == 0 {
                    visibleSectionIndices = filterData.enumerated().map { $0.offset }
                } else {
                    visibleSectionIndices = [indexPath]
                }
                tableView.reloadData()
    }
}

private extension AutolayoutPracticeViewController {
    func addNotificationEnteringForeground() {
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func appWillEnterForeground() {
        tableView.setContentOffset(.zero, animated: true)
        filterHorizontalScrollView.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        filterHorizontalScrollView.collectionView.setContentOffset(.zero, animated: true)
        visibleSectionIndices = filterData.enumerated().map { $0.offset }
        tableView.reloadData()
    }
}