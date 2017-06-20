//
//  ViewControllerTwo.swift
//  Tappity
//
//  Created by Haichen Huang on 1/6/17.
//  Copyright © 2017 Haichen Huang. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {

    
    @IBOutlet weak var label2: UILabel!
        
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let userDefaults = Foundation.UserDefaults.standard

        
        let myarray = userDefaults.array(forKey: "ArrayTesting")  as? [Int] ?? [Int]()
        print(myarray)
        
        let value = userDefaults.string(forKey: "record1")
        if value == nil {
            
            label2.text = "0"
        } else {
            label2.text = value

        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
