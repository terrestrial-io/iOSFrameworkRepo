//
//  Terrestrial.m
//  Terrestrial
//
//  Created by MrMambwe on 16/09/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import "Terrestrial.h"

static NSString * const trstlZeroRule = @"zero";
static NSString * const trstlOneRule = @"one";
static NSString * const trstlTwoRule = @"two";
static NSString * const trstlFewRule = @"few";
static NSString * const trstlManyRule = @"many";
static NSString * const trstlOtherRule = @"other";

@implementation Terrestrial

+ (id)sharedInstance {
    
    static Terrestrial *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void) loadTranslationFile {
    
    NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
    
    
    if (!appStrings) {
        
        appStrings = [[NSArray alloc] init];
        
        NSString *appStringsPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"BaseStrings.json"]];
        
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:appStringsPath]) {
            
            NSString *jsonString = [[NSString alloc] initWithContentsOfFile:appStringsPath encoding:NSUTF8StringEncoding error:NULL];
            
            NSError *jsonError ;
            
            appStrings = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&jsonError];
            
            
            
        }
        
        
    }
    
    
    NSString* localeToShow;
    
    manualLocale = _currentLanguageCode;
    
    if (!manualLocale ) {
        
        localeToShow = [self getCurrentDeviceLanguage];
        _currentLanguageCode = localeToShow;
        
    } else {
        
        localeToShow = manualLocale;
        
    }
    
    if (!retrievedStrings) {
        
        retrievedStrings = [[NSArray alloc] init];
        
        
        NSString *translationsFolder = [bundlePath stringByAppendingPathComponent:@"Translations"];
        
        NSString *localeFilePath = [translationsFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json",localeToShow]];
        
        
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:localeFilePath]) {
            
            NSString *jsonString = [[NSString alloc] initWithContentsOfFile:localeFilePath encoding:NSUTF8StringEncoding error:NULL];
            
            NSError *jsonError ;
            
            
            retrievedStrings = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&jsonError];
            
            
            
        } else {
            
            
            NSArray *splitLocale = [localeToShow componentsSeparatedByString:@"-"];
            
            
            NSString *localeFilePath2 = [translationsFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json",[splitLocale objectAtIndex:0]]];
            
            
            
            if ([[NSFileManager defaultManager] fileExistsAtPath:localeFilePath2]) {
                
                NSString *jsonString = [[NSString alloc] initWithContentsOfFile:localeFilePath2 encoding:NSUTF8StringEncoding error:NULL];
                
                NSError *jsonError;
                
                
                retrievedStrings = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&jsonError];
                
                
            }
            
            
            
            
            
        }
        
        
        
    }
    
    
    
    
}


- (NSArray *) filterTranslationsArrayWithPredicate:(NSPredicate *) predicate {
    
    return [retrievedStrings filteredArrayUsingPredicate:predicate];
    
}


- (NSString *) stringForKey: (NSString *) stringToTranslate andContext: (NSString *) contextString {
    
    
    [self loadTranslationFile];
    
    
    NSString *type = @"default";
    
    
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"(SELF.string ==[cd] %@) AND (SELF.context ==[cd] %@)",stringToTranslate ,contextString,type];
    
    NSArray* filteredArray = [retrievedStrings filteredArrayUsingPredicate:bPredicate];
    
    
    NSString *translatedString;
    
    
    if ([filteredArray count] > 0 ) {
        
        
        NSDictionary * stringDict = [filteredArray objectAtIndex:0];
        
        translatedString = [stringDict objectForKey:@"translation"];
        
        //NSlog(@"Translated string: %@", translatedString);
        
        
    }
    
    if (translatedString != nil){
        
        return translatedString;
        
    } else {
        
        return stringToTranslate;
        
    }
    
    
    
}

- (NSString *) stringForID: (NSString *) stringToTranslate {
    
    [self loadTranslationFile];
    
    
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"(SELF.id ==[cd] %@)",stringToTranslate];
    
    NSArray* filteredArray = [retrievedStrings filteredArrayUsingPredicate:bPredicate];
    
    NSString *translatedString;
    
    if ([filteredArray count] > 0 ) {
        
        
        NSDictionary * stringDict = [filteredArray objectAtIndex:0];
        
        translatedString = [stringDict objectForKey:@"translation"];
        
        //NSlog(@"Translated string: %@", translatedString);
        
        
    }
    
    if (translatedString != nil){
        
        return translatedString;
        
    } else {
        
        return stringToTranslate;
        
        
        
    }
    
    
}




