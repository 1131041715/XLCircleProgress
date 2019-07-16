//
//  ViewController.m
//  CircleViewDemo
//
//  Created by Apple on 16/9/22.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "XLCircleProgress.h"
@interface ViewController ()
{
    XLCircleProgress *_circle;
}

@property(nonatomic,assign)NSInteger allTime;
@property (nonatomic,strong)NSTimer *myTime;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addCircle];
}

-(void)addCircle
{
    CGFloat margin = 15.0f;
    CGFloat circleWidth = [UIScreen mainScreen].bounds.size.width - 2*margin;
    _circle = [[XLCircleProgress alloc] initWithFrame:CGRectMake(0, 0, circleWidth, circleWidth)];
    _circle.center = self.view.center;
    [self.view addSubview:_circle];
    
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(_circle.frame) + 50, self.view.bounds.size.width - 2*50, 30)];
    [slider addTarget:self action:@selector(sliderMethod:) forControlEvents:UIControlEventValueChanged];
    [slider setMaximumValue:1];
    [slider setMinimumValue:0];
    [slider setMinimumTrackTintColor:[UIColor colorWithRed:255.0f/255.0f green:151.0f/255.0f blue:0/255.0f alpha:1]];
    [self.view addSubview:slider];
    
//    _circle.progress = 1;
//    
//    self.allTime = 1800;
//    _circle.allTime = self.allTime;
//    
//    
//        NSTimer *myTime = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
////            NSLog(@"123");
//            
//            if (self.allTime > 0) {
//                [self changeData];
//                
//            }else{
//                [self.myTime invalidate];
////                [self changeData];
//            }
//            
//            
//        }];
//        
//        [[NSRunLoop currentRunLoop] addTimer:myTime forMode:NSDefaultRunLoopMode];
//
//    self.myTime = myTime;
}

- (void)changeData{
    
    CGFloat currrentValue = (float)(((long)--self.allTime * 1.0)/1800);
    _circle.progress = currrentValue;
    
}


-(void)sliderMethod:(UISlider*)slider
{
    _circle.progress = slider.value;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
