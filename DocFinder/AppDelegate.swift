//
//  AppDelegate.swift
//  DocFinder
//
//  Created by user206624 on 8/4/22.
//

import UIKit
import CoreLocation

@main
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var locationManager:CLLocationManager!
    private var currentCoordinate: CLLocationCoordinate2D?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupLocationManager()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    func setupLocationManager(){
                locationManager = CLLocationManager()
                locationManager?.delegate = self
                self.locationManager?.requestWhenInUseAuthorization()
                locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager?.startUpdatingLocation()

            }

        // Below method will provide you current location.
         func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

            if let _ = locations.first {
                manager.startUpdatingLocation()
                let locationValue:CLLocationCoordinate2D = manager.location!.coordinate
                sharedLocationLatitude = locationValue.latitude;
                sharedLocationLongitude = locationValue.longitude;
                print("latitude = \(sharedLocationLatitude) longitude = \(sharedLocationLongitude)")
                
                
            }
        }

        // Below Mehtod will print error if not able to update location.
            func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
                print("Error")
            }


}

