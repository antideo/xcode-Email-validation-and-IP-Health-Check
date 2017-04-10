//
//  AAHTTPRequest.h
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * @typedef HTTPMethod
 * @brief A list of all http methods.
 */
typedef enum{
    OPTIONS,
    GET,
    HEAD,
    POST,
    PUT,
    PATCH,
    DELETE,
    TRACE,
    CONNECT
}HTTPMethod;

@protocol AAHTTPRequestProtocol <NSObject>

+(NSURLComponents *) urlComponents;
+(NSString*)path;

@optional

+(NSString*)urlScheme;
+(HTTPMethod) method;
+(NSDictionary<NSString*,NSString*> *) headers;
+(NSDictionary<NSString*,NSString*> *) parameters;

@end


@interface AAHTTPRequest : NSObject<AAHTTPRequestProtocol>



/*!
 * @brief URL components
 */
+(NSURLComponents *) urlComponents;

/*!
 * @brief http method
 */
+(HTTPMethod) method;

/*!
 * @brief Scheme - http or https. Default value is HTTPS
 */
+(NSString*)urlScheme;

/*!
 * @brief http headers
 */
+(NSDictionary<NSString*,NSString*> *) headers;

/*!
 * @brief url parameters
 */
+(NSDictionary<NSString*,NSString*> *) parameters;

@end
