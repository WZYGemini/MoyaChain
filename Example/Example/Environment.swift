//
//  Environment.swift
//  Example
//
//  Created by W&Z on 2019/6/26.
//  Copyright © 2019 W&Z. All rights reserved.
//

import Foundation
import MoyaChain
import Moya
enum Environment {
    
    case api
}

extension Environment :ChainConfig{
    
    
    var baseURL: URL {
        
        return URL(string: "http://114.115.250.204:8081")!
    }
    
    var path: String {
        return "app/ACsxfDeviceNote/selectList"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        
        return Data()
    }
    
    var task: Task {
        return Task.requestParameters(
            parameters: [
                "EID" : "8863094d-b639-432d-870f-62f3aafeb6a6",
                "USER_ID":"20190515"
            ],
            encoding: URLEncoding.default
        )
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