- (NSString *) appStringForID: (NSString *) idToTranslate {
    
    NSString *returnString = [self stringForID:idToTranslate];
    
    if (appStrings && [returnString isEqualToString:idToTranslate]) {
        
        NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"(SELF.id ==[cd] %@)",idToTranslate];
        
        NSArray* filteredArray = [appStrings filteredArrayUsingPredicate:bPredicate];
        
        if ([filteredArray count] > 0 ) {
            
            returnString = [filteredArray[0] objectForKey:@"string"];
            
        }
        
        
    }
    
    
    
    return returnString;
    
}



- (NSString *) stringForCount:(float)count pluralDict: (NSDictionary *)pluralDict andContext:(NSString *)contextString {
    
    
    
    NSString *languageCode = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    
    NSString *lookupText = [pluralDict objectForKey:trstlOneRule];
    
    NSArray *lookupArray =  trstlLocalizedPluralStringKeyForCountAndSingularNounForLanguage(count, lookupText, languageCode);
    
    
    NSString *stringToTranslate = lookupText;
    
    NSString *pluralKey = [lookupArray objectAtIndex:1];
    
    
    NSString* localeToShow;
    
    manualLocale = _currentLanguageCode;
    
    if (!manualLocale ) {
        
        localeToShow = [self getCurrentDeviceLanguage];
        _currentLanguageCode = localeToShow;
        
    } else {
        
        localeToShow = manualLocale;
        
        
    }
    
    NSString *type = @"plural";
    
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"(SELF.pluralRule ==[cd] %@) AND (SELF.string ==[cd] %@) AND (SELF.context ==[cd] %@) AND (SELF.type == [cd] %@)",pluralKey,stringToTranslate ,contextString,type];
    
    NSArray* filteredArray = [retrievedStrings filteredArrayUsingPredicate:bPredicate];
    
    //NSlog(@"HERE %@",filteredArray);
    
    
    NSString *translatedString;
    
    
    if ([filteredArray count] > 0 ) {
        
        NSDictionary * stringDict = [filteredArray objectAtIndex:0];
        
        translatedString = [stringDict objectForKey:@"translation"];
        
        //NSlog(@"Translated string: %@", translatedString);
        
    }
    
    if (translatedString != nil){
        
        return translatedString;
        
    } else {
        
        return stringToTranslate;
        
    }
    
    
}


-(NSString *) getCurrentDeviceLanguage {
    
    return [[NSLocale preferredLanguages] objectAtIndex:0];
    
}

+ (void) setCurrentLanguageTo: (NSString *) lang {
    
    [[Terrestrial sharedInstance] setCurrentLanguageCode:lang];
    
}




/*** Pluralisation rules ***/


static NSString * trstlArabicPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 0:
            return trstlZeroRule;
        case 1:
            return trstlOneRule;
        case 2:
            return trstlTwoRule;
        default: {
            NSUInteger mod100 = count % 100;
            if (mod100 >= 3 && mod100 <= 10) {
                return trstlFewRule;
            } else if (mod100 >= 11) {
                return trstlManyRule;
            } else {
                return trstlOtherRule;
            }
        }
    }
}

static NSString * trstlSimplifiedChinesePluralRuleForCount(NSUInteger count) {
    return trstlOtherRule;
}

static NSString * trstlTraditionalChinesePluralRuleForCount(NSUInteger count) {
    return trstlOtherRule;
}

static NSString * trstlCatalanPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlCroatianPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;
    NSUInteger mod100 = count % 100;
    
    switch (mod10) {
        case 1:
            switch (mod100) {
                case 11:
                    break;
                default:
                    return trstlOneRule;
            }
        case 2:
        case 3:
        case 4:
            switch (mod100) {
                case 12:
                case 13:
                case 14:
                    break;
                default:
                    return trstlFewRule;
            }
            
            break;
        default:
            break;
    }
    
    return trstlManyRule;
}

