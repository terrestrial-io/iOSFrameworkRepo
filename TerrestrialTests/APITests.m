//
//  APITests.m
//  Terrestrial
//
//  Created by MrMambwe on 21/01/2016.
//  Copyright © 2016 Terrestrial. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Terrestrial.h"

@interface APITests : XCTestCase

@property (nonatomic) Terrestrial *terrestrial;

@end

@implementation APITests

- (void)setUp
{
    [super setUp];
    
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]] resourcePath];
    [NSBundle bundleWithPath:bundlePath];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
    
}

/*
-(void) testStandardStringRetrieval {
    
    NSString *testString = @"abcdefghijklmnopqrstuvwxyz";
    NSString *retrievedString =  testString.translated;
    
    NSString *expectedRetrievedString = @"You have passed the test!";
    
    XCTAssertEqualObjects(expectedRetrievedString, retrievedString, @"Did not return the string in the localizable.strings file");
    
}


-(void) testNSLocalizedStringRetrieval {
    
    NSString *testString = @"abcdefghijklmnopqrstuvwxyz";
    NSString *retrievedString =  NSLocalizedString(testString,nil);
    
    NSString *expectedRetrievedString = @"You have passed the test!";
    
    NSLog(@"Retrieved String: %@", retrievedString);
    
    XCTAssertEqualObjects(expectedRetrievedString, retrievedString, @"Did not return the same strings when no matching translation was found");
    
}
 */

@end
