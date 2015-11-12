//
//  Terrestrial.m
//  Terrestrial
//
//  Created by MrMambwe on 16/09/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import "Terrestrial.h"

@implementation Terrestrial

+ (id)sharedInstance {
    
    static Terrestrial *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}



- (NSString *) stringForKey: (NSString *) stringToTranslate andContext: (NSString *) contextString {
    
    NSString* localeToShow;
    
    
    NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
    
  
    
    
    if (!manualLocale ) {
        
        localeToShow = [self getCurrentDeviceLanguage];
    } else {
        
        localeToShow = manualLocale;
        
    }
    
    
    
    //NSlog(@"Locale to show: %@",localeToShow);
    
    
    
    
    if (!retrievedStrings) {
        
        retrievedStrings = [[NSArray alloc] init];
    
       
        
        
        
        NSString *translationsFolder = [bundlePath stringByAppendingPathComponent:@"Translations"];
        
        NSString *localeFilePath = [translationsFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json",localeToShow]];
        
        //NSlog(@"File to get: %@",localeFilePath);
        
        
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:localeFilePath]) {
    
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:localeFilePath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *jsonError;
    
    
    retrievedStrings = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&jsonError];
            
        }
        
   
    }
    
    ////NSlog(@"RETRIEVED STRINGS %@",retrievedStrings);
    
    NSString *type = @"default";
    
    
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"(SELF.string ==[cd] %@) AND (SELF.context ==[cd] %@) AND (SELF.type == [cd] %@)",stringToTranslate ,contextString,type];
    
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
    
    
    
    //[NSString stringWithFormat:[@"Hello: %@ , how are you?" translatedWithContext:@""], translatedString];
    
}

- (NSString *) stringForCount:(float)count pluralDict: (NSDictionary *)pluralDict andContext:(NSString *)contextString {
    

    
    NSString *languageCode = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    
    NSString *lookupText = [pluralDict objectForKey:trstlOneRule];

    NSArray *lookupArray =  trstlLocalizedPluralStringKeyForCountAndSingularNounForLanguage(count, lookupText, languageCode);
    
    
    NSString *stringToTranslate = lookupText;
    
    NSString *pluralKey = [lookupArray objectAtIndex:1];
    
    
    NSString* localeToShow;

    
    if (!manualLocale ) {
        
        localeToShow = [self getCurrentDeviceLanguage];
    } else {
        
        localeToShow = manualLocale;
        
    }
    
    
    NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
    
    NSString *translationsFolder = [bundlePath stringByAppendingPathComponent:@"Translations"];

    
    if (!retrievedStrings) {
        
        retrievedStrings = [[NSArray alloc] init];
        
        
        
        
        
        NSString *translationsFolder = [bundlePath stringByAppendingPathComponent:@"Translations"];
        
        NSString *localeFilePath = [translationsFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json",localeToShow]];
        
        
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:localeFilePath]) {
            
            NSString *jsonString = [[NSString alloc] initWithContentsOfFile:localeFilePath encoding:NSUTF8StringEncoding error:NULL];
            
            NSError *jsonError;
            
            
            retrievedStrings = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&jsonError];
            
        }
        
        
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

- (void) setCurrentLanguageTo: (NSString *) lang {
    
    manualLocale = lang;
    
}



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

/*

NSString * trstlLocalizedPluralStringKeyForCountAndSingularNoun(NSUInteger count, NSString *singular) {
    NSString *languageCode = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    return trstlLocalizedPluralStringKeyForCountAndSingularNounForLanguage(count, singular, languageCode);
}
 
*/

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


+ (NSDictionary *) dictionaryWithContentsOfPlist:(NSString *)filePath {
    
    
    NSError *error;
    NSString *fileString =  [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    
    
    NSMutableArray * plistArray = (NSMutableArray *)[fileString componentsSeparatedByString:@"\n"];
    
    
    //NSlog(@"Plist Array: %@", plistArray);
    
    
    
    for (int i = 0; i < [plistArray count]; i++) {
        
        
        NSMutableString *searchedString = [plistArray objectAtIndex:i];
        NSError* error = nil;
        
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"(<string.*>)(.*?)</string>" options:0 error:&error];
       
        NSArray* matches = [regex matchesInString:searchedString options:0 range:NSMakeRange(0, [searchedString length])];
        
        
        for ( NSTextCheckingResult* match in matches )
        {
          
            NSString* matchText = [searchedString substringWithRange:[match range]];
            
            //NSlog(@"match: %@", matchText);
            
            //NSString *newString = [regex2 stringByReplacingMatchesInString:matchText options:0 range:NSMakeRange(0, [matchText length]) withTemplate:[[Terrestrial sharedInstance] stringForKey:stringToTranslate andContext:@""]];
            
           
            
            //NSString *newString = [regex2 stringByReplacingMatchesInString:matchText options:0 range:NSMakeRange(0, [matchText length]) withTemplate:[[Terrestrial sharedInstance] stringForKey:stringToTranslate andContext:@""]];
            
            NSRange matchRange = [match rangeAtIndex:2];
            
            NSString *stringToTranslate = [searchedString substringWithRange:matchRange];
            
            
            
            
            NSRegularExpression* regex2 = [NSRegularExpression regularExpressionWithPattern:@" terrestrialContext=\"(.*[^\"])\"" options:0 error:&error];
            
            
            NSString *firstGroupCaptured = [searchedString substringWithRange:[match rangeAtIndex:1]];
            
            NSTextCheckingResult *contextMatch = [regex2 firstMatchInString:firstGroupCaptured options:0 range:NSMakeRange(0, [firstGroupCaptured length])];
            
            NSRange contextMatchRange = [contextMatch rangeAtIndex:1];
            
            NSString *contextInfoString = [firstGroupCaptured substringWithRange:contextMatchRange];
            

        
            //NSlog(@"STRING TO TRANSLATE: %@", stringToTranslate);
            //NSlog(@"CONTEXT INFO STRING: %@", contextInfoString);
            
       
        
        }
        
        
        /*
        
        // Pull out string tags
        
        NSString *stringTagRegexp = @"(<string.*>).*?(</string>)";
        
   
        
        NSString *newString = [regex stringByReplacingMatchesInString:oldString options:0 range:NSMakeRange(0, [oldString length]) withTemplate:@”21st December”];

        
        //NSString *someRegexp = @"terrestrialContext=\".* +[^\"]+\"";
        
        NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", someRegexp];
        
        NSString *fileLine = [plistArray objectAtIndex:i];
        
        if ([myTest evaluateWithObject: fileLine]){
           
            
    
            
        }
         
         */
        
        
    }
    
    
    NSData* data = [fileString dataUsingEncoding:NSUTF8StringEncoding];
    
    //NSlog(@"FILE STRING: %@", fileString);
    
    NSDictionary *plistFile = [NSPropertyListSerialization propertyListWithData:data
                                                          options:0
                                                           format:NULL
                                                            error:&error];
    
    
    return plistFile;
}




@end
