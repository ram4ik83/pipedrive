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
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("The Response is : ",json)
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
            
            
        }
        task.resume()
    }
}