static NSString * trstlCzechPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        case 2:
        case 3:
        case 4:
            return trstlFewRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlEnglishPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlFrenchPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 0:
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlGermanPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlDanishPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlDutchPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlFinnishPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlGreekPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlHebrewPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;
    
    switch (count) {
        case 1:
            return trstlOneRule;
        case 2:
            return trstlTwoRule;
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
            break;
        default:
            switch (mod10) {
                case 0:
                    return trstlManyRule;
                default:
                    break;
            }
    }
    
    return trstlOtherRule;
}

static NSString * trstlHungarianPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlIndonesianPluralRuleForCount(NSUInteger count) {
    return trstlOtherRule;
}

static NSString * trstlItalianPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlJapanesePluralRuleForCount(NSUInteger count) {
    return trstlOtherRule;
}

static NSString * trstlKoreanPluralRuleForCount(NSUInteger count) {
    return trstlOtherRule;
}

static NSString * trstlLatvianPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;
    NSUInteger mod100 = count % 100;
    
    if (count == 0) {
        return trstlZeroRule;
    }
    
    if (count == 1) {
        return trstlOneRule;
    }
    
    switch (mod10) {
        case 1:
            if (mod100 != 11) {
                return trstlOneRule;
            }
            break;
        default:
            break;
    }
    
    return trstlManyRule;
}

static NSString * trstlMalayPluralRuleForCount(NSUInteger count) {
    return trstlOtherRule;
}

static NSString * trstlNorwegianBokmalPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlNorwegianNynorskPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlPolishPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;
    NSUInteger mod100 = count % 100;
    
    if (count == 1) {
        return trstlOneRule;
    }
    
    switch (mod10) {
        case 2:
        case 3:
        case 4:
            switch (mod100) {
                case 12:
                case 13:
                case 14:
                    break;
                default:
                    return trstlFewRule;
            }
            
            break;
        default:
            break;
    }
    
    return trstlManyRule;
}

static NSString * trstlPortuguesePluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlRomanianPluralRuleForCount(NSUInteger count) {
    NSUInteger mod100 = count % 100;
    
    switch (count) {
        case 0:
            return trstlFewRule;
        case 1:
            return trstlOneRule;
        default:
            if (mod100 > 1 && mod100 <= 19) {
                return trstlFewRule;
            }
            break;
    }
    
    return trstlOtherRule;
}

static NSString * trstlRussianPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;
    NSUInteger mod100 = count % 100;
    
    switch (mod100) {
        case 11:
        case 12:
        case 13:
        case 14:
            break;
            
        default:
            switch (mod10) {
                case 1:
                    return trstlOneRule;
                case 2:
                case 3:
                case 4:
                    return trstlFewRule;
                default:
                    break;
            }
            
    }
    
    return trstlManyRule;
}

static NSString * trstlSlovakPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        case 2:
        case 3:
        case 4:
            return trstlFewRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlSpanishPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlSwedishPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return trstlOneRule;
        default:
            return trstlOtherRule;
    }
}

static NSString * trstlThaiPluralRuleForCount(NSUInteger count) {
    return trstlOtherRule;
}

static NSString * trstlTurkishPluralRuleForCount(NSUInteger count) {
    return trstlOtherRule;
}

static NSString * trstlUkrainianPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;
    NSUInteger mod100 = count % 100;
    
    switch (mod100) {
        case 11:
        case 12:
        case 13:
        case 14:
            break;
            
        default:
            switch (mod10) {
                case 1:
                    return trstlOneRule;
                case 2:
                case 3:
                case 4:
                    return trstlFewRule;
                default:
                    break;
            }
            
    }
    
    return trstlManyRule;
}

static NSString * trstlVietnamesePluralRuleForCount(NSUInteger count) {
    return trstlOtherRule;
}


