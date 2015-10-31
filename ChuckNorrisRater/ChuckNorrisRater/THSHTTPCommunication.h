//
//  THSHTTPCommunication.h
//  ChuckNorrisRater
//
//  Created by X on 30/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THSHTTPCommunication : NSObject <NSURLSessionDownloadDelegate>

- (void)retrieveURL:(NSURL *)url successBlock:(void(^)(NSData *))successBlock;
- (void)postURL:(NSURL *)url params:(NSDictionary *)params
   successBlock:(void(^)(NSData *))successBlock;

@end
