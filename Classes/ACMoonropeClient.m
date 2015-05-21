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
    [self.requestManager.requestSerializer setValue:value forHTTPHeaderField:name];
}

- (void)makeRequest:(NSString *)path params:(NSDictionary *)params completion:(void (^)(ACMoonropeResponse *response))completion {
    if (params == nil) {
        params = [NSDictionary dictionary];
    }
    
    if (self.startRequestCallback) {
        self.startRequestCallback(path, params);
    }
    
    NSString *fullURL = [NSString stringWithFormat:@"%@://%@/api/v%d/%@", self.httpProtocol, self.httpHost, self.version, path];
    [self.requestManager POST:fullURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        ACMoonropeResponse *response = [[ACMoonropeResponse alloc] initWithAFHTTPRequestOperation:operation];
        [response setRequestSuccess:YES];
        if (self.finishRequestCallback) {
            self.finishRequestCallback(path, params, response);
        }
        completion(response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        ACMoonropeResponse *response = [[ACMoonropeResponse alloc] initWithAFHTTPRequestOperation:operation];
        [response setRequestSuccess:NO];
        completion(response);
        if (self.finishRequestCallback) {
            self.finishRequestCallback(path, params, response);
        }
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