NSArray * trstlLocalizedPluralStringKeyForCountAndSingularNounForLanguage(NSUInteger count, NSString *singular, NSString *languageCode) {
    
    NSString *pluralRule = nil;
    
    // Because -hasPrefix is being used here, any three-letter ISO 639-2/3 codes must come before two-letter ISO 639-1 codes in order to prevent, for instance, Konkani (kok) from having Korean (ko) pluralization applied
    if ([languageCode hasPrefix:@"ar"]) {
        pluralRule = trstlArabicPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ca"]) {
        pluralRule = trstlCatalanPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"zh-Hans"]) {
        pluralRule = trstlSimplifiedChinesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"zh-Hant"]) {
        pluralRule = trstlTraditionalChinesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"cr"]) {
        pluralRule = trstlCroatianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"cs"]) {
        pluralRule = trstlCzechPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"da"]) {
        pluralRule = trstlDanishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"nl"]) {
        pluralRule = trstlDutchPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"en"]) {
        pluralRule = trstlEnglishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"fr"]) {
        pluralRule = trstlFrenchPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"de"]) {
        pluralRule = trstlGermanPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"fi"]) {
        pluralRule = trstlFinnishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"el"]) {
        pluralRule = trstlGreekPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"he"]) {
        pluralRule = trstlHebrewPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"hu"]) {
        pluralRule = trstlHungarianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"id"]) {
        pluralRule = trstlIndonesianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"it"]) {
        pluralRule = trstlItalianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ja"]) {
        pluralRule = trstlJapanesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ko"]) {
        pluralRule = trstlKoreanPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"lv"]) {
        pluralRule = trstlLatvianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ms"]) {
        pluralRule = trstlMalayPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"nb"]) {
        pluralRule = trstlNorwegianBokmalPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"nn"]) {
        pluralRule = trstlNorwegianNynorskPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"pl"]) {
        pluralRule = trstlPolishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"pt"]) {
        pluralRule = trstlPortuguesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ro"]) {
        pluralRule = trstlRomanianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ru"]) {
        pluralRule = trstlRussianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"es"]) {
        pluralRule = trstlSpanishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"sk"]) {
        pluralRule = trstlSlovakPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"sv"]) {
        pluralRule = trstlSwedishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"th"]) {
        pluralRule = trstlThaiPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"tr"]) {
        pluralRule = trstlTurkishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"uk"]) {
        pluralRule = trstlUkrainianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"vi"]) {
        pluralRule = trstlVietnamesePluralRuleForCount(count);
    } else {
        
        //NSlog(@"Unsupported language: %@", languageCode);
        return nil;
        
    }
    
    
    
    //return [NSString stringWithFormat:@"%%d %@ (plural rule: %@)", singular, pluralRule];
    
    return [[NSArray alloc] initWithObjects:singular,pluralRule, nil];
    
}

/*

- (void) testPluralFunction {
    
    
    NSString *string = translatedPluralString(5,
                                              (@{@"zero": @"There are no offers left.",
                                                 @"one":@"There is only one offer left",
                                                 @"other":@"There are %d coins left" }),
                                              @"This shows the number of discount offers");
    
    int offerNumber = 20;
    
    //[Terrestrial pluralStringWithCount:offerNumber zero:@"There are no offers left" one:@"There is only one offer left" other:@"There are %%d offers left" context:@"This is the offer"];
    
    NSString *pluralString = [Terrestrial pluralStringWithCount:offerNumber
                                                             id:@"offer_plural"
                                                          zero :@"There are no offers left"
                                                           one :@"There is only one offer left"
                                                          other:@"There are %d offers left"
                                                        context:@"This is my context"];
    
    
}
 
 */



