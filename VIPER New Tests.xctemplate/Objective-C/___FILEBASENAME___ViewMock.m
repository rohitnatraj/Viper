//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAMEASIDENTIFIER___ViewMock.h"
#import "___FILEBASENAMEASIDENTIFIER___Tests.h"

@implementation ___FILEBASENAMEASIDENTIFIER___ViewMock

@synthesize testDescription, tests;

/* Examples of asserting inside view protocol methods
- (void)showSomethingInView {
        if ([self.tests inTestCases:@[kTestCase1, kTestCase2]]) {
                [self.tests completeCheckpoint:1];
        }
}

- (void)showSomethingElseInView:(NSString *)somethingToShow {
        if ([self.tests inTestCase:kTestCase1]) {
                [self.tests assertNil:somethingToShow];
        } else if ([self.tests inTestCase:kTestCase2]) {
                [self.tests assertKeyword:@"keyword" existsInString:somethingToShow];
        }
}

- (void)showYetAnotherThingInView:(BOOL)variable {
        if ([self.tests inTestCase:kTestCase1]) {
                [self.tests assertFalse:variable];
        }
}
 */

/* Example of how to override dismissViewControllerAnimated: to return completion immediately
- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
        if ([self.tests inTestCases:@[kTestCase3, kTestCase4]]) {
                if (completion) {
                        completion();
                }
        }
}
*/
 
@end