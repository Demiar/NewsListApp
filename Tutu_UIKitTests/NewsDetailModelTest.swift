//
//  NewsDetailModelTest.swift
//  Tutu_UIKitTests
//
//  Created by Алексей on 27.10.2021.
//

import XCTest
@testable import Tutu_UIKit

class NewsDetailModelTest: XCTestCase {
    var sut: NewsDetailModel!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testReadPropertyNewsDetailModel() throws {
        sut = NewsDetailModel(
            article: Article(id: 11,
                             title: "title",
                             url: nil,
                             imageUrl: "imageUrl",
                             newsSite: nil,
                             summary: "detail",
                             publishedAt: "date",
                             updatedAt: nil,
                             featured: nil,
                             launches: nil,
                             events: nil
                            )
            )
        XCTAssert(sut.title == "title", "title Ok")
        XCTAssert(sut.detailText == "detail", "detail Ok")
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

}
