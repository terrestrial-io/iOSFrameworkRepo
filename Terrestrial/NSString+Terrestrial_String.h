//
//  NSString+Terrestrial_String.h
//  TestTranslatorApp
//
//  Created by MrMambwe on 30/09/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Terrestrial_String)


@property (nonatomic, copy, readonly) NSString *translated;
@property (nonatomic, copy, readonly) NSString *translatedID;

- (NSString *)translatedWithContext: (NSString *) context;
- (NSString *)dontTranslate;


@property (strong, nonatomic) NSString *terrestrialContextInfo;


@end
