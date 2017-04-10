//
//  IPInfoResult.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "IPInfoResult.h"
#import "AAFormatter.h"

@implementation IPInfoResult

-(void)setValue:(id)value forKey:(NSString *)key {
    NSString * lowerCaseKey = [key lowercaseString];
    if([lowerCaseKey isEqualToString:@"org"]) {
        NSDictionary * info = value;
        for(NSString * infoKey in [info allKeys] ) {
            if([infoKey isEqualToString:@"asn_assigned"]){
                self.asnAssigned = [AAFormatter dateFromASNAssignedString:[info objectForKey:infoKey]];
            } else if([infoKey isEqualToString:@"name"]){
                [super setValue:[info objectForKey:infoKey] forKey:@"orgName"];
            } else {
                [super setValue:[info objectForKey:infoKey] forKey:infoKey];
            }
        }

    } else {
        [super setValue:value forKey:lowerCaseKey];
    }
}

@end
