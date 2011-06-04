//
//  UINavigationBar+IECustomDrawRect.m
//  CustomNavigationBar
//
//  Created by Igor Evsukov on 04.06.11.
//  Copyright 2011 Igor Evsukov. All rights reserved.
//

#import "UINavigationBar+IECustomDrawRect.h"
#include <objc/runtime.h>

@implementation UINavigationBar (IECustomDrawRect)

+ (void)load {
	Log(@"exchange methods implementations");
    Method originalMethod = class_getInstanceMethod([self class], @selector(drawRect:));
    Method fixedMethod = class_getInstanceMethod([self class], @selector(ie_customDrawRect:));
    method_exchangeImplementations(originalMethod, fixedMethod);
}


- (void)ie_customDrawRect:(CGRect)rect {
    //calling original drawRect
    [self ie_customDrawRect:rect];
    
    if (self.tag != 0) {
        UIImage *image = [UIImage imageNamed:@"navigationBar_background.png"];
        [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
}

@end
