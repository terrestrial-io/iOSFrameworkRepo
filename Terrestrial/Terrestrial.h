//
//  Terrestrial.h
//  Terrestrial
//
//  Created by MrMambwe on 16/09/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+Terrestrial_String.h"
#import "TerrestrialUICategoryAdditions.h"
#import "UIViewController+TerrestrialAddition.h"


//! Project version number for Terrestrial.
FOUNDATION_EXPORT double TerrestrialVersionNumber;

//! Project version string for Terrestrial.
FOUNDATION_EXPORT const unsigned char TerrestrialVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Terrestrial/PublicHeader.h>

#define translated(string) [[Terrestrial sharedInstance] stringForKey:string]

#define translatedPluralString(count,_pluralDict,_contextString) [[Terrestrial sharedInstance] stringForCount:count pluralDict:_pluralDict andContext:_contextString]

#define NSLocalizedString(key, comment) \
key.translatedID



static NSString * const trstlZeroRule = @"zero";
static NSString * const trstlOneRule = @"one";
static NSString * const trstlTwoRule = @"two";
static NSString * const trstlFewRule = @"few";
static NSString * const trstlManyRule = @"many";
static NSString * const trstlOtherRule = @"other";


@interface Terrestrial : NSObject {
    
    NSArray *retrievedStrings;
    NSString *manualLocale;
    NSArray *appStrings;
    
}

+ (id)sharedInstance;


- (NSString *) stringForKey: (NSString *) stringToTranslate andContext: (NSString *) contextString;

- (NSString *) stringForCount:(float)count pluralDict: (NSDictionary *)pluralDict andContext:(NSString *)contextString;

- (NSString *) appStringForID: (NSString *) idToTranslate;


- (void) setCurrentLanguageTo: (NSString *) lang;


+ (NSDictionary *) dictionaryWithContentsOfPlist:(NSString *)filePath;


/************* Pluralisation *************/


+ (NSString *) pluralStringWithCount: (int)count zero:(NSString *)zeroString context: (NSString *) contextString;

+ (NSString *) pluralStringWithCount: (int)count zero:(NSString *)zeroString one:(NSString *)zeroString context: (NSString *) contextString;

+ (NSString *) pluralStringWithCount: (int)count zero:(NSString *)zeroString one:(NSString *)oneString two:(NSString *)twoString context: (NSString *) contextString;

+ (NSString *) pluralStringWithCount: (int)count zero:(NSString *)zeroString one:(NSString *)oneString two:(NSString *)twoString few:(NSString *)fewString context: (NSString *) contextString;

+ (NSString *) pluralStringWithCount: (int)count zero:(NSString *)zeroString one:(NSString *)oneString two:(NSString *)twoString few:(NSString *)fewString many:(NSString *)manyString context: (NSString *) contextString;

+ (NSString *) pluralStringWithCount: (int)count
                                  id:(NSString *)idString
                                zero:(NSString *)zeroString
                                 one:(NSString *)oneString
                                 two:(NSString *)twoString
                                 few:(NSString *)fewString
                                many:(NSString *)manyString
                               other:(NSString *)otherString
                             context: (NSString *) contextString;

+ (NSString *) pluralStringWithCount: (int)count
                                  id:(NSString *)idString
                                zero:(NSString *)zeroString
                                 one:(NSString *)oneString
                               other:(NSString *)otherString
                             context: (NSString *) contextString;

+ (NSString *) pluralStringWithCount: (int)count
                                  id:(NSString *)idString
                                zero:(NSString *)zeroString
                               other:(NSString *)otherString
                             context: (NSString *) contextString;

+ (NSString *) pluralStringWithCount: (int)count
                                  id:(NSString *)idString
                                one:(NSString *)zeroString
                               other:(NSString *)otherString
                             context: (NSString *) contextString;


/*************************************/


/************* Screenshots ***********/

@property (strong, nonatomic) NSMutableArray *scannedStrings;

- (void) storeScannedStringDict:(NSDictionary *)stringsDict;

@property BOOL inScreenshotMode;



/*************************************/



@end



