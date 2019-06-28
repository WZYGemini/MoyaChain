//
//  MCEnvironmentType.swift
//  MoyaChain
//
//  Created by W&Z on 2019/6/27.
//

import Foundation
import Moya


public protocol ChainConfig {
    
    /// The target's base `URL`.
    var baseURL: URL { get }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }
    
    /// The HTTP method used in the request.
    var method: Moya.Method { get }
    
    /// Provides stub data for use in testing.
    var sampleData: Data { get }
    
    /// The type of HTTP task to be performed.
    var task: Task { get }
    
    /// The type of validation to perform on the request. Default is `.none`.
    var validationType: ValidationType { get }
    
    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}

extension ChainConfig{
    
    public var validationType: ValidationType{
        
        return .none
    }
    
}

extension ChainConfig {
    
    func asTargetType() -> Environment {
        
        return Environment(env: self)
    }
}

public struct Environment : TargetType {
    
    public let baseURL: URL
    
    public let path: String
    
    public let method: Moya.Method
    
    public let sampleData: Data
    
    public let task: Task
    
    public let headers: [String : String]?
    
    public let validationType: ValidationType
    
    init( env:ChainConfig) {
        
        self.baseURL = env.baseURL
        self.path = env.path
        self.method = env.method
        self.sampleData = env.sampleData
        self.task = env.task
        self.headers = env.headers
        self.validationType = env.validationType
    }
    
}
