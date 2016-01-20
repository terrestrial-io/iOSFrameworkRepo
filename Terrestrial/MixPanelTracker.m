//
//  MixPanelTracker.m
//  Terrestrial
//
//  Created by MrMambwe on 18/01/2016.
//  Copyright © 2016 Terrestrial. All rights reserved.
//

#import "MixPanelTracker.h"

@implementation MixPanelTracker




+ (void) trackEvent:(NSString *)name withProperties:(NSDictionary *)properties {
    
    
     NSString *distinctID = @"";
     NSString* token = @"";
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"TerrestrialMixpanelToken"]) {
        
        token = [[NSUserDefaults standardUserDefaults] valueForKey:@"TerrestrialMixpanelToken"];
    
 
        if ([[NSUserDefaults standardUserDefaults] valueForKey:@"TerrestrialUserID"]) {
        
        distinctID = [[NSUserDefaults standardUserDefaults] valueForKey:@"TerrestrialUserID"];
            
        }
    
   
    
    NSString *props = @"";
    
    for (NSString *key in properties) {
        props = [props stringByAppendingFormat:@",\"%@\": \"%@\"", key, [properties objectForKey:key]];
    }
    
    NSString *osVersion = [[NSProcessInfo processInfo] operatingSystemVersionString];
    

    NSString* payload = [NSString stringWithFormat:@"{\"event\": \"%@\", \"properties\": {\"token\": \"%@\", \"distinct_id\": \"%@\", \"os\": \"darwin\", \"os version\":\"%@\" %@}}", name, token, distinctID, osVersion, props];
    
    
    
    @try {
        NSData * data = [payload dataUsingEncoding:NSUTF8StringEncoding];
        NSString* base64Encoded = [data base64EncodedStringWithOptions:0];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"https://api.mixpanel.com/track/?data=%@", base64Encoded]]];
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {}];
    }
    @catch (NSException *exception) {
       // NSLog(@"%@", @"Failed to send data.");
    }
        

    }
    
    
    
    
}


@end
