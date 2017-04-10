//
//  IPHealthRequest.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "IPHealthRequest.h"

@implementation IPHealthRequest

const NSString * _ipHealth;

+(void)setIP:(NSString *)ip {
    _ipHealth = ip;
}

+(NSString*)path {
    if(_ipHealth) {
        return [NSString stringWithFormat:@"/ip/health/%@",_ipHealth];
    }
    return @"/ip/health/";
}

@end
