//
//  THSHTTPCommunication.m
//  ChuckNorrisRater
//
//  Created by X on 30/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "THSHTTPCommunication.h"

@interface THSHTTPCommunication ()

@property(nonatomic, copy) void(^successBlock)(NSData *);

@end

@implementation THSHTTPCommunication

- (void)retrieveURL:(NSURL *)url successBlock:(void(^)(NSData *))successBlock
{
    // сохраняем данный successBlock для вызова позже
    self.successBlock = successBlock;

    // создаем запрос, используя данный url
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];

    // создаем сессию, используя дефолтную конфигурацию и устанавливая наш экземпляр класса как делегат
    NSURLSessionConfiguration *conf =
        [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf delegate:self delegateQueue:nil];

    // подготавливаем загрузку
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];

    // устанавливаем HTTP соединение
    [task resume];
}

- (void) URLSession:(NSURLSession *)session
       downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    // получаем загруженные данные из локального хранилища
    NSData *data = [NSData dataWithContentsOfURL:location];

    // гарантируем, что вызов successBlock происходит в главном потоке
    dispatch_async(dispatch_get_main_queue(), ^{
        // вызываем сохраненный ранее блок как колбэк
        self.successBlock(data);
    });
}

- (void)postURL:(NSURL *)url params:(NSDictionary *)params
   successBlock:(void(^)(NSData *))successBlock
{
    self.successBlock = successBlock;

    // создаем временный массив для хранения POST параметров
    NSMutableArray *paramsArray = [NSMutableArray arrayWithCapacity:[params count]];

    // добавляем параметры во временной массив как key=value строку
    for (NSString *key in params)
    {
        [paramsArray addObject:[NSString stringWithFormat:@"%@=%@", key, params[key]]];
    }

    //создаем строку из массива параметров, содержащую все параметры, разделенные &
    NSString *postBodyString = [paramsArray componentsJoinedByString:@"&"];

    // конвертируем NSString в NSData объект, который будет использован в запросе
    NSData *postBodyData = [NSData dataWithBytes:[postBodyString UTF8String]
                                          length:[postBodyString length]];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // выставляем метод запроса в POST
    [request setHTTPMethod:@"POST"];
    // выставляем content-type как form encoded
    [request setValue:@"application/x-www-form-urlencoded"
   forHTTPHeaderField:@"content-type"];
    // добавляем созданное ранее POST тело в запрос
    [request setHTTPBody:postBodyData];

    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];

    [task resume];
}

@end














