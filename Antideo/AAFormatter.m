//
//  AAFormatter.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAFormatter.h"

@implementation AAFormatter

+(NSDate*)dateFromAPIDateString:(NSString*)dateString {
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter dateFromString:dateString];
}

+(NSDate*)dateFromASNAssignedString:(NSString*)dateString {
    if(dateString.length == 8) {
        NSString * year = [dateString substringWithRange:NSMakeRange(0, 4)];
        NSString * month = [dateString substringWithRange:NSMakeRange(dateString.length - 4 ,2)];
        NSString * day = [dateString substringWithRange:NSMakeRange(dateString.length - 2, 2)];
        return [self dateFromAPIDateString:[NSString stringWithFormat:@"%@-%@-%@ 00:00:00",year,month,day]];
    }
    return nil;
}
@end
