//
//  ViewController.m
//  scrollViewDelegate
//
//  Created by yulingsong on 16/6/14.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ace"]];
    [self.scrollView addSubview:self.imageView];
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
    self.scrollView.contentSize = self.imageView.image.size;

    //设置代理
    self.scrollView.delegate = self;
    //设置缩放比例
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.2;
}

#pragma mark - <UIScrollViewDelegate>

/**
 这个方法的返回值决定了要缩放的内容(返回值只能是UIScrollview的子控件)
 */
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidZoom------%f",scrollView.zoomScale);
}

/**
 * 拖拽的时候调用
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollview正在被拖拽，这句话应该满屏出现呢");
}

/**
 * 即将开始拖拽的时候调用
 */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollView就要被拖拽了啊，你瞅着点啊");
}

/**
 * 结束拖拽的时候调用
 */
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"都结束拖拽了，你歇会");
}

/**
 * 停止滚动的时候调用
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"停止滚动了啊");
}

@end
