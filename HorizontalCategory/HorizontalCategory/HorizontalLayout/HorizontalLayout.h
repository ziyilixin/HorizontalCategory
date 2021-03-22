//
//  HorizontalLayout.h
//  Information
//
//  Created by Mac on 2020/11/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HorizontalLayout : UICollectionViewFlowLayout
//每行item数量
@property (nonatomic, assign) NSInteger rowCount;
//每列item数量
@property (nonatomic, assign) NSInteger columCount;
@end

NS_ASSUME_NONNULL_END
