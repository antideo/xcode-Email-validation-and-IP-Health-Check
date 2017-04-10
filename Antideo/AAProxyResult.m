//
//  AAProxyResult.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAProxyResult.h"
#import "AAFormatter.h"

@implementation AAProxyResult

-(void)setValue:(id)value forKey:(NSString *)key {
    if([key isEqualToString:@"type"]) {
        NSString * typeString = [value lowercaseString];
        if([typeString isEqualToString:@"anonymous"]){
            self.type = AnonymousProxy;
        } else if([typeString isEqualToString:@"open"]) {
            self.type = OpenProxy;
        } else {
            self.type = UnknownProxyType;
        }
    } else if([key isEqualToString:@"last_seen"]) {
        self.lastSeen = [AAFormatter dateFromAPIDateString:value];
    } else {
        [super setValue:value forKey:key];
    }
}

@end
