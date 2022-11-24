//
//  HomeTableViewCell.swift
//  dataApp
//
//  Created by Otávio da Silva on 22/11/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var viewCorner: UIView!
    @IBOutlet weak var dayOfWeek: UILabel!
    @IBOutlet weak var holidayName: UILabel!
    @IBOutlet weak var days: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCorner.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(_ holidays: Holiday?) {
        holidayName.text = holidays?.name
        days.text = holidays?.holidayDay()
        dayOfWeek.text = holidays?.holidayWeek()
    }

}
