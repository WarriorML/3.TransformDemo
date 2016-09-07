//
//  ViewController.m
//  TransformDemo
//
//  Created by MengLong Wu on 16/8/26.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "ViewController.h"
#import "ChineseToPinyin.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *k = [self transform:@"中国"];
    NSLog(@"%@",k);
    
    NSString *pinyin = [ChineseToPinyin pinyinFromChiniseString:@"中国"];
    
    pinyin = [pinyin lowercaseString];
    
    NSLog(@"%@",pinyin);
    
//    获取第一个字母
    char x = [ChineseToPinyin sortSectionTitle:@"mbcd"];
    
    NSLog(@"%c",x);
}

- (NSString *)transform:(NSString *)chinese
{
    NSMutableString *pinyin = [[NSMutableString alloc]initWithString:chinese];
//    kCFStringTransformMandarinLatin方法转化出来的是带音标的拼音
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
//    kCFStringTransformStripCombiningMarks 去掉音标
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    
    return pinyin;
}

@end
