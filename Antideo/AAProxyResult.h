//
//  AAProxyResult.h
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAObject.h"


typedef enum {
    AnonymousProxy,
    OpenProxy,
    UnknownProxyType
} AAProxyType;

@interface AAProxyResult : AAObject

/*!
 * @brief Holds proxy type (Open, Anonymous, Unknown)
 */
@property(nonatomic, assign) AAProxyType type;

/*!
 * @brief Holds the last seen date and time object
 */
@property(nonatomic, strong) NSDate * lastSeen;

@end
