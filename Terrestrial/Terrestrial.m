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
    
    
    NSString *translationsFolder = [bundlePath stringByAppendingPathComponent:@"Translations"];
    
    NSString *langFilePath = [translationsFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"_lang"]];
    
    
     if ([[NSFileManager defaultManager] fileExistsAtPath:langFilePath]) {
         
         NSLog(@"Lang file exists!");
         
          NSString *localeString = [[NSString alloc] initWithContentsOfFile:langFilePath encoding:NSUTF8StringEncoding error:NULL];
         
         localeString = [localeString stringByReplacingOccurrencesOfString:@" " withString:@""];
         localeString = [localeString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
         manualLocale = localeString;
         
         
     }
    
    
    
    if (!manualLocale ) {
        
        localeToShow = [self getCurrentDeviceLanguage];
    } else {
        
        localeToShow = manualLocale;
        
    }
    
    
    
    
    NSLog(@"Locale to show: %@",localeToShow);
    
    
    
    
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
    
    
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"(SELF.string ==[cd] %@) AND (SELF.context ==[cd] %@)",stringToTranslate ,contextString];
    
   NSArray* filteredArray = [retrievedStrings filteredArrayUsingPredicate:bPredicate];

   NSLog(@"HERE %@",filteredArray);

    
    NSString *translatedString;

    
    if ([filteredArray count] > 0 ) {
        
        
        NSDictionary * stringDict = [filteredArray objectAtIndex:0];
        
        translatedString = [stringDict objectForKey:@"translation"];
        
        NSLog(@"Translated string: %@", translatedString);
        
       
    }
    
    if (translatedString != nil){
    return translatedString;
    } else {
    return stringToTranslate;
    }
    
    
    
    //[NSString stringWithFormat:[@"Hello: %@ , how are you?" translatedWithContext:@""], translatedString];
    
}


-(NSString *) getCurrentDeviceLanguage {
    
    return [[NSLocale preferredLanguages] objectAtIndex:0];
    
}

- (void) setCurrentLanguageTo: (NSString *) lang {
    
    manualLocale = lang;
    
}





@end
