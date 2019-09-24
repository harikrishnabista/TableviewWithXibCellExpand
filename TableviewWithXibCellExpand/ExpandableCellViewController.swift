//
//  ExpandableCellViewController.swift
//  TableviewWithXibCellExpand
//
//  Created by Hari Bista on 9/17/19.
//  Copyright © 2019 Hari Bista. All rights reserved.
//

import UIKit

struct TableData {
    let sections:[TransactionSection]
}

struct TransactionSection {
    let date:String
    var transactions:[Transaction]
}

struct Transaction {
    let cardName:String
    let amount:Double
    let location:String
}

class DummyDataFactory {
    static func getTableData() -> TableData {
        
        let transaction1 = Transaction(cardName: "American Express  Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum", amount: 20.0, location: "Pittsburgh")
        let transaction2 = Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall")
        let transaction3 = Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall")
        
        var transactionSection1 = TransactionSection(date: "2019 Jun 27", transactions: [transaction1,transaction2,transaction3])
        
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        
        
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        transactionSection1.transactions.append(Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall"))
        
        let transaction4 = Transaction(cardName: "American Express", amount: 20.0, location: "Pittsburgh")
        let transaction5 = Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall")
        let transaction6 = Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall")
        
        let transactionSection2 = TransactionSection(date: "2019 Jun 27", transactions: [transaction4,transaction5,transaction6])
        
        
        let transaction7 = Transaction(cardName: "American Express", amount: 20.0, location: "Pittsburgh")
        let transaction8 = Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall")
        let transaction9 = Transaction(cardName: "Discover", amount: 3.0, location: "Whitney Hall")
        
        let transactionSection3 = TransactionSection(date: "2019 Jun 27", transactions: [transaction7,transaction8,transaction9])
        
        return TableData(sections: [transactionSection1,transactionSection2,transactionSection3])
    }
}

class ExpandableCellViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            
            let nib = UINib(nibName: "ExpandableTableViewCell", bundle: .main)
            tableView.register(nib, forCellReuseIdentifier: "ExpandableTableViewCell")
            
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 200
        }
    }
    
    var tableData:TableData = DummyDataFactory.getTableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TableView with Sections"
        self.tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var selectedIndexPath: IndexPath?
    func isShowDetail(indexPath:IndexPath) -> Bool {
        return indexPath == self.selectedIndexPath ? true : false
    }
}

extension ExpandableCellViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let selIndexPath = self.selectedIndexPath {
            
            if selIndexPath == indexPath {
                // display default cell
                self.selectedIndexPath = nil
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            } else {
                // display detail cell
                self.selectedIndexPath = indexPath
                
                CATransaction.begin()
                tableView.beginUpdates()
                
                self.tableView.reloadRows(at: [selIndexPath], with: .automatic)
                
                CATransaction.setCompletionBlock {
//                    if self.totalItemsCount > 10 && (indexPath.section * indexPath.row) >= self.totalItemsCount - 5 {
                    if indexPath.section == self.tableData.sections.count - 1 {
                        self.scrollToBottomForLastFourItems(indexPath: indexPath)
                    } else {
                        self.tableView.reloadRows(at: [indexPath], with: .automatic)
                    }
                }
                
                tableView.endUpdates()
                CATransaction.commit()
            }
            
        } else {
            self.selectedIndexPath = indexPath

//            if totalItemsCount > 10 && (indexPath.section * indexPath.row) >= totalItemsCount - 5 {
            if indexPath.section == self.tableData.sections.count - 1 {
                self.scrollToBottomForLastFourItems(indexPath: indexPath)
            } else {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    var totalItemsCount: Int {
        var totalItems = 0
        
        for section in self.tableData.sections {
            for _ in section.transactions {
                totalItems = totalItems + 1
            }
        }
        
        return totalItems
    }
    
    func scrollToBottomForLastFourItems(indexPath:IndexPath){
        CATransaction.begin()
        tableView.beginUpdates()
        
        self.tableView.reloadRows(at: [indexPath], with: .none)
        
        CATransaction.setCompletionBlock {
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
        
        tableView.endUpdates()
        CATransaction.commit()
    }

}

extension ExpandableCellViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableData.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.sections[section].transactions.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.tableData.sections[section].date
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableTableViewCell", for: indexPath) as! ExpandableTableViewCell
        
        if self.isShowDetail(indexPath: indexPath) {
            cell.heightDetailView.constant = 126
        } else {
            cell.heightDetailView.constant = 0
        }
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        let transaction = self.tableData.sections[indexPath.section].transactions[indexPath.row]
        
        cell.titleLabel.text = transaction.cardName
        return cell
    }
}


