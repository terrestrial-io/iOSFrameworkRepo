//
//  UIViewController+TerrestrialAddition.m
//  Terrestrial
//
//  Created by MrMambwe on 04/10/2015.
//  Copyright (c) 2015 Terrestrial. All rights reserved.
//

#import "UIViewController+TerrestrialAddition.h"
#import "Terrestrial.h"
#import "CameraView.h"
#import "SubviewsHelper.h"

static NSString *const kPARSE_APPLICATION_ID = @"jLfE0cKCiFf1HOVU1WkMTgP83oinMvoTrBZahWHC";
static NSString *const kREST_API_KEY = @"Sx5lodmrgVxST6Pse8V4Hkp5kff0jNMCjAaIDZAr";


@implementation UIViewController (TerrestrialAddition)

- (void)viewDidAppear:(BOOL)animated {
    
    
    NSLog(@"View did appear");
    
  
if ([[NSUserDefaults standardUserDefaults] valueForKey:@"TerrestrialScreenShotMode"] && ![[UIApplication sharedApplication].keyWindow viewWithTag:73636129]) {
    
    
         
    NSLog(@"Screenshot mode!");
    
    float padding = 20.0;
    float width = 60.0;
    float height = width;
    float borderRadius = width/2;
    
    
    UIButton *cameraButton = [[UIButton alloc] initWithFrame:CGRectMake([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width - width - padding, ([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height/2)- (height/2), width, height)];
    
    
    
    cameraButton.layer.cornerRadius = borderRadius;
    
    cameraButton.tag = 73636129;
    
    cameraButton.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:188.0/255.0 blue:156.0/255.0 alpha:1];
    
    
    
    CameraView *cameraIcon = [[CameraView alloc] initWithFrame:CGRectMake(0, 0, cameraButton.frame.size.width, cameraButton.frame.size.height)];
    
    cameraIcon.backgroundColor = [UIColor clearColor];
    
    cameraIcon.layer.cornerRadius = cameraButton.frame.size.width/2;
    
    [cameraButton addSubview:cameraIcon];
    
     //cameraIcon.userInteractionEnabled = NO;
    
    
    if ((![[UIApplication sharedApplication].keyWindow viewWithTag:73636129] && self.view.superview == [UIApplication sharedApplication].keyWindow )) {
            
        [[UIApplication sharedApplication].keyWindow addSubview:cameraButton];
        
        UIView *overlay = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.rootViewController.view.frame];
        
        overlay.backgroundColor = [UIColor colorWithWhite:0 alpha:0.9];
        
        overlay.tag = 3267674;
        
        overlay.alpha = 0;
        
        overlay.userInteractionEnabled = NO;
        
        [[UIApplication sharedApplication].keyWindow addSubview:overlay];

            
        //NSLog(@"Adding screenshot button");
            
        }
    
    
    
    
    [cameraButton addTarget:self action:@selector(takeScreenshot:) forControlEvents:UIControlEventTouchUpInside];
    
    //[[UIApplication sharedApplication].keyWindow layoutSubviews];
    

    
    cameraButton.userInteractionEnabled= TRUE;
    
    
    
      //[self.view bringSubviewToFront:cameraButton];
    
    //[self takeScreenshot:(UIButton *)[[UIApplication sharedApplication].keyWindow viewWithTag:73636129]];
    
    
         }
    
    
    
   
    
    
    
}


- (void) handleGesture: (UITapGestureRecognizer *) gest {
    
    NSLog(@"BINGOOO");
    
}



- (void) recieveScreenshotNotification:(NSNotification *)note  {
    
   
    //[self takeScreenshot:(UIButton *)[[UIApplication sharedApplication].keyWindow viewWithTag:73636129]];
    
    
}


- (void) viewWillDisappear:(BOOL)animated {
    
    
    
    if (([[UIApplication sharedApplication].keyWindow viewWithTag:73636129] && self.view.superview == [UIApplication sharedApplication].keyWindow )) {
    
    [[[UIApplication sharedApplication].keyWindow viewWithTag:73636129] removeFromSuperview];
    
        
    }
    
    
    
}



