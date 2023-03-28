//
//  NewsViewControllerTest.swift
//  Good NewsTests
//
//  Created by Julian Marzabal on 28/03/2023.
//
@testable import Good_News
import XCTest

class NewsViewControllerTest: XCTestCase {
    var sut: NewsViewController!
    var viewmodel: NewsViewModel!
    

    override func setUpWithError() throws {
        viewmodel = NewsViewModel()
        sut = NewsViewController(viewmodel: viewmodel)
        sut.viewmodel = viewmodel
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        viewmodel = nil
   
    }

    func testBindReaction() throws {
        func testBindReaction() throws {
            var isReloadDataCalled = false
            
            viewmodel.onSuccessfulUpdateReaction = {
                isReloadDataCalled = true
            }
            
            sut.bindReaction()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                XCTAssert(isReloadDataCalled)
            }
        }
    }
    func testTableViewConfigurations() {
          XCTAssertNotNil(sut.TableView.delegate)
          XCTAssertNotNil(sut.TableView.dataSource)

          XCTAssertEqual(sut.TableView.rowHeight, UITableView.automaticDimension)
      }
    
    func testNumberOfSections() {
          let numberOfSections = sut.TableView.numberOfSections
          XCTAssertEqual(numberOfSections, 1)
      }
    func testViewDidLayoutSubviews() {
       
        sut.loadViewIfNeeded()
        
      
        sut.viewDidLayoutSubviews()

        XCTAssertEqual(sut.TableView.frame, sut.view.bounds)
    }

   
}
