//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAMEASIDENTIFIER___ServiceMock.h"

@implementation ___FILEBASENAMEASIDENTIFIER___ServiceMock

@synthesize testDescription, tests, dataToReturn;

- (void)testMethodWithSomething:(NSString *)someParameter
                                          onSuccess:(void (^)(NSDictionary *result))successHandler
                                          onFailure:(void (^)(NSError *error))errorHandler {
        
        if (self.dataToReturn) {
                if (successHandler) {
                        successHandler(dataToReturn);
                }
                return;
        }
       
        /* Call success handler immediately with fake data depending on which test case we're in
        if ([self.tests inTestCase:kTestCase1]) {
                successHandler(@{@"fakeKey":@"fakeValue"});
        }
         */
}

@end