//
//  Good_NewsTests.swift
//  Good NewsTests
//
//  Created by Julian Marzabal on 27/03/2023.
//
@testable import Good_News
import XCTest

class NewsViewModelTests: XCTestCase {
    var sut: NewsViewModel!
    var delegate: NewsViewDelegateMock!
    var api: ApiMock!



    override func setUpWithError() throws {
        sut = NewsViewModel()
        delegate = NewsViewDelegateMock()
        sut.delegate = delegate
        api = ApiMock()
        sut.api = api
    }

    override func tearDownWithError() throws {
        sut = nil
        delegate = nil
        api = nil
    }

    func testGetNews() throws {
        var callbackHasBeenCalled = false
        api.newsResponse = .success([.init(title: "Russian lost war", description: "description", urlToImage: "https://google.com", content: "contentTest ")])
        sut.onSuccessfulUpdateReaction = {
            callbackHasBeenCalled = true
        }
        
        //When
        sut.getNews()
        
        XCTAssert(callbackHasBeenCalled)
        XCTAssert(sut.newsViewModel.count == 1)
        
        
    }
    
    func testSelectNewsByIndex() throws {
        let index = 0
        let expectedNews = News(title: "Test", description: "Testing", urlToImage: "http://google.com", content: "")
        let expectedNewsModel = NewsModel(title: "Test", description: "Testing", content: "", image: "http://google.com")
        
        sut.news = [expectedNews]
        
        sut.newsViewModel = [expectedNewsModel]
        sut.selectNewsBy(index: index)
        
        XCTAssert(delegate.onShowInfoNews)
        
   
        
    }
    


}
