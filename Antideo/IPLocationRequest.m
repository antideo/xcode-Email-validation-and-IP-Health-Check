//
//  IPLocationRequest.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "IPLocationRequest.h"

@implementation IPLocationRequest

const NSString * _ipLocation;

+(void)setIP:(NSString *)ip {
    _ipLocation = ip;
}

+(NSString*)path {
    if(_ipLocation) {
        return [NSString stringWithFormat:@"/ip/location/%@",_ipLocation];
    }
    return @"/ip/location/";
}

@end
