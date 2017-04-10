//
//  AAAPIHelper.h
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AAHTTPRequest.h"

typedef void(^APIHelperResponseBlock)(NSDictionary*response, NSError*error);

@interface AAAPIHelper : NSObject<NSURLSessionTaskDelegate>

+(void)request:(__kindof AAHTTPRequest *)request completion:(APIHelperResponseBlock)completion;

@end
