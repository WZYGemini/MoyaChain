//
//  MoyaChain+Handle.swift
//  MoyaChain
//
//  Created by W&Z on 2019/6/28.
//

import Foundation
import Moya
import Result

extension NetChain {
    
    /// 柯里化处理 返回结果
    ///
    /// - Parameters:
    ///   - completion: 完成处理
    ///   - error: 处理失败
    func handle(with completion:@escaping Completion,
                error:@escaping ChainError ) -> (Result<Moya.Response, MoyaError>) -> Void {
        
        return {  result in
            
            switch result {
                
            case let .success(value):
            
                self.conversion(
                    value,
                    completion:completion,
                    errorClosure:error
                )
                
            case let .failure(value):
                error(value)
            }
            
        }
        
    }
    
    func conversion(_ response:Moya.Response,
                 completion:@escaping Completion,
                 errorClosure:@escaping ChainError) {
        do {
            let result = try decode(with: response.data)
            
            completion(result,response.response)
            
        } catch  {
            errorClosure(MoyaError.encodableMapping(error))
            
        }
        
    }
    
}
