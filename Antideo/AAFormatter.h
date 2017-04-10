//
//  AAFormatter.h
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AAFormatter : NSObject

/*!
 * @discussion Formats API date string to NSDate object
 * @param dateString Date string returned from Antideo's REST API
 * @return NSDate object
 */
+(NSDate*)dateFromAPIDateString:(NSString*)dateString;

/*!
 * @discussion Formats asn_assigned date string (yyyymmdd) to NSDate object
 * @param dateString Date string returned from Antideo's REST API
 * @return NSDate object
 */
+(NSDate*)dateFromASNAssignedString:(NSString*)dateString;
@end
