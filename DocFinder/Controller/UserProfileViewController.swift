//
//  UserProfileViewController.swift
//  DocFinder
//
//  Created by user206624 on 8/5/22.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var profileUserName: UILabel!
    @IBOutlet weak var profileUserEmail: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var logoutBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        profileUserName.text = SharedUserName;
        profileUserEmail.text = SharedUserEmail;
        
        modifyCSSImage(sender: profilePicture)
        modifyCSSButton(sender: logoutBtn, buttonColor: blueColor)
        
    }
    
    @IBAction func logout(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginTabController") ;
        
        // Going to Home Screen after successful login using scene delegate
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.modifyRootViewController(vc)
    }


}
