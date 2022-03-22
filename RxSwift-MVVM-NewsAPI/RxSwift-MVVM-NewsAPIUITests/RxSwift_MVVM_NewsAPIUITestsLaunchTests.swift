//
//  RxSwift_MVVM_NewsAPIUITestsLaunchTests.swift
//  RxSwift-MVVM-NewsAPIUITests
//
//  Created by 木元健太郎 on 2022/03/22.
//

import XCTest

class RxSwift_MVVM_NewsAPIUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
