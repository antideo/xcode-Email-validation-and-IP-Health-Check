//
//  IPHealthResult.h
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAObject.h"
#import "AAReportResult.h"
#import "AAProxyResult.h"

@interface IPHealthResult : AAObject

/*!
 * @brief IP address for the info result
 */
@property(nonatomic, retain) NSString * _Nullable ip;

/*!
 * @brief Indicates toxic IP address
 */
@property(nonatomic, assign) BOOL toxic;

/*!
 * @brief Holds proxy result values if clasified as proxy
 */
@property(nonatomic, retain) AAProxyResult * _Nullable proxy;

/*!
 * @brief Holds spam result values if there is spam reports agains it
 */
@property(nonatomic, retain) AAReportResult * _Nullable spam;

@end
