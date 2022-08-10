//
//  ViewController.swift
//  DocFinder
//
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginUserEmail: UITextField!;
    @IBOutlet weak var loginUserPassword: UITextField!;
    @IBOutlet weak var loginScreenErrorMessage: UILabel!
    
    let parser = Parser()

    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loginScreenErrorMessage.text = nil;
        
        // Modify styles of the fields
        modifyCSSTextField(sender: loginUserEmail)
        modifyCSSTextField(sender: loginUserPassword)
        modifyCSSButton(sender: loginButton, buttonColor: blueColor)  
        
    }

    @IBAction func ClearErrorMessage(_ sender: Any) {
        loginScreenErrorMessage.text = nil;
    }
    

    @IBAction func login(_ sender: Any) {
        
//        Text fields Validations
        if(loginUserEmail.text == nil || loginUserPassword == nil
            || loginUserEmail.text == "" || loginUserPassword.text == "") {
            loginScreenErrorMessage.text = "User Email / Password is empty";
            return
        }
        
//        Email Format Validation
        if(!validateEmail(enteredEmail: loginUserEmail.text!)){
            loginScreenErrorMessage.text = "Invalid Email format";
            return
        }
        
//        Passing data to API for validation
        parser.userLoginParse(userEmail: loginUserEmail.text!, userPassword: loginUserPassword.text!) {
            (outputResponse) in
            DispatchQueue.main.async {
                self.loginAPIDataValidate(userData: outputResponse)
            }
            
        }
    }
    
//    API Response Data validation
    func loginAPIDataValidate(userData: UserLoginDetails) {
        
        if(userData.error) {
            self.loginScreenErrorMessage.text = userData.message
        } else {
            SharedUserId = userData.user.id
            SharedUserEmail = userData.user.email
            SharedUserName = userData.user.name
            
            self.loginScreenErrorMessage.text = userData.message
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeNavController") ;
            
            // Going to Home Screen after successful login using scene delegate
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.modifyRootViewController(vc)
            
            
        }
    }
    
}

