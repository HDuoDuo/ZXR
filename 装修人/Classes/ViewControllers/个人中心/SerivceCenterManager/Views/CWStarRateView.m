//
//  CWStarRateView.m
//  StarRateDemo
//
//  Created by WANGCHAO on 14/11/4.
//  Copyright (c) 2014年 wangchao. All rights reserved.
//

#import "CWStarRateView.h"
#import "UIView+MEView.h"

#define FOREGROUND_STAR_IMAGE_NAME @"b27_icon_star_yellow"
#define BACKGROUND_STAR_IMAGE_NAME @"b27_icon_star_gray"
#define DEFALUT_STAR_NUMBER 5
#define ANIMATION_TIME_INTERVAL 0.2

@interface CWStarRateView ()

@property (nonatomic, strong) UIView *foregroundStarView;
@property (nonatomic, strong) UIView *backgroundStarView;
@property (nonatomic, assign) NSInteger numberOfStars;

@end

@implementation CWStarRateView

#pragma mark - Init Methods
- (instancetype)init {
    NSAssert(NO, @"You should never call this method in this class. Use initWithFrame: instead!");
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame numberOfStars:DEFALUT_STAR_NUMBER];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _numberOfStars = DEFALUT_STAR_NUMBER;
        [self buildDataAndUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars {
    if (self = [super initWithFrame:frame]) {
        _numberOfStars = numberOfStars;
        [self buildDataAndUI];
    }
    return self;
}

#pragma mark - Private Methods

- (void)buildDataAndUI {
    _scorePercent = 1;//默认为1
    _hasAnimation = NO;//默认为NO
    _allowIncompleteStar = NO;//默认为NO

    self.foregroundStarView = [self createStarViewWithImage:FOREGROUND_STAR_IMAGE_NAME];
    self.backgroundStarView = [self createStarViewWithImage:BACKGROUND_STAR_IMAGE_NAME];
    
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
}

- (void)userTapRateView:(UITapGestureRecognizer *)gesture {
    CGPoint tapPoint = [gesture locationInView:self];
    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
    CGFloat starScore = self.allowIncompleteStar ? realStarScore : ceilf(realStarScore);
    self.scorePercent = starScore / self.numberOfStars;
}

- (UIView *)createStarViewWithImage:(NSString *)imageName {
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    for (NSInteger i = 0; i < self.numberOfStars; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * self.bounds.size.width / self.numberOfStars, 0, self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak CWStarRateView *weakSelf = self;
    CGFloat animationTimeInterval = self.hasAnimation ? ANIMATION_TIME_INTERVAL : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
       weakSelf.foregroundStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.scorePercent, weakSelf.bounds.size.height);
    }];
}

#pragma mark - Get and Set Methods

- (void)setScorePercent:(CGFloat)scroePercent {
    if (_scorePercent == scroePercent) {
        return;
    }
    
    if (scroePercent < 0) {
        _scorePercent = 0;
    } else if (scroePercent > 1) {
        _scorePercent = 1;
    } else {
        _scorePercent = scroePercent;
    }
    
    if ([self.delegate respondsToSelector:@selector(starRateView:scroePercentDidChange:)]) {
        [self.delegate starRateView:self scroePercentDidChange:scroePercent];
    }
    
    [self setNeedsLayout];
}

#pragma  mark ---------
// 默认有五个星星
- (instancetype)initWithFrame:(CGRect)frame
                    starIndex:(NSInteger)index
                    starWidth:(CGFloat)starWidth
                        space:(CGFloat)space
                 defaultImage:(UIImage *)defaultImage
                   lightImage:(UIImage *)lightImage
                     isCanTap:(BOOL)isCanTap{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        if (defaultImage) {
            self.defaultImage = defaultImage;
        } else {
            self.defaultImage = [UIImage imageNamed:@"b27_icon_star_gray"];
        }
        
        if (lightImage) {
            self.lightImage = lightImage;
        } else {
            self.lightImage = [UIImage imageNamed:@"b27_icon_star_yellow"];
        }
        
        for (NSInteger j = 0; j < 5; j++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(j* (starWidth + space), 0, starWidth, self.height)];
            
            btn.enabled = isCanTap;
            btn.tag = j + 1;
            [btn addTarget:self action:@selector(starTapBtn:) forControlEvents:UIControlEventTouchUpInside];
            // 上左下右 星星居中
            [btn setImageEdgeInsets:UIEdgeInsetsMake((self.height - starWidth)/2, 0, (self.height - starWidth)/2, 0)];
            if (j < index) {
                [btn setImage:self.lightImage forState:UIControlStateNormal];
            } else {
                [btn setImage:self.defaultImage forState:UIControlStateNormal];
            }
            [self addSubview:btn];
            
            // self.width
            self.width = (starWidth + space) * 5;
        }
    }
    return self;
}

- (void)starTapBtn:(UIButton *)btn{
    
    for (NSInteger i = 1; i <= 5; i++) {
        UIButton *starBtn = (UIButton *)[self viewWithTag:i];
        if (i <= btn.tag) {
            [starBtn setImage:self.lightImage forState:UIControlStateNormal];
        } else {
            [starBtn setImage:self.defaultImage forState:UIControlStateNormal];
        }
    }
    
    if (self.starEvaluateBlock) {
        self.starEvaluateBlock(self,btn.tag);
    }
}


@end
