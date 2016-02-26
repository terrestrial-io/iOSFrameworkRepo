//
//  UILabel+TerrestrialLabel.m
//  StoryboardTest
//
//  Created by MrMambwe on 10/11/2015.
//  Copyright © 2015 Terrestrial. All rights reserved.
//

#import "TerrestrialUICategoryAdditions.h"
#import <Terrestrial/Terrestrial.h>
#import <objc/runtime.h>



@implementation UILabel (TerrestrialLabel)

@dynamic Identifier;
@dynamic Terrestrial;


- (void)setComment:(NSString *)comment {
    
    
}

- (void)setIdentifier:(NSString *)theID {
    
        [self setText:theID.translated];
    
}

- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setText:self.text.translated];
        
    }
    
}


@end

@implementation UIButton (TerrestrialButton)

@dynamic Identifier;
@dynamic Terrestrial;

- (void)setIdentifier:(NSString *)theID {
    
    [self setTitle:theID.translated forState:UIControlStateNormal];
    
}

- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setTitle:self.titleLabel.text.translated forState:UIControlStateNormal];
        
    }
    
}


@end

@implementation UITextField (TerrestrialTextField)

@dynamic Identifier;
@dynamic Terrestrial;


- (void)setIdentifier:(NSString *)theID {
    
    [self setText:theID.translated];
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setText:self.text.translated];
        [self setPlaceholder:self.placeholder.translated];
        
    }
    
}



@end


@implementation UITextView (TerrestrialTextField)


- (void)setIdentifier:(NSString *)theID {
    
    [self setText:theID.translated];
    
}


- (void)setComment:(NSString *)comment {
    
    if (![comment isEqualToString:@""]) {
        
       // [self setText:[self.text translatedWithContext:comment]];
        
    }
    
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setText:self.text.translated];
        
    }
    
}



@end


@implementation UIBarButtonItem (TerrestrialBarButtonItem)


@dynamic Identifier;
@dynamic Terrestrial;

- (void)setIdentifier:(NSString *)theID {
    
    [self setTitle:theID.translated];
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setTitle:self.title.translated];
        
    }
    
}


@end

@implementation UINavigationItem (TerrestrialNavigationItem)

@dynamic Identifier;
@dynamic Terrestrial;

- (void)setIdentifier:(NSString *)theID {
    
    [self setTitle:theID.translated];
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setTitle:self.title.translated];
        [self setPrompt:self.prompt.translated];
        
    }
    
}

@end


@implementation UIViewController (TerrestrialViewController)

@dynamic Identifier;
@dynamic Terrestrial;

- (void)setIdentifier:(NSString *)theID {
    
    [self setTitle:theID.translated];
    
}


- (void)setTerrestrial:(BOOL)Terrestrial {
    
    if (Terrestrial == true) {
        
        [self setTitle:self.title.translated];
        
    }
    
}

@end
