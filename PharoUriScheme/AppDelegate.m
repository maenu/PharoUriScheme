//
//  AppDelegate.m
//  PharoUrlScheme
//
//  Created by Manuel Leuenberger on 11.10.17.
//  Copyright © 2017 Manuel Leuenberger. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification {
    NSAppleEventManager *appleEventManager = [NSAppleEventManager sharedAppleEventManager];
    [appleEventManager setEventHandler:self
                           andSelector:@selector(handleGetURLEvent:withReplyEvent:)
                         forEventClass:kInternetEventClass andEventID:kAEGetURL];
}

- (void)handleGetURLEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent {
    NSURL *url = [NSURL URLWithString:[[event paramDescriptorForKeyword:keyDirectObject] stringValue]];
    url = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:9452/%@/%@?%@", url.host, url.path, url.query]];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession]
                                  dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { }];
    [task resume];
}

@end
