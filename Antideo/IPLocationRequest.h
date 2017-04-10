//
//  IPLocationRequest.h
//  Antideo
//
//  Created by Panayot Panayotov on 08/02/2017.
//  Copyright © 2017 Antideo. All rights reserved.
//

#import "AAHTTPRequest.h"

@interface IPLocationRequest : AAHTTPRequest

+(void)setIP:(NSString*)ip;

@end
