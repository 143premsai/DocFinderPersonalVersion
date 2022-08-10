//
//  DoctorDetailsTableViewCell.swift
//  DocFinder
//
//  Created by user206624 on 8/5/22.
//

import UIKit

class DoctorDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var DoctorView: UIView!
    
    @IBOutlet weak var DoctorName: UILabel!
    
    @IBOutlet weak var DoctorSpeciality: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
