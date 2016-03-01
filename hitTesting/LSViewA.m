//
//  LSViewA.m
//  hitTesting
//
//  Created by liuwp on 16/3/1.
//  Copyright © 2016年 liuwp. All rights reserved.
//

#import "LSViewA.h"

@implementation LSViewA

//- (instancetype)initWithCoder:(NSCoder *)aDecoder{
//    if (self = [super initWithCoder:aDecoder]) {
//        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touch)];
//        [self addGestureRecognizer:gesture];
//    }
//    return self;
//}
//
//- (void)touch{
//    DDNSLog(@"viewA")
//}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    DDNSLog(@"viewA");
    if (self.alpha <= 0.01 || !self.userInteractionEnabled || self.hidden) {
        return nil;
    }
    BOOL inside = [self pointInside:point withEvent:event];
    UIView *hitView = nil;
    if (inside) {
        NSEnumerator *enumerator = [self.subviews reverseObjectEnumerator];
        for (UIView *subview in enumerator) {
            hitView = [subview hitTest:point withEvent:event];
            if (hitView) {
                break;
            }
        }
        if (!hitView) {
            hitView = self;
        }
        DDNSLog(@"hitview=%@",hitView);
        return hitView;
    } else {
        return nil;
    }
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//     DDNSLog(@"viewA");
//    return [super pointInside:point withEvent:event];
//}
@end
