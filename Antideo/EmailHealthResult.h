//
//  EmailHealthResult.h
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAObject.h"
#import "AAReportResult.h"

@interface EmailHealthResult : AAObject

/*!
 * @brief Holds email addres related to this report
 */
@property(nonatomic, retain) NSString * _Nullable email;

/*!
 * @brief Indicates if email is from a free provider like GMail etc.
 */
@property(nonatomic, assign) BOOL freeProvider;

/*!
 * @brief Indicates if email is disposable/temporary
 */
@property(nonatomic, assign) BOOL disposable;

/*!
 * @brief Holds spam result values if there is spam reports agains it
 */
@property(nonatomic, retain) AAReportResult * _Nullable spam;

/*!
 * @brief Holds spam result values if there is scam reports agains it
 */
@property(nonatomic, retain) AAReportResult * _Nullable scam;

@end
