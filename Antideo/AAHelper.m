//
//  AAHelper.m
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAHelper.h"
#include <arpa/inet.h>
#import "AAAPIHelper.h"
#import "IPHealthRequest.h"
#import "IPInfoRequest.h"
#import "IPLocationRequest.h"
#import "EmailHealthRequest.h"

typedef enum {
    AAEmailValidationError,
    AAIPValidationError
}AAHelperValidationError;

@implementation AAHelper

+(void)getIPHealth:(NSString*)ip completion:(void(^)(IPHealthResult * ipHeathResult, NSError * error))completion {
    if([self shouldProceedWithIP:ip]) {
        [IPHealthRequest setIP:ip];
        [AAAPIHelper request:IPHealthRequest.self completion:^(NSDictionary *response, NSError *error) {
            if(error) {
                completion(nil, error);
            }
            IPHealthResult * result = [[IPHealthResult alloc] init];
            [result setValuesForKeysWithDictionary:response];
            completion(result, nil);
        }];
    } else {
        completion(nil, [self errorForValidationError:AAIPValidationError]);
    }
}

+(void)getIPInfo:(NSString*)ip completion:(void(^_Nonnull)(IPInfoResult * ipInfoResult, NSError * error))completion {
    if([self shouldProceedWithIP:ip]){
        [IPInfoRequest setIP:ip];
        [AAAPIHelper request:IPInfoRequest.self completion:^(NSDictionary *response, NSError *error) {
            if(error) {
                completion(nil, error);
            }
            IPInfoResult * result = [[IPInfoResult alloc] init];
            [result setValuesForKeysWithDictionary:response];
            completion(result, nil);
        }];
    } else {
        completion(nil, [self errorForValidationError:AAIPValidationError]);
    }
}

+(void)getIPLocation:(NSString*)ip completion:(void(^)(IPLocationResult * ipLocationResult, NSError * error))completion {
    if([self shouldProceedWithIP:ip]) {
        [IPLocationRequest setIP:ip];
        [AAAPIHelper request:IPLocationRequest.self completion:^(NSDictionary *response, NSError *error) {
            if(error) {
                completion(nil, error);
            }
            IPLocationResult * result = [[IPLocationResult alloc] init];
            [result setValuesForKeysWithDictionary:response];
            completion(result, nil);
        }];
    } else {
        completion(nil, [self errorForValidationError:AAIPValidationError]);
    }
}

+(void)getEmailInfo:(NSString*)email completion:(void(^)(EmailHealthResult * emailHeathResult, NSError * error))completion {
    if([self isValidEmail:email]) {
        [EmailHealthRequest setEmail:email];
        [AAAPIHelper request:EmailHealthRequest.self completion:^(NSDictionary *response, NSError *error) {
            if(error) {
                completion(nil, error);
            }
            EmailHealthResult * result = [[EmailHealthResult alloc] init];
            [result setValuesForKeysWithDictionary:response];
            completion(result, nil);
        }];
    } else {
        completion(nil, [self errorForValidationError:AAEmailValidationError]);
    }
}

+(BOOL)shouldProceedWithIP:(NSString*)ip {
    if(ip) {
        return [self isValidIPV4Address:ip];
    }
    return true;
}

+(BOOL)isValidIPV4Address:(NSString*)testString {
    if(testString){
        const char *utf8 = [testString UTF8String];
        struct in_addr dst;
        return inet_pton(AF_INET, utf8, &dst) == 1;
    }
    return false;
}

+(BOOL)isValidIPV6Address:(NSString*)testString {
    if(testString){
        const char *utf8 = [testString UTF8String];
        struct in6_addr dst6;
        return inet_pton(AF_INET6, utf8, &dst6) == 1;
    }
    return false;
}

+(BOOL)isValidIPAddress:(NSString*)testString {
    return [self isValidIPV4Address:testString] || [self isValidIPV6Address:testString];
}

+(BOOL)isValidEmail:(NSString*)testString {
    if(testString){
        NSString * emailRegex = @"^[A-Z0-9a-z._%'+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,63}$";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        
        return [emailTest evaluateWithObject:testString];
    }
    return FALSE;
}

+(NSString*)localizedStringForValidationError:(AAHelperValidationError)validationError{
    switch (validationError) {
        case AAIPValidationError:
            return NSLocalizedString(@"Invalid IP address provided.", @"Antideo validation: invalid IP address error message");
        case AAEmailValidationError:
            return NSLocalizedString(@"Invalid email address provided.", @"Antideo validation: invalid email address error message");
    }
}

+(NSError*)errorForValidationError:(AAHelperValidationError)validationError {
    NSString * erorString = [self localizedStringForValidationError:validationError];
    return [[NSError alloc]initWithDomain:@"com.antideo.framework" code:406 userInfo:@{NSLocalizedDescriptionKey:erorString}];
}
@end
