//
//  MainCoordinatotTest.swift
//  Good NewsTests
//
//  Created by Julian Marzabal on 28/03/2023.
//

import XCTest
@testable import Good_News

class MainCoordinatotTest: XCTestCase {
    var sut: MainCoordinator!
    var navigationController: NavigationControllerMock!

    override func setUpWithError() throws {
        navigationController = NavigationControllerMock()
        sut = MainCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
    }

    func testStart() throws {
        sut.start()
        
        XCTAssertNotNil(navigationController.pushedViewController as? HomeViewController)
       
    }
    
    func testOnNewsView() throws {
        sut.onNewsView()
        
        XCTAssertNotNil(navigationController.pushedViewController as? NewsViewController)
    }
    
    func testOnInfoView() throws {
        let news = News(title: "Test", description: "Testing", urlToImage: "http://google.com", content: "")
        sut.onInfoView(news: news)
        
        XCTAssertNotNil(navigationController.pushedViewController as? infoViewController)
    }
    
    func testOnSucess() throws {
        sut.onSuccess()
        
        XCTAssertNotNil(navigationController.pushedViewController as? NewsViewController)
    }
    
    func testShowInfoNews() throws {
        let news = News(title: "Test", description: "Testing", urlToImage: "http://google.com", content: "")
        sut.showInfoNews(news: news)
        
        XCTAssertNotNil(navigationController.pushedViewController as? infoViewController)
    }

}
