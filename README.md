# Moonrope Objective-C SDK

This is a Objective-C SDK for working with [Moonrope](https://github.com/adamcooke/moonrope) APIs.

## Usage

```objective-c
ACMoonropeClient *apiClient = [ACMoonropeClient sharedClient];

// Set the HTTP host where your API is hosted
[apiClient setHttpHost:@"manage.dial9.co.uk"];

// Set the HTTP protocl (either http or https, https by default)
[apiClient setHttpProtocol:@"https"];

// Set any request headers whcih should apply to every request. You should use
// these to set authentication headers.
[apiClient setRequestHeader:@"X-Auth-Token" withValue:@"some-token"];
[apiClient setRequestHeader:@"X-Auth-Secret" withValue:@"some-secret"];

// Set the version of the API which should be used (1 by default)
[apiClient setVersion:2];

// Make a request
NSDictionary *params = [NSDictionary dictionaryWithObject:@"abc123" forKey:@"identifier"];
[apiClient makeRequest:@"unit/details" params:params completion:^(ACMoonropeResponse *response) {
    if (response.status == 'success') {
      NSLog(@"%@", response.data);
      NSLog(@"%@", [response.data valueForKey:@"name"]);
    } else {
      NSLog(@"Request failed");
    }
}];
```
