//
//  ViewController.m
//  TomCat
//
//  Created by 李一贤 on 2018/3/12.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
- (IBAction)doAction:(UIButton*)btn;
@property (weak, nonatomic) IBOutlet UIImageView *Tom;
@property(strong,nonatomic) AVAudioPlayer* myPlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doAction:(UIButton*)btn
{
    switch (btn.tag) {
        case 1:
            [self runAnimationWithName:@"drink" andWithCount:81];
//            [NSThread cancelPreviousPerformRequestsWithTarget:self selector:@selector(playSound) object:self];
            break;
        case 2:
            [self runAnimationWithName:@"knockout" andWithCount:81];
            //让播放音效延迟1.0秒后再执行
            [self performSelector:@selector(playSound) withObject:nil afterDelay:1.0];
            break;
        default:
            break;
    }
    
}

- (void)runAnimationWithName:(NSString*)imageName andWithCount:(int)count
{
//0.判断当前是否正在执行动画,如果是，则直接返回
    if(self.Tom.isAnimating)
        return;
//1.获取图片
    NSMutableArray *images = [NSMutableArray array];
    for(int i = 0;i<count;i++)
    {
        //%02d，表示这个数字有两位，不足两位用占位符0补足;
        //png格式的图片可以不加格式后缀，jpg最好加上
        NSString*name = [NSString stringWithFormat:@"%@_%02d.jpg",imageName,i];
        UIImage *headImage = [UIImage imageNamed:name];
        [images addObject:headImage];
    }
//2.告诉Tom要播放哪些图片
    self.Tom.animationImages = images;
//3.根据图片张数设置动画播放时间
    self.Tom.animationDuration = images.count*0.05 ;
//4.设置动画重复播放次数
    self.Tom.animationRepeatCount = 1;
//5.播放动画
    [self.Tom startAnimating];
}

-(void)playSound
{
//1.获取音效资源的路径
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Tom" ofType:@"wav"];
//2.把路径path转化成url
    NSURL *url = [NSURL fileURLWithPath:path];
//3.建立一个播放器
    NSError *error = nil;
    AVAudioPlayer *player =[[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];//注意，这里的player是个局部变量，播放音效过程中该函数已经跑完。此时该变量会被销毁；因 此若使用局部变量调用播放，将出现没有听到预期音效的bug。解决方法：将它指向一个strong的该类成员变量
     _myPlayer = player;
    [_myPlayer play];
}
@end
