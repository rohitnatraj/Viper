//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "___FILEBASENAMEASIDENTIFIER___Wireframe.h"

#import "___FILEBASENAMEASIDENTIFIER___Interactor.h"
#import "___FILEBASENAMEASIDENTIFIER___Presenter.h"
#import "___FILEBASENAMEASIDENTIFIER___View.h"

@interface ___FILEBASENAMEASIDENTIFIER___WireframeTests : XCTestCase <___FILEBASENAMEASIDENTIFIER___Delegate, ___FILEBASENAMEASIDENTIFIER___Routing>

@property (nonatomic, strong) ___FILEBASENAMEASIDENTIFIER___Wireframe *wireframe;

// Test Objects
@property (nonatomic, strong) XCTestExpectation *expectation;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___WireframeTests

- (void)setUp {
        [super setUp];
        
        self.wireframe = [___FILEBASENAMEASIDENTIFIER___Wireframe new];
        
        self.wireframe.delegate = self;
        self.wireframe.presenter = self;
}

- (void)tearDown {
        [super tearDown];
        self.expectation = nil;
}

#pragma mark - Init
- (void)testInitWithNothingShouldInstantiateVIPERStackAndConnectLayers {
        self.wireframe = [___FILEBASENAMEASIDENTIFIER___Wireframe new];
        
        XCTAssertNotNil(self.wireframe, @"Wireframe cannot be nil after init");
        
        XCTAssertNotNil(self.wireframe.interactor, @"Interactor cannot be nil after init");
        XCTAssertNotNil(self.wireframe.presenter, @"Presenter cannot be nil after init");
        XCTAssertNotNil(self.wireframe.view, @"View cannot be nil after init");
        
        XCTAssertEqualObjects(self.wireframe.interactor.presenter, self.wireframe.presenter, @"Interactor's presenter must be the module's presenter");
        
        XCTAssertEqualObjects(self.wireframe.presenter.interactor, self.wireframe.interactor, @"Presenter's interactor must be the module's interactor");
        XCTAssertEqualObjects(self.wireframe.presenter.view, self.wireframe.view, @"Presenter's view must be the module's view");
        XCTAssertEqualObjects(self.wireframe.presenter.wireframe, self.wireframe, @"Presenter's wireframe must be the module's wireframe");
        
        XCTAssertEqualObjects(self.wireframe.view.presenter, self.wireframe.presenter, @"View's presenter must be the module's presenter");
        
        XCTAssertEqualObjects(self.wireframe.presenter, self.wireframe.presenter, @"Wireframe's presenter must be the module's presenter");
}

#pragma mark - Lazy Loaders
-(void)test___FILEBASENAMEASIDENTIFIER___InteractorLazyLoaderWithNilValueShouldInstantiateInteractor {
        self.wireframe.interactor = nil;
        
        XCTAssertNotNil (self.wireframe.interactor, @"Lazy loader should create a new interactor if it doesnt exist");
        XCTAssertTrue ([self.wireframe.interactor isKindOfClass:[___FILEBASENAMEASIDENTIFIER___Interactor class]], @"Lazily loader should create an instance of ___FILEBASENAMEASIDENTIFIER___Interactor");
}

-(void)test___FILEBASENAMEASIDENTIFIER___PresenterLazyLoaderWithNilValueShouldInstantiatePresenter {
        self.wireframe.presenter = nil;
        
        XCTAssertNotNil (self.wireframe.presenter, @"Lazy loader should create a new presenter if it doesnt exist");
        XCTAssertTrue ([self.wireframe.presenter isKindOfClass:[___FILEBASENAMEASIDENTIFIER___Presenter class]], @"Lazily loader should create an instance of ___FILEBASENAMEASIDENTIFIER___Presenter");
}

-(void)test___FILEBASENAMEASIDENTIFIER___ViewLazyLoaderWithNilValueShouldInstantiateView {
        self.wireframe.view = nil;
        
        XCTAssertNotNil (self.wireframe.view, @"Lazy loader should create a new view if it doesnt exist");
        XCTAssertTrue ([self.wireframe.view isKindOfClass:[___FILEBASENAMEASIDENTIFIER___View class]], @"Lazily loader should create an instance of ___FILEBASENAMEASIDENTIFIER___View");
}

-(void)testStoryboardWithNothingShouldReturnStoryboardWithk___FILEBASENAMEASIDENTIFIER___StoryboardIdentifier {
        UIStoryboard *storyboard = [self.wireframe storyboard];
        
        XCTAssertEqualObjects (k___FILEBASENAMEASIDENTIFIER___Storyboard, [storyboard valueForKey:@"name"], @"Storyboard identifier should be the constant identifier defined in the ___FILEBASENAMEASIDENTIFIER___WireframeProtocols file");
}

#pragma mark - Operational

#pragma mark - Wireframe Interface

#pragma mark - Delegate

#pragma mark - Routing

@end
