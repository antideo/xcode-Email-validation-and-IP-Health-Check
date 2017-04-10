//
//  AAReportResult.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAReportResult.h"
#import "AAFormatter.h"

@implementation AAReportResult

-(void)setValue:(id)value forKey:(NSString *)key {
    if([key isEqualToString:@"last_seen"]) {
        self.lastSeen = [AAFormatter dateFromAPIDateString:value];
    } else if([key isEqualToString:@"times_reported"]) {
        [super setValue:value forKey:@"timesReported"];
    } else {
        [super setValue:value forKey:key];
    }
}

@end
