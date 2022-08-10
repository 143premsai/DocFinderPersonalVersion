//
//  HomeViewController.swift
//  DocFinder
//
//  Created by user206624 on 8/5/22.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var homeUserName: UILabel!
    
    @IBOutlet weak var nearByDoctorsTable: UITableView!
    
    @IBOutlet weak var homeScreenErrorMessage: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var nearByDoctors = [Doctor]()
    
    let parser = Parser()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        homeUserName.text = SharedUserName;
        nearByDoctorsTable.delegate = self
        nearByDoctorsTable.dataSource = self
        homeScreenErrorMessage.text = nil
        nearByDoctorsTable.alwaysBounceVertical = false
        nearByDoctorsTable.isHidden = true
        getNearByDoctors(self)
        
        modifyCSSImage(sender: imageView)
        
    }
    
    // Caling nearby doctors api for the data
    @IBAction func getNearByDoctors(_ sender: Any) {
        self.homeScreenErrorMessage.text = nil
        parser.nearByDoctorParse(latitude: sharedLocationLatitude, longitude: sharedLocationLongitude) {
            (outputResponse) in
            DispatchQueue.main.async {
                self.nearByDocAPIDataValidate(docData: outputResponse)
            }
            
        }
    }
    
    
    func nearByDocAPIDataValidate(docData: DoctorDetails) {
        
        if(docData.error) {
            self.homeScreenErrorMessage.text = docData.message
            nearByDoctorsTable.isHidden = true
        } else {
            self.nearByDoctors = docData.doctors
            if(self.nearByDoctors.count > 0 ){
                nearByDoctorsTable.isHidden = false
                self.nearByDoctorsTable.reloadData()
            }
            else {
                self.homeScreenErrorMessage.text = docData.message
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        if let vc = storyboard.instantiateViewController(withIdentifier: "DoctorInformationScreen") as? DoctorInformationViewController {
            vc.doctorName = nearByDoctors[indexPath.row].name
            vc.doctorAddress = nearByDoctors[indexPath.row].address
            vc.doctorPhone = nearByDoctors[indexPath.row].phone
            vc.doctorSpeciality = nearByDoctors[indexPath.row].speciality
            vc.doctorLatitude = nearByDoctors[indexPath.row].latitude
            vc.doctorLongitude = nearByDoctors[indexPath.row].longitude
            self.navigationController?.pushViewController(vc, animated: true)
        } ;

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nearByDoctors.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorInfoCell", for: indexPath) as! DoctorDetailsTableViewCell
        
        cell.DoctorName.text = nearByDoctors[indexPath.row].name
        cell.DoctorSpeciality.text = nearByDoctors[indexPath.row].speciality
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = UIColor.init(rgbColorCodeRed: 220, green: 221, blue: 228, alpha: 1)
            
        } else {
            cell.backgroundColor = UIColor.white
        }
        
    }

    
}
