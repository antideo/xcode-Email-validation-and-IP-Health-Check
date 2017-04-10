//
//  EmailHealthRequest.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "EmailHealthRequest.h"

@implementation EmailHealthRequest

const NSString * _emailHelath;

+(void)setEmail:(NSString *)email {
    _emailHelath = email;
}

+(NSString*)path {
    if(_emailHelath) {
        return [NSString stringWithFormat:@"/email/%@",_emailHelath];
    }
    return @"/email/";
}


@end
