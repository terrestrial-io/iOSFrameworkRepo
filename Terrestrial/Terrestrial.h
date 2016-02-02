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

/*** Terrestrial photoshoot framework ***/
#import <TerrestrialPhotoshoot/TerrestrialPhotoshoot.h>

//! Project version number for Terrestrial.
FOUNDATION_EXPORT double TerrestrialVersionNumber;

//! Project version string for Terrestrial.
FOUNDATION_EXPORT const unsigned char TerrestrialVersionString[];


/*** Helper terrestrial specific macros if you prefer to use macros ***/

#define translated(string) [[Terrestrial sharedInstance] stringForKey:string]

#define translatedPluralString(count,_pluralDict,_contextString) [[Terrestrial sharedInstance] stringForCount:count pluralDict:_pluralDict andContext:_contextString]



@interface Terrestrial : NSObject {
    
    NSArray *retrievedStrings;
    NSString *manualLocale;
    NSArray *appStrings;
    
}



+ (id)sharedInstance;




/*** Runtime string retrieval functions ***/

- (NSString *) stringForKey: (NSString *) stringToTranslate andContext: (NSString *) contextString;

- (NSString *) stringForCount:(float)count pluralDict: (NSDictionary *)pluralDict andContext:(NSString *)contextString;

- (NSString *) appStringForID: (NSString *) idToTranslate;



/*** Helper function to set current language of app at runtime ***/

+ (void) setCurrentLanguageTo: (NSString *) lang;


/*** Property to get current language ***/

@property (strong, nonatomic) NSString *currentLanguageCode;



/*** Pluralisation helper functions ***/

/*

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

*/


@end



