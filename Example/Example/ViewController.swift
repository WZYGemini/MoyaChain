//
//  ViewController.swift
//  Example
//
//  Created by W&Z on 2019/6/26.
//  Copyright © 2019 W&Z. All rights reserved.
//

import UIKit
import MoyaChain
import Moya
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let chain : NetChain<Response> = NetChain()

        chain.connect(config: Environment.api, completion: { (result, response) in
           
            print("result ->\(result)")
            print("response ->\(response)")
        }) { (error) in
            
        }
        
        
    
    }
}

