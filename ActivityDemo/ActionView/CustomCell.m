//
//  CustomCell.m
//  ActivityDemo
//
//  Created by nemo on 16/3/23.
//  Copyright © 2016年 nemo. All rights reserved.
//

#import "Masonry/Masonry.h"
#import "CustomCell.h"

@implementation CustomCell
+ (NSString *)cellReuseId {
    return NSStringFromClass([CustomCell class]);
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self customSubviews];
    }
    return self;
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self customSubviews];
    }
    return self;
}

- (void)customSubviews {
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    _imageView = [UIImageView new];
    [self.contentView addSubview:_imageView];
    _imageView.backgroundColor = [UIColor whiteColor];
    [_imageView.layer setCornerRadius:10.0];
    _imageView.layer.masksToBounds = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    _nameLabel = [UILabel new];
    [self.contentView addSubview:_nameLabel];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.font = [UIFont systemFontOfSize:12.0];
    _nameLabel.textColor = [UIColor grayColor];
    _nameLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    

    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(0.0);
        make.leading.and.trailing.equalTo(self.contentView);
        make.bottom.equalTo(self.nameLabel.mas_top).with.offset(-4.0);
    }];
    
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.contentView).offset(-8.0);
        make.right.equalTo(self.contentView).offset(8.0);
        make.bottom.equalTo(self.contentView.mas_bottom);
        CGFloat radio =  30.0/750.0;
        CGFloat offset = [UIScreen mainScreen].bounds.size.width * radio;
        make.height.mas_offset(offset);
    }];
    
    [self layoutIfNeeded];
}

- (void)updateCellWithData:(id)data {
    
}

@end
