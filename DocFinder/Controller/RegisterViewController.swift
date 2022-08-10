//
//  RegisterViewController.swift
//  DocFinder
//
//  Created by user206624 on 8/4/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerUserName: UITextField!;
    @IBOutlet weak var registerUserEmail: UITextField!;
    @IBOutlet weak var registerUserPassword: UITextField!;
    @IBOutlet weak var registerUserReEnterPassword: UITextField!;
    
    @IBOutlet weak var registerScreenErrorMessage: UILabel!
    
    
    @IBOutlet weak var rsNameErrorMessage: UILabel!;
    @IBOutlet weak var rsEmailErrorMessage: UILabel!;
    @IBOutlet weak var rsPassErrorMessage: UILabel!;
    @IBOutlet weak var rsReEnterPassErrorMessage: UILabel!;
    
    @IBOutlet weak var registerBtn: UIButton!

    let parser = Parser()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rsNameErrorMessage.text = nil
        rsEmailErrorMessage.text = nil
        rsPassErrorMessage.text = nil
        rsReEnterPassErrorMessage.text = nil
        registerScreenErrorMessage.text = nil;
        
        modifyCSSTextField(sender: registerUserName)
        modifyCSSTextField(sender: registerUserEmail)
        modifyCSSTextField(sender: registerUserPassword)
        modifyCSSTextField(sender: registerUserReEnterPassword)
        modifyCSSButton(sender: registerBtn, buttonColor: blueColor)
    }
    
    func ClearErrorMessage() {
        registerScreenErrorMessage.text = nil;
    }
    
    @IBAction func ClearNameErrorMessage(_ sender: Any) {
        rsNameErrorMessage.text = nil;
        registerUserName.layer.borderColor = nil;
        registerUserName.layer.borderWidth = 0;
        ClearErrorMessage();
    }
    @IBAction func ClearEmailErrorMessage(_ sender: Any) {
        rsEmailErrorMessage.text = nil;
        registerUserEmail.layer.borderColor = nil
        registerUserEmail.layer.borderWidth = 0;
        ClearErrorMessage();
    }
    
    @IBAction func ClearPassErrorMessage(_ sender: Any) {
        rsPassErrorMessage.text = nil;
        registerUserPassword.layer.borderColor = nil;
        registerUserPassword.layer.borderWidth = 0;
        ClearErrorMessage();
    }
    
    @IBAction func ClearRePassErrorMessage(_ sender: Any) {
        rsReEnterPassErrorMessage.text = nil;
        registerUserReEnterPassword.layer.borderColor = nil;
        registerUserReEnterPassword.layer.borderWidth = 0;
        ClearErrorMessage();
    }
    
    func printFieldMissingErrorMessage(){
        registerScreenErrorMessage.text = "Some Fields are missing";
    }
    
    @IBAction func nameEnteringEnd(_ sender: Any) {
        if(registerUserName.text == nil || registerUserName.text == ""){
            rsNameErrorMessage.text = "Name is should not be empty"
            registerUserName.layer.borderColor = UIColor.red.cgColor;
            registerUserName.layer.borderWidth = 1.0
            
        } else if (!validateName(enteredName: registerUserName.text!)){
            rsNameErrorMessage.text = "Invalid Format\nContain only alphabets,space"
            registerUserName.layer.borderColor = UIColor.red.cgColor;
            registerUserName.layer.borderWidth = 1.0
        }
    }
    
    @IBAction func emailEntertingEnd(_ sender: Any) {
        if (registerUserEmail.text == nil || registerUserEmail.text == "") {
            rsEmailErrorMessage.text = "Email should not be empty"
            registerUserEmail.layer.borderWidth = 1
            registerUserEmail.layer.borderColor = UIColor.red.cgColor
            
        } else if (!validateEmail(enteredEmail: registerUserEmail.text!)){
            rsEmailErrorMessage.text = "Invalid email format"
            registerUserEmail.layer.borderWidth = 1
            registerUserEmail.layer.borderColor = UIColor.red.cgColor
            
        }
    }
    
    @IBAction func passwordEnteringEnd(_ sender: Any) {
        if (registerUserPassword.text == nil || registerUserPassword.text == "") {
            rsPassErrorMessage.text = "Password Should not be empty"
            registerUserPassword.layer.borderColor = UIColor.red.cgColor
            registerUserPassword.layer.borderWidth = 1
            
        } else if (registerUserPassword.text!.count < 5){
            rsPassErrorMessage.text = "Password should be minimum of 5 characters"
            registerUserPassword.layer.borderColor = UIColor.red.cgColor
            registerUserPassword.layer.borderWidth = 1
        }
    }
    
    
    @IBAction func reEnterPassEnteringEnd(_ sender: Any) {
        if (registerUserReEnterPassword.text == nil || registerUserReEnterPassword.text == "") {
            rsReEnterPassErrorMessage.text = "Should not be empty"
            registerUserReEnterPassword.layer.borderColor = UIColor.red.cgColor;
            registerUserReEnterPassword.layer.borderWidth = 1;
        } else if (registerUserPassword.text != registerUserReEnterPassword.text) {
            rsReEnterPassErrorMessage.text = "Should match with password"
            registerUserReEnterPassword.layer.borderColor = UIColor.red.cgColor;
            registerUserReEnterPassword.layer.borderWidth = 1;
        }
    }
    
    
    @IBAction func register(_ sender: Any) {
        
        var error = false;
        
        if(registerUserName.text == nil || registerUserName.text == ""){
            rsNameErrorMessage.text = "Name is should not be empty"
            registerUserName.layer.borderColor = UIColor.red.cgColor;
            registerUserName.layer.borderWidth = 1.0
            error = true
        } else if (!validateName(enteredName: registerUserName.text!)){
            rsNameErrorMessage.text = "Invalid Format\nContain only alphabets,space"
            registerUserName.layer.borderColor = UIColor.red.cgColor;
            registerUserName.layer.borderWidth = 1.0
            error = true
        }
        
        if (registerUserEmail.text == nil || registerUserEmail.text == "") {
            rsEmailErrorMessage.text = "Email should not be empty"
            registerUserEmail.layer.borderWidth = 1
            registerUserEmail.layer.borderColor = UIColor.red.cgColor
            error = true
        } else if (!validateEmail(enteredEmail: registerUserEmail.text!)){
            rsEmailErrorMessage.text = "Invalid email format"
            registerUserEmail.layer.borderWidth = 1
            registerUserEmail.layer.borderColor = UIColor.red.cgColor
            error = true
        }
        
        if (registerUserPassword.text == nil || registerUserPassword.text == "") {
            rsPassErrorMessage.text = "Password Should not be empty"
            registerUserPassword.layer.borderColor = UIColor.red.cgColor
            registerUserPassword.layer.borderWidth = 1
            error = true
        } else if (registerUserPassword.text!.count < 5){
            rsPassErrorMessage.text = "Password should be minimum of 5 characters"
            registerUserPassword.layer.borderColor = UIColor.red.cgColor
            registerUserPassword.layer.borderWidth = 1
        }
        
        if (registerUserReEnterPassword.text == nil || registerUserReEnterPassword.text == "") {
            rsReEnterPassErrorMessage.text = "Should not be empty"
            registerUserReEnterPassword.layer.borderColor = UIColor.red.cgColor;
            registerUserReEnterPassword.layer.borderWidth = 1;
            error = true
        } else if (registerUserPassword.text != registerUserReEnterPassword.text) {
            rsReEnterPassErrorMessage.text = "Should match with password"
            registerUserReEnterPassword.layer.borderColor = UIColor.red.cgColor;
            registerUserReEnterPassword.layer.borderWidth = 1;
            error = true
        }
        
        if (error) {
            registerScreenErrorMessage.text = "Some Fields are missing";
            return
            
        }
        
//        Passing data to API for validation
        parser.registerUserParse(userName: registerUserName.text!,
                                 userEmail: registerUserEmail.text!,
                                 userPassword: registerUserPassword.text!) {
            (outputResponse) in
            DispatchQueue.main.async {
                self.registerAPIDataValidate(responseData: outputResponse)
            }
            
        }
    }
    
//    API Response Data validation
    func registerAPIDataValidate(responseData: GenericApiResponse) {
        
        if(responseData.error) {
            self.registerScreenErrorMessage.text = responseData.message
        } else {
            self.registerScreenErrorMessage.text = responseData.message
        }
    }

}
