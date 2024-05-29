//
//  AsyncTest+UnitTest.swift
//
//
//  Created by mohamed ahmed on 13/05/2024.
//

import XCTest

extension XCTestCase {
    func runAsyncTest(
        in file: StaticString = #file,
        at line: UInt = #line,
        test: @escaping () async throws -> Void
    ) async {
        var thrownError: Error?
        let errorHandler = { thrownError = $0 }
        do {
            try await test()
        } catch {
            errorHandler(error)
        }
        
        if let error = thrownError {
            XCTFail(
                "Async error thrown: \(error)",
                file: file,
                line: line
            )
        }
    }
}


