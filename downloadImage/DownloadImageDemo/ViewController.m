//
//  ViewController.m
//  DownloadImageDemo
//
//  Created by liuxin on 15/3/13.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import "ViewController.h"

#import "CWImageDownload.h"
#define kScreemH [UIScreen mainScreen].bounds.size.height
#define kScreemW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<imageDownloadDelegate>
{
    CWImageDownload *d_ImageView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    button.tag = 100;
    button.frame = CGRectMake(100, 100, kScreemW-100*2, 60);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
}


/********************************************************************************************/
#pragma -mark  All-Button_Action
/********************************************************************************************/
- (void)btnPressed:(UIButton *)sender
{
    switch (sender.tag) {
        case 100:
        {
            d_ImageView = [CWImageDownload alloc];
            d_ImageView.delegate = self;
            NSArray *array = @[@"http://img1.cache.netease.com/catchpic/A/AE/AEE89179818630A3CFC2EC4E135B421E.jpg",@"http://b.hiphotos.baidu.com/zhidao/pic/item/3bf33a87e950352a8fc105645243fbf2b2118b3d.jpg",@"http://attachments.gfan.com/forum/201503/12/2239295jtwnfan0comf0nt.jpg",@"http://attachments.gfan.com/forum/201503/12/223841xox83xozflx6fes6.jpg",@"http://attachments.gfan.com/forum/201503/12/222246mmfc00tilkonll4o.jpg"];
            [d_ImageView getDownloadImage:array];
            NSLog(@"array=%@",array);
            break;
        }
            case 101:
        {
            break;
        }
        default:
            break;
    }
   
    
}


- (void)downloadImageComplete:(NSArray *)imageArray WithTag:(NSInteger)tag
{
//    for (int i=0; i < imageArray.count; i++) {
    NSLog(@"afasfafafsdfsdfsdaaaaaaaaaaaaaf");
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20+(20+85)*(tag%3), (200 +(20+60)*(tag/3)), 85, 60)];
        imageView.image = imageArray[tag];
        [self.view addSubview:imageView];
//    }
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