- (void) takeScreenshot:(UIButton *)button {
    
    
    NSLog(@"Taking screenshot");
    
    UIView *greenBackground = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.rootViewController.view.frame];
    
    greenBackground.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:188.0/255.0 blue:156.0/255.0 alpha:1];
    
    [[UIApplication sharedApplication].keyWindow addSubview:greenBackground];
    
    greenBackground.transform = CGAffineTransformMakeTranslation(0, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height);
    
    [[[UIApplication sharedApplication].keyWindow viewWithTag:73636129] setAlpha:0];
    
    
    [self getAllSubviews];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss-SSS"];
    
    NSString *formattedDateString = [dateFormatter stringFromDate:[NSDate date]];
    
    NSString *screenshotID = [NSString stringWithFormat:@"screenshot-%@",formattedDateString];
    
    NSMutableArray *elementsPresentOnScreen = [self traverseTextSubviewsWithScreenshotID:screenshotID];
    
    
    UIImage *blankScreenshot = [self imageFromView:[UIApplication sharedApplication].keyWindow];
    
    //NSData *imageData = UIImagePNGRepresentation(blankScreenshot);
    
    
    
    
    
    
    for (int i = 0; i <[[[SubviewsHelper sharedInstance] hiddenSubviewsArray] count] ; i ++ ) {
        
        
        UIView *subview = [[[[SubviewsHelper sharedInstance] hiddenSubviewsArray] objectAtIndex:i] objectAtIndex:0];
        
        [(UILabel *)subview setText:[[[[SubviewsHelper sharedInstance] hiddenSubviewsArray] objectAtIndex:i] objectAtIndex:1]];
            
        
        
        
    }

    UIImage *screenshot = [self imageFromView:[UIApplication sharedApplication].keyWindow];
    


    UILabel *progressDescription = [[UILabel alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height -100 + 20, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width, 50)];

    progressDescription.textColor = [UIColor whiteColor];
    
    progressDescription.textAlignment = NSTextAlignmentCenter;
    
    [progressDescription setText:@"Detecting translated strings..."];
    
    progressDescription.alpha = 1.0;
    
    progressDescription.transform = CGAffineTransformMakeTranslation(0, 150);
    
    [[UIApplication sharedApplication].keyWindow addSubview:progressDescription];
    
    
    
    UILabel *terrestrialTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width, 50)];
    
    terrestrialTitle.textColor = [UIColor whiteColor];
    
    terrestrialTitle.textAlignment = NSTextAlignmentCenter;
    
    [terrestrialTitle setText:@"TERRESTRIAL"];
    
    terrestrialTitle.alpha = 1.0;
    
    terrestrialTitle.transform = CGAffineTransformMakeTranslation(0, -150);
    
     terrestrialTitle.font =  [UIFont fontWithName:@"Avenir-Black" size:12];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:terrestrialTitle.text];
    [attributedString addAttribute:NSKernAttributeName
                             value:@(10)
                             range:NSMakeRange(0, 10)];
    
    terrestrialTitle.attributedText = attributedString;
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:terrestrialTitle];
    
    
    
    UIImageView *miniSreenshotView =[[UIImageView alloc] initWithImage:screenshot];
    

    
    
    [[UIApplication sharedApplication].keyWindow addSubview:miniSreenshotView];
    
    miniSreenshotView.alpha = 0;
    
    miniSreenshotView.layer.cornerRadius = 5.0;
    
    [UIView animateWithDuration:0.4 delay:0.3 usingSpringWithDamping:1.0 initialSpringVelocity:30 options:0 animations:^{
        
        progressDescription.transform = CGAffineTransformMakeTranslation(0, 0);
        terrestrialTitle.transform = CGAffineTransformMakeTranslation(0, 0);
        
        
        
        
    } completion:^(BOOL finished) {

        
    }];
    

    
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:30 options:0 animations:^{
        
        //button.transform = CGAffineTransformMakeTranslation(- (button.frame.origin.x-([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width/2)) - (button.frame.size.width/2), 0);
        
        
        [[[UIApplication sharedApplication].keyWindow viewWithTag:3267674] setAlpha: 1.0];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController.view setAlpha: 0];
        
        miniSreenshotView.transform =CGAffineTransformMakeScale(0.75, 0.75);
        miniSreenshotView.alpha = 1.0;

        
        progressDescription.transform = CGAffineTransformMakeTranslation(0, 0);
        
    } completion:^(BOOL finished) {
        
        
        

    
   
        
        
        
        
        
        //elementsPresentOnScreen = [[SubviewsHelper sharedInstance] subviewsArray];
    
          
        //NSLog(@"SHOT! %@",elementsPresentOnScreen);
        
        
        int it = 0;
        
        for (id element in elementsPresentOnScreen ) {
            
            if ([element respondsToSelector:@selector(text)]) {
                
            UIView * highlightView =[[UIView alloc] initWithFrame:[[element superview] convertRect:[element frame] toView:[UIApplication sharedApplication].keyWindow.rootViewController.view]];
        
            highlightView.backgroundColor =  [UIColor colorWithRed:26.0/255.0 green:188.0/255.0 blue:156.0/255.0 alpha:0.5];
            
            highlightView.layer.cornerRadius = 2.5;
            
            highlightView.alpha = 0;
        
            [miniSreenshotView addSubview:highlightView];
            
            [UIView animateWithDuration:0.1 delay:0 + (0.1 * it) options:0  animations:^{
                
                
                highlightView.alpha = 1.0;
                
                
                
            } completion:^(BOOL finished) {
                
           
    
            }];
            
            it++;
                
            }
            
    
       
        }
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionLayoutSubviews  animations:^{
                
                
                greenBackground.transform = CGAffineTransformMakeTranslation(0, 0);
                
                [progressDescription setText:@"Connecting to mission control..."];
                
                
            } completion:^(BOOL finished) {
                
                
            }];
            
            
            [self uploadScreeenshotToParse:blankScreenshot withScreenshotID:screenshotID andDetectedStrings: [[SubviewsHelper sharedInstance] detectedStringsArray] andResponse:^(NSURLResponse *serviceResponse, id receivedData, NSError *error) {
                
                
               
                
                if (!error) {
                    
                    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionLayoutSubviews  animations:^{
                        
                        
                        greenBackground.transform = CGAffineTransformMakeTranslation(0, 0);
                        
                        
                        
                        
                    } completion:^(BOOL finished) {
                        
                        
                        [progressDescription setText:@"Upload Completed!"];
                        
                        miniSreenshotView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                        
                        UIImageView *copy = [[UIImageView alloc] initWithImage:[self imageFromView:miniSreenshotView]];
                        
                        [[UIApplication sharedApplication].keyWindow addSubview:copy];
                        
                        
                        miniSreenshotView.alpha = 0;
                        
                        
                        
                        copy.frame = CGRectMake(([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width - copy.frame.size.width*0.75)/2, ([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height - copy.frame.size.height*0.75)/2, copy.frame.size.width*0.75, copy.frame.size.height*0.75);
                        
                        
                        
                        
                        [UIView animateWithDuration:1.0 delay:0.3 options:UIViewAnimationOptionLayoutSubviews animations:^{
                            
                            
                            CGAffineTransform scale = CGAffineTransformMakeScale(0.75, 0.75);
                            // Move to the left
                            CGAffineTransform translate = CGAffineTransformMakeTranslation(0, -[UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height);
                            // Apply them to a view
                            copy.transform = translate;
                            
                            greenBackground.transform = CGAffineTransformMakeTranslation(0, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height);
                            
                            
                            
                            [[[UIApplication sharedApplication].keyWindow viewWithTag:3267674] setAlpha: 0.0];
                            
                            [[UIApplication sharedApplication].keyWindow.rootViewController.view setAlpha: 1.0];
                            
                            progressDescription.alpha = 0.0;
                            terrestrialTitle.alpha = 0.0;
                            
                            [[UIApplication sharedApplication].keyWindow viewWithTag:73636129].alpha = 1.0;
                            
                            
                            
                            
                        } completion:^(BOOL finished) {
                            
                            
                            [progressDescription removeFromSuperview];
                            [greenBackground removeFromSuperview];
                            [terrestrialTitle removeFromSuperview ];
                            [miniSreenshotView removeFromSuperview ];
                            //[[[UIApplication sharedApplication].keyWindow viewWithTag:3267674] removeFromSuperview];
                            
                            
                            
                        }];
                        
                    }];
                    
                } else {
                    
                    
                    
                    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionLayoutSubviews  animations:^{
                        
                        
                        greenBackground.transform = CGAffineTransformMakeTranslation(0, 0);
                        greenBackground.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0.2 alpha:1];
                        
                        
                        
                        
                    } completion:^(BOOL finished) {
                        
                        
                        [progressDescription setText:@"Error, try again."];
                        
                        miniSreenshotView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                        
                        UIImageView *copy = [[UIImageView alloc] initWithImage:[self imageFromView:miniSreenshotView]];
                        
                        [[UIApplication sharedApplication].keyWindow addSubview:copy];
                        
                        
                        miniSreenshotView.alpha = 0;
                        
                
                        
                        copy.frame = CGRectMake(([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width - copy.frame.size.width*0.75)/2, ([UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height - copy.frame.size.height*0.75)/2, copy.frame.size.width*0.75, copy.frame.size.height*0.75);
                        
                        
                        
                        
                        [UIView animateWithDuration:1.0 delay:0.3 options:UIViewAnimationOptionLayoutSubviews animations:^{
                            
                            
                            //CGAffineTransform scale = CGAffineTransformMakeScale(0.75, 0.75);
                            // Move to the left
                            CGAffineTransform translate = CGAffineTransformMakeTranslation(0, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height);
                            // Apply them to a view
                            copy.transform = translate;
                            
                            greenBackground.transform = CGAffineTransformMakeTranslation(0, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height);
                            
                            
                            
                            button.alpha = 1.0;
                            
                            
                            [[[UIApplication sharedApplication].keyWindow viewWithTag:3267674] setAlpha: 0.0];
                            
                             [[UIApplication sharedApplication].keyWindow.rootViewController.view setAlpha: 1.0];
                            
                            progressDescription.alpha = 0.0;
                            terrestrialTitle.alpha = 0.0;
                            
                            
                            
                            
                        } completion:^(BOOL finished) {
                            
                            
                            [progressDescription removeFromSuperview];
                            [greenBackground removeFromSuperview];
                            [terrestrialTitle removeFromSuperview ];
                            [miniSreenshotView removeFromSuperview ];
                            
                            
                            
                        }];
                        
                        
                        
                        
                        
                        
                        
                    }];
                    
                    
                    
                    
                    
                }
                
            }];
            
            
        });
        

        
        
         }];
    
    
    
    
    

    
    
}

