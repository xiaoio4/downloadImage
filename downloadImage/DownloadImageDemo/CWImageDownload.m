//
//  CWImageDownload.m
//  DownloadImageDemo
//
//  Created by liuxin on 15/3/13.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import "CWImageDownload.h"
#import "UIImageView+WebCache.h"

@implementation CWImageDownload


- (void)getDownloadImage:(NSArray *)imagePathArray
{
    //    UIImageView *imageView = [[UIImageView alloc]init];
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    __block NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
   
    for (int i = 0; i < imagePathArray.count; i++) {
        
        [manager downloadImageWithURL:[NSURL URLWithString:imagePathArray[i]] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            
            //每次下载完成后
            [array addObject:image];
            if(finished){
                NSLog(@"finishd = %d",finished);
                //将下载的图片添加到数组
                if (self.delegate && [self.delegate respondsToSelector:@selector(downloadImageComplete:WithTag:)]) {
                    NSLog(@"tag=%d",i);
                    [self.delegate downloadImageComplete:array WithTag:array.count-1];
                }
            }
         
        }];
        
        
    }
    
    
    
}
@end
