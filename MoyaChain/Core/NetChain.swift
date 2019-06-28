//
//  NetChain.swift
//  MoyaChain
//
//  Created by W&Z on 2019/6/27.
//

import Foundation
import Moya


open class NetChain<T:Codable> {
    
    public typealias EndpointClosure = (Environment) -> Endpoint
    
    public typealias RequestResultClosure = Moya.MoyaProvider<Environment>.RequestResultClosure
    
    public typealias RequestClosure = (Endpoint, @escaping RequestResultClosure) -> Void
    
    public typealias StubClosure = (Environment) -> Moya.StubBehavior
    
    public typealias Completion = (T,HTTPURLResponse?) -> Void
    
    public typealias ChainError = (MoyaError?) -> Void
    
    let provider:MoyaProvider<Environment>
    
    /// Initializes a NetChain.
    public init(endpointClosure: @escaping EndpointClosure = MoyaProvider<Environment>.defaultEndpointMapping,
                requestClosure: @escaping RequestClosure = MoyaProvider<Environment>.defaultRequestMapping,
                stubClosure: @escaping StubClosure = MoyaProvider<Environment>.neverStub,
                callbackQueue: DispatchQueue? = nil,
                manager: Manager = MoyaProvider<Environment>.defaultAlamofireManager(),
                plugins: [PluginType] = [],
                trackInflights: Bool = false) {
        
        self.provider = MoyaProvider(
            endpointClosure: endpointClosure,
            requestClosure: requestClosure,
            stubClosure: stubClosure,
            callbackQueue: callbackQueue,
            manager: manager,
            plugins: plugins,
            trackInflights: trackInflights
        )
        
    }
}







