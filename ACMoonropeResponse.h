//
//  ACMoonropeResponse.h
//  Telecoms Mobile
//
//  Created by Adam Cooke on 20/05/2015.
//  Copyright (c) 2015 Adam Cooke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"

@interface ACMoonropeResponse : NSObject

@property (strong, nonatomic) AFHTTPRequestOperation *operation;
@property (nonatomic) BOOL success;

- (NSDictionary *)rawData;
- (id)data;
- (NSString *)status;
- (NSString *)responseTime;
- (NSDictionary *)flags;

- (id)initWithAFHTTPRequestOperation:(AFHTTPRequestOperation *)operation;

@end
