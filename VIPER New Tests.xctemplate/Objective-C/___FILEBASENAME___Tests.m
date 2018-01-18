//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAMEASIDENTIFIER___Tests.h"
#import "___FILEBASENAMEASIDENTIFIER___Presenter.h"
#import "___FILEBASENAMEASIDENTIFIER___Interactor.h"
#import "___FILEBASENAMEASIDENTIFIER___ServiceMock.h"
#import "___FILEBASENAMEASIDENTIFIER___ViewMock.h"

@class ___FILEBASENAMEASIDENTIFIER___ViewMock;

@implementation ___FILEBASENAMEASIDENTIFIER___Tests

#pragma mark - Setup

- (void)setUp {
        
        self.localWireframe = [___FILEBASENAMEASIDENTIFIER___Wireframe new];
        self.localWireframe.delegate = self;
        self.wireframe = (id)self.localWireframe;
        
        [super setUp];
        
        /* Uncomment this to replace alert controllers with mock alert controller
        self.localWireframe.alertController = self.alertControllerMock;
         */
        
        /* Uncomment this to replace with mock service
        ((___FILEBASENAMEASIDENTIFIER___Interactor *)self.localWireframe.presenter.interactor).yourService = self.serviceMock;
         */
}

- (void)tearDown {
        [super tearDown];
}

#pragma mark - Getters

- (id<ViewMockProtocol>)viewMock {
        if (!super.viewMock) {
                super.viewMock = [___FILEBASENAMEASIDENTIFIER___ViewMock new];
        }
        return super.viewMock;
}

- (id<ServiceMockProtocol>)serviceMock {
        if (!super.serviceMock) {
                super.serviceMock = [___FILEBASENAMEASIDENTIFIER___ServiceMock new];
        }
        return super.serviceMock;
}

#pragma mark - Tests

- (void)testPublicMethodOnWireframe {
        // One test method per public method in ___FILEBASENAMEASIDENTIFIER___Wireframe.h
        
        /* Description
         Set self.testDescription to test descriptions declared in this header file
         */
        
        /* Alert View
         Set self.alertControllerMock.buttonTitleToBePushed to automatically have button pressed
         Set self.alertControllerMock.textFieldTextToBeEntered to simulate text entered
         */
        
        /* Service
         Set self.serviceMock.dataToReturn to manipulate return of data directly
         Then set back to nil to make sure it doesn't return that data on the next test
         */
        
        /* Checkpoints
         Call [self numberOfCheckpoints:aNumber] with number of checkpoints which need to be hit
         Then [self verifyCheckpoints] to assert checkpoints were hit
         */
}

#pragma mark - Module Delegate

/* Delegate methods (outgoing from module)
- (void)delegateMethod___FILEBASENAMEASIDENTIFIER___ {
        
}
 */

@end
