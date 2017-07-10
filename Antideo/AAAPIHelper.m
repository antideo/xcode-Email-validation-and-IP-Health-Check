//
//  AAAPIHelper.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAAPIHelper.h"


@implementation AAAPIHelper

+(void)request:(__kindof AAHTTPRequest *)request completion:(APIHelperResponseBlock)completion {
    NSURLComponents * urlComponents = [request urlComponents];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    [config setHTTPAdditionalHeaders:[request headers]];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSMutableURLRequest *urlrRequest = [[NSMutableURLRequest alloc] initWithURL:urlComponents.URL];
    urlrRequest.HTTPMethod = [self httpMethod:[request method]];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlrRequest completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if(error){
            completion(nil, error);
        } else {
            
            NSInteger statusCode = [(NSHTTPURLResponse*)response statusCode];
            
            NSError* deserializingError;
            NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:kNilOptions
                                                                           error:&deserializingError];
            
            if(!deserializingError&&statusCode==200){
                completion(responseDict, nil);
            } else {
                completion(nil, [self errorForStatusCode:statusCode]);
            }
        }
    }];
    
    [dataTask resume];
}

+(NSString*)httpMethod:(HTTPMethod)method {
    switch (method) {
        case OPTIONS:
            return @"OPTIONS";
        case GET:
            return @"GET";
        case HEAD:
            return @"HEAD";
        case POST:
            return @"POST";
        case PUT:
            return @"PUT";
        case PATCH:
            return @"PATCH";
        case DELETE:
            return @"DELETE";
        case TRACE:
            return @"TRACE";
        case CONNECT:
            return @"CONNECT";
    }
}

+(NSString*)localizedStringForErrorCode:(NSInteger)code{
    switch (code) {
        case 400:
            return NSLocalizedString(@"Bad Request.", @"Antideo 400 error message");
        case 401:
            return NSLocalizedString(@"Unauthorized.", @"Antideo 401 error message");
        case 403:
            return NSLocalizedString(@"Forbidden.", @"Antideo 403 error message");
        case 404:
            return NSLocalizedString(@"Not Found.", @"Antideo 404 error message");
        case 405:
            return NSLocalizedString(@"Method Not Allowed.", @"Antideo 405 error message");
        case 406:
            return NSLocalizedString(@"Not Acceptable.", @"Antideo 406 error message");
        case 429:
            return NSLocalizedString(@"Too many requests.", @"Antideo 429 error message");
        case 500:
            return NSLocalizedString(@"Internal Server Error.", @"Antideo 500 error message");
        case 501:
            return NSLocalizedString(@"Not Implemented.", @"Antideo 501 error message");
        case 502:
            return NSLocalizedString(@"Bad Gateway.", @"Antideo 502 error message");
        case 503:
            return NSLocalizedString(@"Service Unavailable.", @"Antideo 503 error message");
        case 504:
            return NSLocalizedString(@"Gateway Timeout.", @"Antideo 504 error message");
        default:
            return nil;
    }
}

+(NSError*)errorForStatusCode:(NSInteger)statusCode {
    NSString * erorString = [self localizedStringForErrorCode:statusCode];
    return [[NSError alloc]initWithDomain:@"com.antideo.framework" code:statusCode userInfo:@{NSLocalizedDescriptionKey:erorString}];
}

@end
