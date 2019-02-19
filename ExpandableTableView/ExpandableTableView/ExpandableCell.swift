//
//  ExpandableCell.swift
//  ExpandableTableView
//
//  Created by DG on 19/02/19.
//  Copyright © 2019 Exp. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblDetilText: UILabel!
    @IBOutlet weak var detialViewHightCons: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
