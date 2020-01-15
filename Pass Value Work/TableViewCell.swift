//
//  TableViewCell.swift
//  Pass Value Work
//
//  Created by FISH on 2020/1/15.
//  Copyright © 2020 FISH. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func pass(_ tableViewCell: TableViewCell)
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        deleteButton.layer.borderWidth = 1
        deleteButton.layer.borderColor = UIColor.systemRed.cgColor
        deleteButton.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteCell(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        delegate.pass(self)
    }
}
