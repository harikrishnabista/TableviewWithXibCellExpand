//
//  ExpandableTableViewCell.swift
//  TableviewWithXibCellExpand
//
//  Created by Hari Bista on 9/17/19.
//  Copyright © 2019 Hari Bista. All rights reserved.
//

import UIKit

class ExpandableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var heightDetailView: NSLayoutConstraint!
    
}
