//
//  TestClass.h
//  FalconUniversal
//
//  Created by Kevin Teman on 7/11/16.
//  Copyright © 2016 DaVita. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import <FalconMobileFoundation/AlertController.h>

@class AlertControllerMock;
@class BaseTestClass;

@protocol PresenterTestProtocol <NSObject>
@property (nonatomic, strong) id view;
@end

@protocol WireframeTestProtocol <NSObject>
@property (nonatomic, weak) id delegate;
@property (nonatomic, strong) id view;
@property (nonatomic, strong) id presenter;
@end

@protocol AlertControllerMockProtocol <NSObject>
@property (nonatomic, weak) BaseTestClass *tests;
@property (nonatomic, copy) NSString *buttonTitleToBePushed;
@property (nonatomic, copy) NSString *textFieldTextToBeEntered;
@end

@protocol ViewMockProtocol <NSObject>

@required
@property (nonatomic, copy) NSString *testDescription;
@property (nonatomic, strong) BaseTestClass *tests;

@optional
@property (nonatomic, strong) id presenter;

@end

@protocol ServiceMockProtocol <NSObject>
@property (nonatomic, copy) NSString *testDescription;
@property (nonatomic, weak) BaseTestClass *tests;
@property (nonatomic, strong) id dataToReturn;
@end

@interface BaseTestClass : XCTestCase

@property (nonatomic, strong) id wireframe;
@property (nonatomic, strong) id<ServiceMockProtocol> serviceMock;
@property (nonatomic, strong) id<ViewMockProtocol> viewMock;

@property (nonatomic, strong) XCTestExpectation *expection;
@property (nonatomic, strong) NSString *testDescription;
@property (nonatomic, strong) id <AlertControllerMockProtocol> alertControllerMock;

#pragma mark - Assertions

- (void)assertFalse:(BOOL)itemToAssert;
- (void)assertNotNil:(id)itemToAssert;
- (void)assertNil:(id)itemToAssert;
- (void)assert:(int)objectOne isEqualTo:(int)objectTwo;
- (void)assertObject:(id)objectOne isEqualTo:(id)objectTwo;
- (void)assertKeyword:(NSString *)keyword existsInString:(NSString *)string;

#pragma mark - Checkpoints

- (void)setNumberOfCheckpoints:(NSInteger)checkpointsAmount;
- (void)completeCheckpoint:(NSInteger)checkpoint;
- (void)verifyCheckpoints;

// ***** Optional *****
- (void)setCheckpointOrderIrrelevant;

#pragma mark - Convenience

- (BOOL)inTestCase:(NSString *)testCase;
- (BOOL)inTestCases:(NSArray <NSString *> *)testCases;

@end
