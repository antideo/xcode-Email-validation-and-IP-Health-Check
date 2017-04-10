//
//  IPLocationResult.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "IPLocationResult.h"

@implementation IPLocationResult

-(void)setValue:(id)value forKey:(NSString *)key {
    NSString * lowerCaseKey = [key lowercaseString];
    if([lowerCaseKey isEqualToString:@"location"]) {
        NSDictionary * location = value;
        for(NSString * locKey in [location allKeys] ) {
            if([locKey isEqualToString:@"country_code"]){
                [super setValue:[location objectForKey:locKey] forKey:@"countryCode"];
            } else {
                [super setValue:[location objectForKey:locKey] forKey:locKey];
            }
        }
    } else {
        [super setValue:value forKey:lowerCaseKey];
    }
}

@end
