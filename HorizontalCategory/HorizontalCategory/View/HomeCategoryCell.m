//
//  HomeCategoryCell.m
//  Information
//
//  Created by Mac on 2020/11/5.
//

#import "HomeCategoryCell.h"
#import <Masonry.h>

@interface HomeCategoryCell ()

@end

@implementation HomeCategoryCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(14);
            make.centerX.equalTo(self.contentView);
            make.width.height.mas_equalTo(26.0);
        }];

        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:13.0];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImageView.mas_bottom).offset(5);
            make.centerX.equalTo(self.iconImageView);
        }];
        
    }
    return self;
}
@end
