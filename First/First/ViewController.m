//
//  ViewController.m
//  First
//
//  Created by yaoyingtao on 2017/8/2.
//  Copyright © 2017年 yaoyingtao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet GLKView *glkView;
@property (strong, nonatomic) GLKBaseEffect *myEffect;
@property (assign, nonatomic) GLuint buffer;


@end

GLfloat squareVertexData[] =
{
    -0.5, 0.5, 0.0f,
    -0.5, -0.5, 0.0f,
    0.5, 0.5, 0.0f,
    
};

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpConfig];
    [self uploadTexture];
    [self parpateData];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpConfig {
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [self.glkView setContext:context];
//    self.glkView.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    [EAGLContext setCurrentContext:context];
}

- (void)parpateData {
  
    
    GLuint buffer;
    glGenBuffers(1, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(squareVertexData), squareVertexData, GL_STATIC_DRAW);
    self.buffer = buffer;
    
}

- (void)uploadTexture {
    //着色器
    self.myEffect = [[GLKBaseEffect alloc] init];
    self.myEffect.useConstantColor = YES;
    self.myEffect.constantColor = GLKVector4Make(1, 1, 1, 1);
    glClearColor(0, 0, 0, 1);
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    [self.myEffect prepareToDraw];
    glClear(GL_COLOR_BUFFER_BIT);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat) * 3, NULL);
    glDrawArrays(GL_TRIANGLES, 0, 3);
}



@end
