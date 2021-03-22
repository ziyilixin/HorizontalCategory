//
//  ViewController.m
//  HorizontalCategory
//
//  Created by Mac on 2021/3/22.
//

#import "ViewController.h"
#import "HomeCategoryView.h"

//屏幕宽高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeCategoryView *categoryView = [[HomeCategoryView alloc] initWithFrame:CGRectMake(0, 150, kScreenWidth, 156)];
    [self.view addSubview:categoryView];
}


@end
