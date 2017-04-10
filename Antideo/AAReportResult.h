//
//  AAReportResult.h
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAObject.h"

@interface AAReportResult : AAObject

/*!
 * @brief Holds the number of times reported value
 */
@property(nonatomic, assign) NSInteger timesReported;

/*!
 * @brief Holds the last seen date and time object
 */
@property(nonatomic, strong) NSDate * lastSeen;

@end
