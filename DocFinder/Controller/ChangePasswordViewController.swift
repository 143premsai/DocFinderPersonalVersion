//
//  ChangePasswordViewController.swift
//  DocFinder
//
//  Created by user206624 on 8/4/22.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    // Outlets intilization
    @IBOutlet weak var changePassUserEmail: UITextField!;
    @IBOutlet weak var changePassUserPassword: UITextField!;
    @IBOutlet weak var changePassScreenErrorMessage: UILabel!
    @IBOutlet weak var submitButton: UIButton!

    // Accessing API Data
    let parser = Parser()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changePassScreenErrorMessage.text = nil;
        modifyCSSTextField(sender: changePassUserEmail)
        modifyCSSTextField(sender: changePassUserPassword)
        modifyCSSButton(sender: submitButton, buttonColor: blueColor)
    }
    
    // Actions of the button
    @IBAction func ClearErrorMessage(_ sender: Any) {
        changePassScreenErrorMessage.text = nil;
    }
    
    // Change password
    @IBAction func submit(_ sender: Any) {
        
        // Text fields Validations
        if(changePassUserEmail.text == nil || changePassUserPassword == nil
            || changePassUserEmail.text == "" || changePassUserPassword.text == "") {
            changePassScreenErrorMessage.text = "User Email / Password is empty";
            return
        }
        
        // Email Format Validation
        if(!validateEmail(enteredEmail: changePassUserEmail.text!)){
            changePassScreenErrorMessage.text = "Invalid Email format";
            return
        }
        
        // Passing data to API for validation
        parser.changePasswordParse(userEmail: changePassUserEmail.text!, userPassword: changePassUserPassword.text!) {
            (outputResponse) in
            DispatchQueue.main.async {
                self.changePasswordAPIDataValidate(responseData: outputResponse)
            }
            
        }
    }
    
    // API Response Data validation
    func changePasswordAPIDataValidate(responseData: GenericApiResponse) {
        if(responseData.error) {
            self.changePassScreenErrorMessage.text = responseData.message
        } else {
            self.changePassScreenErrorMessage.text = responseData.message
        }
    }

}
