//
//  HomeCategoryView.m
//  Information
//
//  Created by Mac on 2020/11/5.
//

#import "HomeCategoryView.h"
#import "HomeCategoryCell.h"
#import "HorizontalLayout.h"

//屏幕宽高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface HomeCategoryView ()<UICollectionViewDataSource,UICollectionViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

static NSString * const homeCategoryCellId = @"HomeCategoryCell";

@implementation HomeCategoryView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        HorizontalLayout *flowLayout = [[HorizontalLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.itemSize = CGSizeMake(kScreenWidth / 5, 68);
        flowLayout.rowCount = 5;
        flowLayout.columCount = 2;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 20) collectionViewLayout:flowLayout];
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.pagingEnabled = YES;
        collectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:collectionView];
        self.collectionView = collectionView;
        
        [self.collectionView registerClass:[HomeCategoryCell class] forCellWithReuseIdentifier:homeCategoryCellId];
        
        UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.collectionView.frame), CGRectGetWidth(self.frame), 20)];
        self.pageControl = pageControl;
        self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
        if (self.categoryArray.count / 10 == 0) {
            if (self.categoryArray.count <= 10) {
                self.pageControl.numberOfPages = 0;
            }
            else {
                self.pageControl.numberOfPages = self.categoryArray.count / 10;
            }
        }
        else {
            self.pageControl.numberOfPages = self.categoryArray.count / 10 + 1;
        }
        [self addSubview:self.pageControl];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categoryArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCategoryCellId forIndexPath:indexPath];
    cell.titleLabel.text = self.categoryArray[indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.iconArray[indexPath.row]]];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"跳转 - %zd",indexPath.row);
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    //获得页码
    CGFloat doublePage = scrollView.contentOffset.x / kScreenWidth;
    int intPage = (int)(doublePage +0.5);
    //设置页码
    self.pageControl.currentPage = intPage;
}

- (NSMutableArray *)categoryArray {
    if (!_categoryArray) {
        _categoryArray = [NSMutableArray arrayWithObjects:@"餐饮美食",@"汽车城",@"装修设计",@"二手车",@"房屋租售",@"城市班车",@"工程车辆",@"八戒拉货",@"找师傅",@"招聘",@"休闲娱乐",@"人气商铺",@"商政服务",@"家具家电",@"服装服饰",@"摆地摊",@"顺风车",@"电车城",@"材料供应",@"建材市场",@"托儿所",@"驾校",@"娱乐视听",@"南坡乡",nil];
    }
    return _categoryArray;
}

- (NSMutableArray *)iconArray {
    if (!_iconArray) {
        _iconArray = [NSMutableArray arrayWithObjects:@"home_cate",@"home_motown",@"home_design",@"home_second_car",@"home_housing",@"home_cityliner",@"home_shoptruck",@"home_sellin",@"home_master",@"home_recruitment",@"home_recreation",@"home_hotshop",@"home_politician",@"home_furniture",@"home_apparel",@"home_streetvendor",@"home_expresstrain",@"home_tram",@"home_materialsupplies",@"home_buildingmarket",@"home_nursery",@"home_driving",@"home_entertainment",@"home_village",nil];
    }
    return _iconArray;
}

@end
