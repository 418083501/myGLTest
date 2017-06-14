//
//  XXOpenGLView.m
//  OPEN GL DEMO
//
//  Created by 鹿容 on 2017/6/14.
//  Copyright © 2017年 鹿容. All rights reserved.
//

#import "XXOpenGLView.h"

@interface XXOpenGLView ()
{
    GLint _width;
    GLint _height;
    EAGLContext *_context;
    GLKBaseEffect *_effect;
    
    GLKView *_rederView;
}

@end

@implementation XXOpenGLView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
        if (!_context) {
            NSLog(@"初始化 context 失败");
        }
        
        _rederView = [[GLKView alloc] initWithFrame:self.bounds context:_context];
        _rederView.drawableDepthFormat = GLKViewDrawableDepthFormat24;
        
        [self setUpGL];
        
    }
    return self;
}

-(void)setUpGL
{
    [EAGLContext setCurrentContext:_context];
}

-(void)disAbleGl
{
    if ([EAGLContext currentContext] == _context) {
        [EAGLContext setCurrentContext:nil];
    }
    _context = nil;
}

@end
