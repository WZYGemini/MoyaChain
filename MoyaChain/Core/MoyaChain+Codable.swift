//
//  MoyaChain+Codable.swift
//  MoyaChain
//
//  Created by W&Z on 2019/6/28.
//

import Foundation



extension NetChain {
    
    /// 解码
    ///
    /// - Parameter data: 数据
    /// - Returns: 类型
    /// - Throws: 捕捉崩溃
    func decode( with data:Data ) throws ->  T {
        
        return try JSONDecoder().decode(T.self, from: data)
        
    }
}
