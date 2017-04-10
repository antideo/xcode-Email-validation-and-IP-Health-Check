//
//  IPInfoRequest.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "IPInfoRequest.h"

@implementation IPInfoRequest

const NSString * _ipInfo;

+(void)setIP:(NSString *)ip {
    _ipInfo = ip;
}

+(NSString*)path {
    if(_ipInfo) {
        return [NSString stringWithFormat:@"/ip/info/%@",_ipInfo];
    }
    return @"/ip/info/";
}

@end
