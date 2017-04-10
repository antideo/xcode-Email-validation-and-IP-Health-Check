//
//  EmailHealthResult.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "EmailHealthResult.h"

@implementation EmailHealthResult

-(void)setValue:(id)value forKey:(NSString *)key {
    if([key isEqualToString:@"spam"]||[key isEqualToString:@"scam"]){
        if([value isKindOfClass:[NSDictionary class]]) {
            AAReportResult * report = [[AAReportResult alloc]init];
            [report setValuesForKeysWithDictionary:value];
            if([key isEqualToString:@"spam"]){
                self.spam = report;
            } else {
                self.scam = report;
            }
        }
    } else if([key isEqualToString:@"free_provider"]) {
        [self setValue:value forKey:@"freeProvider"];
    }else {
        [super setValue:value forKey:key];
    }
}

@end
