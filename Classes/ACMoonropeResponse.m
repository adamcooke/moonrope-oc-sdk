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

- (BOOL)success {
    return self.requestSuccess && [self.status isEqualToString:@"success"];
}

- (NSString *)status {
    if (self.requestSuccess) {
        return [self.rawData valueForKey:@"status"];
    } else {
        return @"failed";
    }
}

- (NSString *)responseTime {
    if (self.requestSuccess) {
        return [self.rawData valueForKey:@"time"];
    } else {
        return @"0";
    }
}

- (id)data {
    if (self.requestSuccess) {
        return [self.rawData valueForKey:@"data"];
    } else {
        return nil;
    }
}

- (NSDictionary *)flags {
    if (self.requestSuccess) {
        return [self.rawData valueForKey:@"flags"];
    } else {
        return [NSDictionary dictionary];
    }
}



@end
