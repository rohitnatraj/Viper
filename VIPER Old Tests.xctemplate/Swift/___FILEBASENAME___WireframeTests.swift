//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit
import XCTest

@testable import ___PROJECTNAME___

class ___FILEBASENAMEASIDENTIFIER___WireframeTests: XCTestCase,
        ___FILEBASENAMEASIDENTIFIER___Delegate,
        ___FILEBASENAMEASIDENTIFIER___WireframeToPresenterInterface
        {
        var wireframe = ___FILEBASENAMEASIDENTIFIER___()
        
        // MARK: - Test Objects
        var expectation: XCTestExpectation?
        
        override func setUp() {
                super.setUp()
                
		wireframe = ___FILEBASENAMEASIDENTIFIER___()
                
                wireframe.delegate = self;
                wireframe.presenter = self;
        }
        
        override func tearDown() {
                super.tearDown()
                expectation = nil;
        }
        
        // MARK: - Init
        func testInitWithNothingShouldInstantiateVIPERStackAndConnectLayers() {
                wireframe = ___FILEBASENAMEASIDENTIFIER___()
                
                XCTAssertNotNil(wireframe, "Wireframe cannot be nil after init")
                
                XCTAssertNotNil(wireframe.interactor, "Interactor cannot be nil after init")
                XCTAssertNotNil(wireframe.presenter, "Presenter cannot be nil after init")
                XCTAssertNotNil(wireframe.view, "View cannot be nil after init")
                
                XCTAssert (wireframe.presenter === wireframe.interactor.presenter ? true : false, "Interactor's presenter must be the module's presenter")
                
                XCTAssert(wireframe.interactor === wireframe.presenter.interactor ? true : false, "Presenter's interactor must be the module's interactor")
                XCTAssert(wireframe.view === wireframe.presenter.view ? true : false, "Presenter's view must be the module's view")
                XCTAssert(wireframe === wireframe.presenter.wireframe ? true : false, "Presenter's wireframe must be the module'swireframe")
                
                XCTAssert(wireframe.presenter === wireframe.view.presenter ? true : false, "View's presenter must be the module's presenter")
                
                XCTAssert(wireframe.presenter === wireframe.presenter ? true : false, "Wireframe's presenter must be the module's presenter")
        }
        
        // MARK: - Lazy Loaders
        func test___FILEBASENAMEASIDENTIFIER___InteractorLazyLoaderWithNilValueShouldInstantiateInteractor() {
                XCTAssertNotNil (wireframe.interactor, "Lazy loader should create a new interactor if it doesnt exist")
                XCTAssertTrue (wireframe.interactor.isKindOfClass(___FILEBASENAMEASIDENTIFIER___Interactor), "Lazily loader should create an instance of ___FILEBASENAMEASIDENTIFIER___Interactor")
        }

        func test___FILEBASENAMEASIDENTIFIER___PresenterLazyLoaderWithNilValueShouldInstantiatePresenter() {
                XCTAssertNotNil (wireframe.presenter, "Lazy loader should create a new presenter if it doesnt exist")
                XCTAssertTrue (wireframe.presenter.isKindOfClass(___FILEBASENAMEASIDENTIFIER___Presenter), "Lazily loader should create an instance of ___FILEBASENAMEASIDENTIFIER___Presenter")
        }

        func test___FILEBASENAMEASIDENTIFIER___ViewLazyLoaderWithNilValueShouldInstantiateView() {
                XCTAssertNotNil (wireframe.view, "Lazy loader should create a new view if it doesnt exist")
                XCTAssertTrue (wireframe.view.isKindOfClass(___FILEBASENAMEASIDENTIFIER___View), "Lazily loader should create an instance of ___FILEBASENAMEASIDENTIFIER___View")
        }

        func testStoryboardWithNothingShouldReturnStoryboardWithk___FILEBASENAMEASIDENTIFIER___StoryboardIdentifier() {
                let storyboard = ___FILEBASENAMEASIDENTIFIER___Wireframe.storyboard()
                
                XCTAssertEqual (k___FILEBASENAMEASIDENTIFIER___StoryboardIdentifier, storyboard.valueForKey("name") as! String?, "Storyboard identifier should be the constant identifier defined in the ___FILEBASENAMEASIDENTIFIER___WireframeProtocols file")
        }

        // MARK: - Operational
        
        // MARK: - Module Interface
        
        // MARK: - Presenter to Wireframe Interface
        
        // MARK: - Delegate
        
        // MARK: - Wireframe to Presenter Interface
}