- (NSString *) retrievePluralRuleForCount: (NSUInteger) count andLanguageCode: (NSString *)languageCode {
    
    NSString *pluralRule = nil;
    
    // Because -hasPrefix is being used here, any three-letter ISO 639-2/3 codes must come before two-letter ISO 639-1 codes in order to prevent, for instance, Konkani (kok) from having Korean (ko) pluralization applied
    
    if ([languageCode hasPrefix:@"ar"]) {
        pluralRule = trstlArabicPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ca"]) {
        pluralRule = trstlCatalanPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"zh-Hans"]) {
        pluralRule = trstlSimplifiedChinesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"zh-Hant"]) {
        pluralRule = trstlTraditionalChinesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"cr"]) {
        pluralRule = trstlCroatianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"cs"]) {
        pluralRule = trstlCzechPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"da"]) {
        pluralRule = trstlDanishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"nl"]) {
        pluralRule = trstlDutchPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"en"]) {
        pluralRule = trstlEnglishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"fr"]) {
        pluralRule = trstlFrenchPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"de"]) {
        pluralRule = trstlGermanPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"fi"]) {
        pluralRule = trstlFinnishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"el"]) {
        pluralRule = trstlGreekPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"he"]) {
        pluralRule = trstlHebrewPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"hu"]) {
        pluralRule = trstlHungarianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"id"]) {
        pluralRule = trstlIndonesianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"it"]) {
        pluralRule = trstlItalianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ja"]) {
        pluralRule = trstlJapanesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ko"]) {
        pluralRule = trstlKoreanPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"lv"]) {
        pluralRule = trstlLatvianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ms"]) {
        pluralRule = trstlMalayPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"nb"]) {
        pluralRule = trstlNorwegianBokmalPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"nn"]) {
        pluralRule = trstlNorwegianNynorskPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"pl"]) {
        pluralRule = trstlPolishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"pt"]) {
        pluralRule = trstlPortuguesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ro"]) {
        pluralRule = trstlRomanianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ru"]) {
        pluralRule = trstlRussianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"es"]) {
        pluralRule = trstlSpanishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"sk"]) {
        pluralRule = trstlSlovakPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"sv"]) {
        pluralRule = trstlSwedishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"th"]) {
        pluralRule = trstlThaiPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"tr"]) {
        pluralRule = trstlTurkishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"uk"]) {
        pluralRule = trstlUkrainianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"vi"]) {
        pluralRule = trstlVietnamesePluralRuleForCount(count);
    } else {
        
        NSLog(@"Unsupported language for pluralisation : %@", languageCode);
        return nil;
        
    }
    
    return pluralRule;
    
}


+ (NSString *) pluralStringWithCount: (int)count
                                  id:(NSString *)idString
                                 one:(NSString *)oneString
                               other:(NSString *)otherString
                             context: (NSString *) contextString {
    
    
    
    NSString *translatedString = [[Terrestrial sharedInstance] pluralStringLookupWithId: idString andCount:count];
    
    
    
    if (translatedString != nil) {
        
        return translatedString;
        
    } else {
        
        
        if (count == 1) {
            
            return  [NSString stringWithFormat:oneString,count];
            
        } else {
            
            return [NSString stringWithFormat:otherString,count];;
            
        }
        
        
    }
    
    
}


- (NSString *) pluralStringLookupWithId:(NSString *)idString andCount:(int) count {
    
    [self loadTranslationFile];
    
    // Retrieve pluralisation rule from count & language code
    NSString *languageCode = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    
    //NSLog(@"BOOM 1");
    
    NSString *retrievedRule = [[Terrestrial sharedInstance] retrievePluralRuleForCount:count andLanguageCode:languageCode];
    //NSLog(@"BOOM 2");
    
    
    if (retrievedRule) {
        
        //NSLog(@"BOOM 3");
        // Perform lookup using plural id
        
        NSString *type = @"plural_string";
        
        NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"(SELF.plural_string.id ==[cd] %@) AND (SELF.type ==[cd] %@)",idString ,type];
        
        
        NSArray* filteredArray = [[Terrestrial sharedInstance] filterTranslationsArrayWithPredicate:bPredicate];
        
        //NSLog(@"BOOM 4");
        
        NSString *translatedString;
        NSDictionary *translatedObject;
        
        
        if ([filteredArray count] > 0 ) {
            
            
            NSDictionary * stringDict = [filteredArray objectAtIndex:0];
            
            translatedObject = [stringDict objectForKey:@"translation"];
            
            translatedString = [translatedObject objectForKey:retrievedRule];
        }
        
        
        
        //NSLog(@"BOOM 5");
        if(translatedString) { return [NSString stringWithFormat:translatedString,count];};
        
        //NSLog(@"BOOM 6");
        
        return nil;
        
    } else {
        
        return nil;
        
    }
    
    
}









@end
