//
//  AAHelper.h
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPHealthResult.h"
#import "IPInfoResult.h"
#import "IPLocationResult.h"
#import "EmailHealthResult.h"

@interface AAHelper : NSObject

/*!
 * @discussion Performs IP address health check lookup.
 * @param ip Optional - if set to nil the health check will be performed on your public IP address
 */
+(void)getIPHealth:(NSString*_Nullable)ip completion:(void(^_Nonnull)(IPHealthResult * _Nullable ipHeathResult, NSError * _Nullable error))completion;

/*!
 * @discussion Performs IP address info lookup.
 * @param ip Optional - if set to nil the info check will be performed on your public IP address
 */
+(void)getIPInfo:(NSString*_Nullable)ip completion:(void(^_Nonnull)(IPInfoResult * _Nullable ipInfoResult, NSError * _Nullable error))completion;

/*!
 * @discussion Performs IP address location lookup.
 * @param ip Optional - if set to nil the location check will be performed on your public IP address
 */
+(void)getIPLocation:(NSString*_Nullable)ip completion:(void(^_Nonnull)(IPLocationResult * _Nullable ipLocationResult, NSError * _Nullable error))completion;

/*!
 * @discussion Performs email health check lookup
 * @param email non null string of email address
 */
+(void)getEmailInfo:(NSString*_Nonnull)email completion:(void(^_Nonnull)(EmailHealthResult * _Nullable emailHeathResult, NSError * _Nullable error))completion;

/*!
 * @discussion Performs a check if string is a valid IPV4 address
 * @param testString The string to test
 * @return true or false
 */
+(BOOL)isValidIPV4Address:(NSString*_Nullable)testString;

/*!
 * @discussion Performs a check if string is a valid IPV6 address
 * @param testString The string to test
 * @return true or false
 */
+(BOOL)isValidIPV6Address:(NSString*_Nullable)testString;

/*!
 * @discussion Performs a check if string is either a valid IPV4 or IPV6 address
 * @param testString The string to test
 * @return true or false
 */
+(BOOL)isValidIPAddress:(NSString*_Nullable)testString;

/*!
 * @discussion Performs an email address validation by mathing the
 * following regex ^[A-Z0-9a-z._%'+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,63}$
 * @param testString The string to test
 * @return true or false
 */
+(BOOL)isValidEmail:(NSString*_Nullable)testString;
@end
