//
//  WebServiceInvoker.h
//  WebServiceModule
//
//  Created by Sandeep Lall on 14/12/15.
//  Copyright © 2015 Shreeshail S Ganachari. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "URLConstants.h"

typedef void (^ServerResponseBlock)(BOOL success, NSString *message, id dataDict);

@interface WebServiceInvoker : AFHTTPRequestOperationManager

+(WebServiceInvoker*)sharedInstance;
- (void)postToPath:(NSString*)path withParams:(NSDictionary*)params completion:(ServerResponseBlock)block;
- (void)getToPath:(NSString*)path withParams:(NSDictionary*)params completion:(ServerResponseBlock)block;
- (void)putToPath:(NSString*)path withParams:(NSDictionary*)params completion:(ServerResponseBlock)block;
- (void)deleteToPath:(NSString*)path withParams:(NSDictionary*)params completion:(ServerResponseBlock)block;
@end
