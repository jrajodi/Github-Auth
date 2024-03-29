//
//  TestUtils.swift
//  githubRepoTests
//
//  Created by Qantas Dev on 24/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import Foundation

@testable import ALDO_Test

class MissingResourceError: NSError {
    let resource: String
    
    init(resource: String) {
        self.resource = resource
        super.init(domain: "TestUtils", code: 0, userInfo: [NSLocalizedDescriptionKey: "**** Missing resource: \(resource)"])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TestUtils {
    
    // MARK: - Bundled Test Resources
    
    static var testBundle: Bundle { return Bundle(for: self) }
    
    static func jsonData(forResource resourceName: String) throws -> Data {
        guard let path = testBundle.path(forResource: resourceName, ofType: "json") else {
            throw MissingResourceError(resource: resourceName + ".json")
        }
        return try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
    }
    
}
