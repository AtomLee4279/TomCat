//
//  ViewController.m
//  TomCat
//
//  Created by 李一贤 on 2018/3/12.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)drink;
@property (weak, nonatomic) IBOutlet UIImageView *Tom;

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


- (IBAction)drink
{
    //获取图片
    for(int i = 0;i<81;i++)
    {
        //%02d，表示这个数字有两位，不足两位用占位符0补足;
        //png格式的图片可以不加格式后缀，jpg最好加上
        NSString*name = [NSString stringWithFormat:@"drink_%02d.jpg",i];
        UIImage *headImage = [UIImage imageNamed:name];
        NSLog(@"%@",name);
    }
}
@end
