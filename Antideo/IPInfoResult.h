//
//  IPInfoResult.h
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAObject.h"

@interface IPInfoResult : AAObject

/*!
 * @brief IP address for the info result
 */
@property(nonatomic, retain) NSString *_Nullable ip;

/*!
 * @brief hostname of IP address
 */
@property(nonatomic, retain) NSString *_Nullable host;

/*!
 * @brief Iorganisation name
 */
@property(nonatomic, retain) NSString *_Nullable orgName;

/*!
 * @brief Autonomous System Number
 */
@property(nonatomic, retain) NSString *_Nullable asn;

/*!
 * @brief NSDate object of date ASN was assigned to this organisation
 */
@property(nonatomic, retain) NSDate *_Nullable asnAssigned;

/*!
 * @brief Regstration country organisation behind this IP
 */
@property(nonatomic, retain) NSString *_Nullable country;

/*!
 * @brief Registry issued this ASN
 */
@property(nonatomic, retain) NSString *_Nullable registry;

/*!
 * @brief Category of ASN/Org/IP Address
 */
@property(nonatomic, retain) NSString *_Nullable category;

@end
