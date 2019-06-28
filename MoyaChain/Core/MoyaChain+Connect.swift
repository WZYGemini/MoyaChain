//
//  MoyaChain+Connect.swift
//  MoyaChain
//
//  Created by W&Z on 2019/6/28.
//

import Foundation


public extension NetChain {
    
    
    /// 连接服务器
    ///
    /// - Parameters:
    ///   - config: 服务器配置
    ///   - completion: 完成
    ///   - error: 错误
    func connect(config:ChainConfig,
                 completion:@escaping Completion,
                 error:@escaping ChainError) -> Void {
        
        provider.request(
            config.asTargetType(),
            completion: handle(with: completion, error: error)
        )
    }
    
}
