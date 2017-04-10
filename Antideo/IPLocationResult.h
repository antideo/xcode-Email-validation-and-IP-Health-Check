//
//  IPLocationResult.h
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAObject.h"

@interface IPLocationResult : AAObject

/*!
 * @brief IP address for the location result
 */
@property(nonatomic, retain) NSString * _Nullable ip;

/*!
 * @brief Latitude value from coordinates
 */
@property(nonatomic, retain) NSNumber * _Nullable latitude;

/*!
 * @brief Longitude value from coordinates
 */
@property(nonatomic, retain) NSNumber * _Nullable longitude;

/*!
 * @brief Accuracy level of provided geolocation
 */
@property(nonatomic, retain) NSNumber * _Nullable accuracy;

/*!
 * @brief City of IP address
 */
@property(nonatomic, retain) NSString * _Nullable city;

/*!
 * @brief Region of IP address
 */
@property(nonatomic, retain) NSString * _Nullable region;

/*!
 * @brief Country of IP address
 */
@property(nonatomic, retain) NSString * _Nullable country;

/*!
 * @brief Two letter ISO country code. Example: US (United States) or IE (Ireland)
 */
@property(nonatomic, retain) NSString * _Nullable countryCode;

@end
