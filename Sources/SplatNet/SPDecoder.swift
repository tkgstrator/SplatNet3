//
//  SPDecoder.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public class SPDecoder: JSONDecoder {
    public override init() {
        super.init()
        self.dateDecodingStrategy = .iso8601
        self.keyDecodingStrategy = .convertFromSnakeCase
    }
}
