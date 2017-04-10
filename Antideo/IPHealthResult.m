//
//  IPHealthResult.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "IPHealthResult.h"

@implementation IPHealthResult

-(void)setValue:(id)value forKey:(NSString *)key {
    NSString * lowerCaseKey = [key lowercaseString];
    if([lowerCaseKey isEqualToString:@"health"]) {
        NSDictionary * health = value;
        for(NSString * healthKey in [health allKeys] ) {
            if([healthKey isEqualToString:@"proxy"]){
                if([[health objectForKey:healthKey] isKindOfClass:[NSDictionary class]]){
                    AAProxyResult * proxy = [[AAProxyResult alloc]init];
                    [proxy setValuesForKeysWithDictionary:[health objectForKey:healthKey]];
                    self.proxy = proxy;
                }
            } else if([healthKey isEqualToString:@"spam"]){
                if([[health objectForKey:healthKey] isKindOfClass:[NSDictionary class]]){
                    AAReportResult * spam = [[AAReportResult alloc]init];
                    [spam setValuesForKeysWithDictionary:[health objectForKey:healthKey]];
                    self.spam = spam;
                }
            } else {
                [super setValue:[health objectForKey:healthKey] forKey:healthKey];
            }
        }
        
    } else {
        [super setValue:value forKey:lowerCaseKey];
    }
}

@end
