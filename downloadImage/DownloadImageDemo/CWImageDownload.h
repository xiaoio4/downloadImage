//
//  CWImageDownload.h
//  DownloadImageDemo
//
//  Created by liuxin on 15/3/13.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol imageDownloadDelegate <NSObject>

-(void)downloadImageComplete:(NSArray *)imageArray WithTag:(NSInteger ) tag;

@end
@interface CWImageDownload : NSObject

@property (nonatomic, assign) id<imageDownloadDelegate>delegate;

- (void)getDownloadImage:(NSArray *)imagePathArray;

@end