- (UIImage *)imageFromView:(UIView *) view
{
    
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(view.frame.size);
    }
    [view.layer renderInContext: UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
    
}

- (void) getAllSubviews {
    
    [[SubviewsHelper sharedInstance] setSubviewsArray:[[NSMutableArray alloc] init]];
    
    [self listSubviewsOfView:[UIApplication sharedApplication].keyWindow];
    
    
    
}

- (void)listSubviewsOfView:(UIView *)view {
    
    // Get the subviews of the view
    NSArray *subviews = [view subviews];
    
    
    
    // Return if there are no subviews
    if ([subviews count] == 0) return; // COUNT CHECK LINE
    
    for (UIView *subview in subviews) {
        
        // Do what you want to do with the subview
       // //NSLog(@"%@", subview);
        
        [[[SubviewsHelper sharedInstance] subviewsArray] addObject:subview];
        
        // List the subviews of subview
        [self listSubviewsOfView:subview];
        
    }
}

- (NSMutableArray *)traverseTextSubviewsWithScreenshotID: (NSString *)screenshotID {
    
    
    NSMutableArray *scannedStrings = [[Terrestrial sharedInstance] scannedStrings];
    
    NSMutableArray *elementsPresentOnScreen = [[NSMutableArray alloc] init];
    
    NSMutableArray *detectedStringsArray = [[NSMutableArray alloc] init];
    
    //NSLog(@"Scanned! %@",scannedStrings);
    
    
    [[SubviewsHelper sharedInstance] setHiddenSubviewsArray:[[NSMutableArray alloc] init]];
    
    
    //NSLog(@"SUBVIEWS ARRAY: %@",[[SubviewsHelper sharedInstance] subviewsArray]);
    
    
    
    for (id element in [[SubviewsHelper sharedInstance] subviewsArray]) {
        
        if ([element respondsToSelector:@selector(text)]) {
            
            //NSLog(@"CLASS :%@", NSStringFromClass([element class]));
            
            for (NSDictionary *stringDict in scannedStrings ) {
                
                
                NSPredicate *equalityTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", [stringDict objectForKey:@"string"]];
                
                if ([equalityTest evaluateWithObject:[element text]]){
                    
                    
                    //NSLog(@"MY ELEMENT CLASS: %@", NSStringFromClass([element class]));
                    
                    
                    CGRect viewFrame = [[element superview] convertRect:[element frame] toView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
                    
                    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
                    
                    
                    if (CGRectIntersectsRect(viewFrame, appFrame)) {
                        
                        [elementsPresentOnScreen addObject:element];
                        
                        NSMutableDictionary *metadata = [[NSMutableDictionary alloc] init];
                        [metadata setValue:NSStringFromClass([UILabel class]) forKey:@"elementClass"];
                    
                        
                        
                        
                        
                        if([element isKindOfClass: [UILabel class]] || [NSStringFromClass([element class]) isEqualToString: @"UIButtonLabel"]){
                            
                            
                        
                            UILabel * myLabel = (UILabel *) element;
                            
                            
                            
                            [metadata setValue:myLabel.font.fontName forKey:@"fontName"];
                            
                            [metadata setValue:[NSString stringWithFormat: @"%.1f", myLabel.font.pointSize] forKey:@"fontSize"];
                            
                            
                            NSString *lineBreakString;
                            
                            switch(myLabel.lineBreakMode) {
                                    
                                case NSLineBreakByWordWrapping:
                                    lineBreakString = @"NSLineBreakByWordWrapping";
                                    break;
                                case NSLineBreakByClipping:
                                    lineBreakString = @"NSLineBreakByClipping";
                                    break;
                                case NSLineBreakByTruncatingHead:
                                    lineBreakString = @"NSLineBreakByTruncatingHead";
                                    break;
                                case NSLineBreakByTruncatingTail:
                                    lineBreakString = @"NSLineBreakByTruncatingTail";
                                    break;
                                case NSLineBreakByTruncatingMiddle:
                                    lineBreakString = @"NSLineBreakByTruncatingMiddle";
                                    break;
                                default:
                                    lineBreakString = @"unknown";
                            }
                            
                            
                            NSString *textAlignString;
                            
                            switch(myLabel.textAlignment) {
                                    
                                case NSTextAlignmentLeft:
                                    textAlignString = @"NSTextAlignmentLeft";
                                    break;
                                case NSTextAlignmentCenter:
                                    textAlignString = @"NSTextAlignmentCenter";
                                    break;
                                case NSTextAlignmentRight:
                                    textAlignString = @"NSTextAlignmentRight";
                                    break;
                                case NSTextAlignmentJustified:
                                    textAlignString = @"NSTextAlignmentJustified";
                                    break;
                                case NSTextAlignmentNatural:
                                    textAlignString = @"NSTextAlignmentNatural";
                                    break;
                                default:
                                    textAlignString = @"unknown";
                            }
                            
                            NSString *noOfLines = [NSString stringWithFormat:@"%li",(long)myLabel.numberOfLines];
                    
                            [metadata setValue:noOfLines forKey:@"numberOfLines"];
                            
                        
    
                            
                            
                            UIColor *color = myLabel.textColor;
                            
                            
                           
                            if ([NSStringFromClass([element class]) isEqualToString: @"UIButtonLabel"]){
                                
                                color = ((UIButton *)myLabel.superview). currentTitleColor;
                               
                                NSLog(@"Button class: %@",NSStringFromClass([((UIButton *)myLabel.superview) class]));
                                
                            }
                            
                            
                            
                            
                            NSString *colorAsString;
                            
                            
                            if (CGColorGetNumberOfComponents(color.CGColor) == 2) {
                                
                           
                                const CGFloat *components = CGColorGetComponents(color.CGColor);
                                    colorAsString = [NSString stringWithFormat:@"%.1f,%.1f,%.1f,%.1f", components[0], components[0], components[0], components[1]];
                                
                                
                            }
                            else if (CGColorGetNumberOfComponents(color.CGColor) == 4) {
                                
                                const CGFloat *components = CGColorGetComponents(color.CGColor);
                                colorAsString = [NSString stringWithFormat:@"%.1f,%.1f,%.1f,%.1f", components[0], components[1], components[2], components[3]];
                                
                                
                            }
                           
                            
                            [metadata setValue:lineBreakString forKey:@"lineBreakMode"];
                            
                            [metadata setValue:textAlignString forKey:@"textAlignment"];
                            
                            [metadata setValue:colorAsString forKey:@"fontColor"];
                            
                            CGRect viewRect = [[element superview] convertRect:[element frame] toView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
                            
                            [metadata setValue:[NSString stringWithFormat:@"%.2f,%.2f,%.2f,%.2f",viewRect.origin.x, viewRect.origin.y,viewRect.size.width,viewRect.size.height] forKey:@"viewRect"];
                            
                            CGRect superViewRect = [UIApplication sharedApplication].keyWindow.rootViewController.view.frame;
                            
                            [metadata setValue:[NSString stringWithFormat:@"%.2f,%.2f,%.2f,%.2f",superViewRect.origin.x, superViewRect.origin.y,superViewRect.size.width,superViewRect.size.height] forKey:@"superViewRect"];
                            
                            
                            //NSLog(@"%@",NSStringFromCGRect([[element superview] convertRect:[element frame] toView:[UIApplication sharedApplication].keyWindow.rootViewController.view]));
                            
                             [metadata setValue:screenshotID forKey:@"screenshotId"];
                            
                            
                            NSString *fixedString = [[[stringDict objectForKey:@"string"] stringByReplacingOccurrencesOfString:@"\u00a0" withString:@""] stringByReplacingOccurrencesOfString:@"(.*)" withString:@"%@"];
                           
                            
                            
                            NSMutableDictionary *appStringObject = [[NSMutableDictionary alloc] init];
                            
                            [metadata setValue:fixedString forKey:@"string"];
                            
                            NSLog(@"%@",NSStringFromClass([element class]));
                            
                            NSLog(@"%@",fixedString);
                            
                            NSLog(@"String Color: %@", colorAsString);
                            
                            
                            if ([stringDict objectForKey:@"id"]) {
                            
                                [metadata setValue:[stringDict objectForKey:@"id"] forKey:@"identifier"];
                            
                            }
                            
                            [metadata setValue:[stringDict objectForKey:@"context"] forKey:@"context"];
                            
                            
                            
                            [appStringObject setValue:@{@"identifiers":@[@""],@"screenshots": @[metadata]} forKey:@"metadata"];
                            
                            
                            [detectedStringsArray addObject:metadata];
                            
                            
                            
                            //NSLog(@"MY UI LABEL %@",myLabel);
                            //NSLog(@"MY UI FONT %@",myLabel.font);
                            //NSLog(@"MY APPSTRING! %@",appStringObject);
                            
                            
                            [[[SubviewsHelper sharedInstance] hiddenSubviewsArray] addObject:@[element,((UILabel *)element).text]];
                            
                            
                            [(UILabel *)element setText:@""];
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                }
                
                
            }
            
        }
        
    }
    
    
   
    [[SubviewsHelper sharedInstance] setDetectedStringsArray:detectedStringsArray];
    

    return elementsPresentOnScreen;
    

}


-(void) uploadScreeenshotToParse: (UIImage *)screenshot withScreenshotID:(NSString *)screenshotID andDetectedStrings:(NSArray *)arrayOfDetectedStrings andResponse:(void (^)(NSURLResponse *serviceResponse, id receivedData, NSError *error))responseHandler {
    
    
    NSString *fileExtension = @".jpg";
    
    
    //Activate the status bar spinner
    UIApplication* app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
    
    //The image you want to upload represented in JPEG
    //NOTE: the 'selectedPhoto' needs to be replaced with the UIImage you'd like to upload
    NSData *imageData = UIImageJPEGRepresentation(screenshot, 0.5);
    
    //NOTE: Change this to the upload URL you're posting to
    NSString *uploadUrl = [NSString stringWithFormat:@"https://api.parse.com/1/files/%@%@",screenshotID, fileExtension];
    
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:uploadUrl] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
                                   
                                   
    [request setURL:[NSURL URLWithString:uploadUrl]];
    [request setHTTPMethod:@"POST"];
    [request setValue:kPARSE_APPLICATION_ID forHTTPHeaderField:@"X-Parse-Application-Id"];
    [request setValue:kREST_API_KEY forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    [request setValue:@"image/jpeg" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:imageData];
    
    
    
    // Configure your request here.  Set timeout values, HTTP Verb, etc.
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self ];
    
    
    
    //start the connection
    [connection start];
    
    //Stop the status bar spinner
    app.networkActivityIndicatorVisible = NO;
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               
                               
                               
                               NSArray *objects;
                               
                               
                               if (data) {
                                   
                                   
                                   NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                   
                                   objects = [NSArray array];
                                   
                                   ///objects = [self parseVenuesFromDictionary:responseDictionary];
                                   
                                   //NSLog(@"%@", responseDictionary);
                                   
                                   
                                   
                                   dispatch_async(dispatch_get_main_queue(), ^{
                                       
                                       /*
                                        
                                        
                                       NSMutableDictionary * dictionary = [[NSMutableDictionary alloc]init];
                                       [dictionary setObject:@"Yo" forKey:@"element-class"];
                                       [dictionary setObject:@"tralala" forKey:@"font-color"];
                                       [dictionary setObject:@"He is bla bla bla bla bla " forKey:@"font-name"];
                                       [dictionary setObject:@"He is bla bla bla bla bla " forKey:@"font-size"];
                                       [dictionary setObject:@"He is bla bla bla bla bla " forKey:@"line-break-mode"];
                                       [dictionary setObject:@"He is bla bla bla bla bla " forKey:@"screenshot-id"];
                                       [dictionary setObject:@"He is bla bla bla bla bla " forKey:@"super-view-rect"];
                                       [dictionary setObject:@"He is bla bla bla bla bla " forKey:@"view-rect"]; 
                                        
                                        
                                        */
                                       
                                       
                                       
                                       
                                       NSMutableDictionary * screenshotDictionary = [[NSMutableDictionary alloc] init];
                                       
                                       [screenshotDictionary setObject:[responseDictionary valueForKey:@"url"] forKey:@"screenshotURL"];
                                       
                                       [screenshotDictionary setObject:screenshotID forKey:@"screenshotID"];
                                       
                                       
                                       
                                       
                                       
                                       [self createParseObjectWithClass:@"Media" withParams:screenshotDictionary andResponse:^(NSURLResponse *serviceResponse, id receivedData, NSError *error) {
                                           
                                           //NSLog(@"Response %@", receivedData);
                                           
                                           
                                       }];
                                       
                                       
                              
                                       
                                       for (NSDictionary *elementHolder in arrayOfDetectedStrings) {
                                       
                                           
                                           NSMutableDictionary *dict = [elementHolder mutableCopy];
                                           
                                           [dict setObject:[responseDictionary valueForKey:@"url"] forKey:@"screenshotURL"];
                                           
                                       
                                       [self createParseObjectWithClass:@"ElementHolder" withParams:dict andResponse:^(NSURLResponse *serviceResponse, id receivedData, NSError *error) {
                                           
                                           //NSLog(@"Response %@", receivedData);
                                           
                                           

                                           
                                           
                                       }];
                                       
                                           
                                           
                                           
                                           
                                       }
                                       
                                       
                                      
                                       
                                       
                                   });
                                   
                                   
                                   
                                   
                               }
                               
                               
                               responseHandler (response,data,connectionError);
                               
                               
                               
                           }];
    
    
    
    
}



- (void)createParseObjectWithClass:(NSString *)className
                        withParams:(NSDictionary *)params
                       andResponse:(void (^)(NSURLResponse *serviceResponse, id receivedData, NSError *error))responseHandler {
    
    
    
    NSError *jsonError;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&jsonError];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", @"https://api.parse.com/1/classes/", className]];
    NSMutableURLRequest *dataRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
    [dataRequest setTimeoutInterval:30.0];
    [dataRequest setHTTPMethod:@"POST"];
    [dataRequest setValue:kPARSE_APPLICATION_ID forHTTPHeaderField:@"X-Parse-Application-Id"];
    [dataRequest setValue:kREST_API_KEY forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    [dataRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
    [dataRequest setHTTPBody:jsonData];
    
    
    [NSURLConnection sendAsynchronousRequest:dataRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               id receivedData;
                               if (connectionError) {
                                   
                                   //NSLog(@"%@", connectionError);
                               }
                               
                               else {
                                   NSError *jsonError;
                                   receivedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                                   if (jsonError) {
                                   }else {
                                       // //NSLog(@"OUTPUT DATA: %@", receivedData);
                                   }
                               }
                               
                               responseHandler (response,receivedData,connectionError);
                           }];
    
    
    
}











@end
