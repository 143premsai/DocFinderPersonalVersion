//
//  SharedData.swift
//  DocFinder
//
//  Created by user206624 on 8/4/22.
//

import Foundation
import UIKit


var SharedUserName = String()
var SharedUserId = Int()
var SharedUserEmail = String()

var sharedLocationLatitude = Double()
var sharedLocationLongitude = Double()



func validateEmail(enteredEmail:String) -> Bool {

    let emailFormat = "[A-Z0-9a-z._-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: enteredEmail)

}


func validateName(enteredName:String) -> Bool {

    let nameFormat = "[ A-Za-z]+"
    let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameFormat)
    return namePredicate.evaluate(with: enteredName)

}

var sharedDoctorInfo = Doctor(id: nil, name: nil, address: nil, phone: nil, speciality: nil, city: nil, state: nil, latitude: nil, longitude: nil)


var blueColor = UIColor.init(rgbColorCodeRed: 0, green: 128, blue: 255, alpha: 1)

extension UIColor {

   convenience init(rgbColorCodeRed red: Int, green: Int, blue: Int, alpha: CGFloat) {

     let redPart: CGFloat = CGFloat(red) / 255
     let greenPart: CGFloat = CGFloat(green) / 255
     let bluePart: CGFloat = CGFloat(blue) / 255

     self.init(red: redPart, green: greenPart, blue: bluePart, alpha: alpha)

   }
}


func modifyCSSTextField(sender: UITextField){
    sender.layer.cornerRadius = 22
    sender.layer.backgroundColor = UIColor.init(rgbColorCodeRed: 240, green: 240, blue: 240, alpha: 1).cgColor
    sender.clipsToBounds = false
    sender.layer.shadowOpacity = 0.2
    sender.layer.shadowOffset = CGSize(width: 10, height: 13)
}

func modifyCSSImage(sender: UIImageView){
    sender.layer.cornerRadius = 30
    sender.layer.backgroundColor = UIColor.init(rgbColorCodeRed: 240, green: 240, blue: 240, alpha: 1).cgColor
    sender.clipsToBounds = false
    sender.layer.shadowOpacity = 0.2
    sender.layer.shadowOffset = CGSize(width: 10, height: 13)
}


func modifyCSSTable(sender: UITableView){
    sender.layer.cornerRadius = 15
    sender.layer.backgroundColor = UIColor.init(rgbColorCodeRed: 240, green: 240, blue: 240, alpha: 1).cgColor
    sender.clipsToBounds = false
    sender.layer.shadowOpacity = 0.2
    sender.layer.shadowOffset = CGSize(width: 10, height: 13)
}


func modifyCSSButton(sender: UIButton, buttonColor : UIColor){
    sender.layer.cornerRadius = 15
    sender.layer.backgroundColor = buttonColor.cgColor
    sender.clipsToBounds = false
    sender.layer.shadowOpacity=0.2
    sender.setTitleColor(UIColor.white, for: .normal)
    sender.layer.shadowOffset = CGSize(width: 10, height: 13)
}


func modifyCSSStackView(sender: UIStackView){
    sender.layer.cornerRadius = 15
    sender.layer.backgroundColor = UIColor.init(rgbColorCodeRed: 240, green: 240, blue: 240, alpha: 1).cgColor
    sender.clipsToBounds = false
    sender.layer.shadowOpacity=0.2
    sender.layer.shadowOffset = CGSize(width: 10, height: 13)
}
