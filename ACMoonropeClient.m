//
//  ACMoonropeClient.m
//  Telecoms Mobile
//
//  Created by Adam Cooke on 20/05/2015.
//  Copyright (c) 2015 Adam Cooke. All rights reserved.
//

#import "ACMoonropeClient.h"
#import <AFNetworking/AFNetworking.h>
#import "ACMoonropeResponse.h"

@implementation ACMoonropeClient

- (id)init {
    if (self == [super init]) {
        // Set the initial version to 1
        self.version = 1;
        
        // Use HTTPS by default
        self.httpProtocol = @"https";
        
        // Create a request manager to be used for this client
        self.requestManager = [AFHTTPRequestOperationManager manager];
        AFHTTPRequestSerializer *serializer = [[AFHTTPRequestSerializer alloc] init];
        [self.requestManager setRequestSerializer:serializer];
        [self.requestManager.requestSerializer setTimeoutInterval:60];
    }
    return self;
}

- (void)setRequestHeader:(NSString *)name withValue:(NSString *)value {
    NSLog(@"Set %@ to %@", name, value);
    [self.requestManager.requestSerializer setValue:value forHTTPHeaderField:name];
}

- (void)makeRequest:(NSString *)path params:(NSDictionary *)params completion:(void (^)(ACMoonropeResponse *response))completion {
    
    
    if (params == nil) {
        params = [NSDictionary dictionary];
    }
    
    NSString *fullURL = [NSString stringWithFormat:@"%@://%@/api/v%d/%@", self.httpProtocol, self.httpHost, self.version, path];
    NSLog(@"Loading data from API: %@", fullURL);
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self.requestManager POST:fullURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        ACMoonropeResponse *response = [[ACMoonropeResponse alloc] initWithAFHTTPRequestOperation:operation];
        [response setSuccess:YES];
        completion(response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        ACMoonropeResponse *response = [[ACMoonropeResponse alloc] initWithAFHTTPRequestOperation:operation];
        [response setSuccess:NO];
        completion(response);
    }];
}

+ (ACMoonropeClient *)sharedClient {
    static ACMoonropeClient *apiClient;
    if (apiClient == nil) {
        apiClient = [[ACMoonropeClient alloc] init];
    }
    return apiClient;
}

@end
