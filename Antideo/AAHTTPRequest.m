//
//  AAHTTPRequest.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAHTTPRequest.h"

@implementation AAHTTPRequest
static NSString * host = @"api.antideo.com";

+(NSURLComponents*)urlComponents {
    NSURLComponents * components = [NSURLComponents new];
    [components setHost:host];
    [components setPath:self.path];
    [components setScheme:self.urlScheme];
    NSMutableArray * queryItems = [NSMutableArray arrayWithCapacity:self.parameters.count];
    for(NSString * param in [self parameters]) {
        NSURLQueryItem * query = [[NSURLQueryItem alloc] initWithName:param value:[[self parameters] objectForKey:param]];
        [queryItems addObject:query];
    }
    [components setQueryItems:queryItems];
    
    return components;
}

+(NSString*)path{
    return @"";
}

+(NSString*)urlScheme {
    return @"https";
}

+(HTTPMethod) method {
    return  GET;
}

+(NSDictionary<NSString*,NSString*> *) headers {
    return @{
             @"Content-Type":@"application/json",
             @"Referer":@"Antideo-Framework-Xcode"
        };
}

+(NSDictionary<NSString*,NSString*> *) parameters {
    return [NSDictionary new];
}

@end
