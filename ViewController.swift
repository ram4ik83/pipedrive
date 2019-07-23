//
//  ViewController.swift
//  pipedrive
//
//  Created by Ramil on 23/07/2019.
//  Copyright © 2019 Ramil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func makeRequet(_ sender: Any) {
        simpleGetUrlRequestWithErrorHandling()
    }
    
    struct Contact {
        let contactdata: String
        
        init(json: [String: Any]) {
            contactdata = json["success"] as? String ?? "NOTHING"
            let myvalue = json["success"]
            let data = json["data"]
            let related_objects = json["related_objects"]
            let additional_data = json["additional_data"]
            
            print("MYVALUE IS: \(myvalue)")
            print("MYDATA IS: \(data)")
            print("RELATED_OBJECTW IS: \(related_objects)")
            print("Additional data is: \(additional_data)")
        }
    }
    
    func simpleGetUrlRequestWithErrorHandling()
    {
        let session = URLSession.shared
        let url = URL(string: "https://api.pipedrive.com/v1/persons?start=0&api_token=ce750114ec3204f128b4eca32f6d6d4cf12bd97e")!
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] else {return}
                
                print("The Response is : ", json)
                
                let contact = Contact(json: json)
                print(contact.contactdata)
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
            
            
        }
        task.resume()
    }
}

