//
//  Parser.swift
//  DocFinder
//
//

import Foundation

var SomethingWentWrongMessage = "Something Went Wrong !!!\nTry Again !!!"
struct Parser {
    func userLoginParse(userEmail: String, userPassword: String, completionEvent: @escaping(UserLoginDetails)->()){
        
        // Creating post body string
        let postString = "email=\(userEmail)&password=\(userPassword)";
       
        let url = URL(string: "http://iosdocfinder.000webhostapp.com/login.php")
        
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // Setting HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        // API Calling
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let readableData = try jsonDecoder.decode(UserLoginDetails.self, from: data!)
                print("Successful login")
                completionEvent(readableData)
            } catch {
                print(postString)
                let dummyUser = UserInformation(name: nil, id: nil, email: nil)
                let errorUser = UserLoginDetails(error: true, message: SomethingWentWrongMessage, user: dummyUser);
                print("error occured in calling user login api")
                completionEvent(errorUser)
            }
        } ).resume()
        
    }
    
    
    func changePasswordParse(userEmail: String, userPassword: String, completionEvent: @escaping(GenericApiResponse)->()){
        
        // Creating post body string
        let postString = "email=\(userEmail)&password=\(userPassword)";
       
        let url = URL(string: "http://iosdocfinder.000webhostapp.com/change_password.php")
        
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // Setting HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        // API Calling
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let readableData = try jsonDecoder.decode(GenericApiResponse.self, from: data!)
                completionEvent(readableData)
            } catch {
                print(postString)
                let errorUser = GenericApiResponse(error: true, message: SomethingWentWrongMessage);
                print("error occured in calling user change password api")
                completionEvent(errorUser)
            }
        } ).resume()
        
    }
    
    
    func registerUserParse(userName:String, userEmail: String, userPassword: String, completionEvent: @escaping(GenericApiResponse)->()){
        
        // Creating post body string
        let postString = "email=\(userEmail)&password=\(userPassword)&name=\(userName)";
       
        let url = URL(string: "http://iosdocfinder.000webhostapp.com/register.php")
        
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // Setting HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        // API Calling
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let readableData = try jsonDecoder.decode(GenericApiResponse.self, from: data!)
                completionEvent(readableData)
            } catch {
                print(postString)
                let errorUser = GenericApiResponse(error: true, message: SomethingWentWrongMessage);
                print("error occured in calling user register api")
                completionEvent(errorUser)
            }
        } ).resume()
        
    }
    
    func nearByDoctorParse(latitude: Double, longitude: Double, completionEvent: @escaping(DoctorDetails)->()){
        
        // Creating post body string
        let postString = "latitude=\(latitude)&longitude=\(longitude)&miles=1";
       
        let url = URL(string: "http://iosdocfinder.000webhostapp.com/get_near_by_doctors.php")
        
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // Setting HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        // API Calling
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let readableData = try jsonDecoder.decode(DoctorDetails.self, from: data!)
                completionEvent(readableData)
            } catch {
                print(postString)
                let dummyDoctor = Doctor(id: nil, name: nil, address: nil, phone: nil, speciality: nil, city: nil, state: nil, latitude: nil, longitude: nil);
                let errorUser = DoctorDetails(error: true, doctors: [dummyDoctor], message: SomethingWentWrongMessage);
                print("error occured in calling near by doctors api")
                completionEvent(errorUser)
            }
        } ).resume()
        
    }
    
    func specialityDoctorParse(speciality: String,  completionEvent: @escaping(DoctorDetails)->()){
        
        // Creating post body string
        let postString = "search_term=\(speciality)";
       
        let url = URL(string: "http://iosdocfinder.000webhostapp.com/get_doctors_by_speciality.php")
        
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // Setting HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        // API Calling
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let readableData = try jsonDecoder.decode(DoctorDetails.self, from: data!)
                completionEvent(readableData)
            } catch {
                print(postString)
                let dummyDoctor = Doctor(id: nil, name: nil, address: nil, phone: nil, speciality: nil, city: nil, state: nil, latitude: nil, longitude: nil);
                let errorUser = DoctorDetails(error: true, doctors: [dummyDoctor], message: SomethingWentWrongMessage);
                print("error occured in calling doc speciality api")
                completionEvent(errorUser)
            }
        } ).resume()
        
    }
    
    
}
