//
//  ACMoonropeResponse.m
//  Telecoms Mobile
//
//  Created by Adam Cooke on 20/05/2015.
//  Copyright (c) 2015 Adam Cooke. All rights reserved.
//

#import "ACMoonropeResponse.h"

@implementation ACMoonropeResponse

- (id)initWithAFHTTPRequestOperation:(AFHTTPRequestOperation *)operation {
    if (self = [super init]) {
        self.operation = operation;
    }
    return self;
}

- (NSDictionary *)rawData {
    return self.operation.responseObject;
}

- (NSString *)status {
    return [self.rawData valueForKey:@"status"];
}

- (NSString *)responseTime {
    return [self.rawData valueForKey:@"time"];
}

- (id)data {
    return [self.rawData valueForKey:@"data"];
}

- (NSDictionary *)flags {
    return [self.rawData valueForKey:@"flags"];
}



@end
