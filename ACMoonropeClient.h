//
//  ACMoonropeClient.h
//  Telecoms Mobile
//
//  Created by Adam Cooke on 20/05/2015.
//  Copyright (c) 2015 Adam Cooke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "ACMoonropeResponse.h"

@interface ACMoonropeClient : NSObject

@property (strong, nonatomic) AFHTTPRequestOperationManager *requestManager;
@property (strong, nonatomic) NSString *httpHost;
@property (strong, nonatomic) NSString *httpProtocol;
@property (nonatomic) int version;

- (void)makeRequest:(NSString *)path params:(NSDictionary *)params completion:(void (^)(ACMoonropeResponse *response))completion;
- (void)setRequestHeader:(NSString *)name withValue:(NSString *)value;
+ (ACMoonropeClient *) sharedClient;

@end
