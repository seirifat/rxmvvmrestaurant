//
//  RxMVVM_RestaurantTests.swift
//  RxMVVM RestaurantTests
//
//  Created by Rifat Firdaus on 23/07/20.
//  Copyright © 2020 Seirifat. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import RxMVVM_Restaurant

class RxMVVM_RestaurantTests: XCTestCase {

    let disposeBag = DisposeBag()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        Observable.just("one").subscribe(onNext: { data in
            XCTAssertEqual(data, "one")
        }).disposed(by: disposeBag)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
