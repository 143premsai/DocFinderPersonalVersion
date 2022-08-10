//
//  SpecialityDoctorsViewController.swift
//  DocFinder
//
//  Created by user206624 on 8/5/22.
//

import UIKit

class SpecialityDoctorsViewController: UIViewController,UIPickerViewDelegate,
                                       UIPickerViewDataSource, UITextFieldDelegate,
                                       UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var specialityDropDownText: UITextField!
    var selectedSpecialty: String?
    var specialityList = ["Internal Medicine",
                          "Respirology",
                          "Family Medicine",
                          "Anesthesiology",
                          "Cardiology",
                          "Internal Medicine",
                          "Obstetrics",
                          "Gynecology",
                          "Psychiatry",
                          "Gastroenterology",
                          "Otolaryngology",
                          "Head",
                          "Neck Surgery",
                          "Neurology",
                          "Orthopedic",
                          "Dermatology",
                          "Rheumatology",
                          "Plastic Surgery",
                          "Orthopedic Surgery",
                          "Geriatric Medicine",
                          "Endocrinology",
                          "Metabolism"]
    
    
    var dropDownView = UIPickerView()
    
    @IBOutlet weak var specialityDoctorsTable: UITableView!
    
    @IBOutlet weak var specialityScreenErrorMessage: UILabel!
    
    
    var specialityDoctors = [Doctor]()
    
    let parser = Parser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDownView.delegate = self
        dropDownView.dataSource = self
        specialityDropDownText.inputView = dropDownView
        dismissDropDownPickerView()
        
        specialityDoctorsTable.delegate = self
        specialityDoctorsTable.dataSource = self
        specialityScreenErrorMessage.text = nil
        specialityDoctorsTable.alwaysBounceVertical = false
        specialityDoctorsTable.isHidden = true;
        // Do any additional setup after loading the view.
        
        modifyCSSTextField(sender: specialityDropDownText)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return specialityList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return specialityList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSpecialty = specialityList[row]
        specialityDropDownText.text = selectedSpecialty
    }
    
    func dismissDropDownPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self,
                                     action: #selector(self.completedAction))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        specialityDropDownText.inputAccessoryView = toolBar
    }
    
    @objc func completedAction(){
        view.endEditing(true)
        SubmitSpecialityDoctors()
    }
    
    func SubmitSpecialityDoctors(){
        if (selectedSpecialty == nil || selectedSpecialty == ""){
            specialityScreenErrorMessage.text = "Please selected the speciality"
            return
        } else {
            specialityScreenErrorMessage.text = nil
            
            parser.specialityDoctorParse(speciality: selectedSpecialty!) {
                (outputResponse) in
                DispatchQueue.main.async {
                    self.specialityDocAPIDataValidate(docData: outputResponse)
                }
                
            }
        }
    }
    
    func specialityDocAPIDataValidate(docData: DoctorDetails) {
        
        if(docData.error) {
            self.specialityScreenErrorMessage.text = docData.message
            self.specialityDoctorsTable.isHidden = true;
        } else {
            self.specialityDoctors = docData.doctors
            self.specialityDoctorsTable.isHidden = false;
            self.specialityDoctorsTable.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        if let vc = storyboard.instantiateViewController(withIdentifier: "DoctorInformationScreen") as? DoctorInformationViewController {
            vc.doctorName = specialityDoctors[indexPath.row].name
            vc.doctorAddress = specialityDoctors[indexPath.row].address
            vc.doctorPhone = specialityDoctors[indexPath.row].phone
            vc.doctorSpeciality = specialityDoctors[indexPath.row].speciality
            vc.doctorLatitude = specialityDoctors[indexPath.row].latitude
            vc.doctorLongitude = specialityDoctors[indexPath.row].longitude
            self.navigationController?.pushViewController(vc, animated: true)
        } ;

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specialityDoctors.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "specialityDocCell", for: indexPath) as! DoctorDetailsTableViewCell
        
        cell.DoctorName.text = specialityDoctors[indexPath.row].name
        cell.DoctorSpeciality.text = specialityDoctors[indexPath.row].speciality
        
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
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }

    
    
}
