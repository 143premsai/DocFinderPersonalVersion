//
//  DoctorInformationViewController.swift
//  DocFinder
//
//  Created by user206624 on 8/5/22.
//

import UIKit

class DoctorInformationViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var speciality: UILabel!
    @IBOutlet weak var phone: UIButton!
    @IBOutlet weak var address: UIButton!
    
    @IBOutlet weak var descriptionText: UILabel!
    
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    var doctorName = ""
    var doctorPhone = ""
    var doctorAddress = ""
    var doctorSpeciality = ""
    var doctorLatitude = 0.0
    var doctorLongitude = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = doctorName
        speciality.text = doctorSpeciality
        address.setTitle(doctorAddress, for: .normal)
        phone.setTitle(doctorPhone, for: .normal)
        descriptionText.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        phone.titleLabel!.minimumScaleFactor = 0.5;
        phone.titleLabel?.adjustsFontSizeToFitWidth = true;
        address.titleLabel?.minimumScaleFactor = 0.5;
        address.titleLabel?.adjustsFontSizeToFitWidth = true;
        print(doctorPhone)
        print(doctorAddress)
        print(doctorName)
        
        modifyCSSStackView(sender: stackView)
    }
    
    
    @IBAction func getMapDirections(_ sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        if let vc = storyboard.instantiateViewController(withIdentifier: "DoctorMapScreen") as? DoctorMapViewController {
            vc.doctorName = doctorName
            vc.doctorAddress = doctorAddress
            vc.doctorPhone = doctorPhone
            vc.doctorSpeciality = doctorSpeciality
            vc.doctorLatitude = doctorLatitude
            vc.doctorLongitude = doctorLongitude
            self.navigationController?.pushViewController(vc, animated: true)
        } ;
    }


}
