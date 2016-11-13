//
//  ViewController.m
//  FIngerPaint
//
//  Created by Hamza Lakhani on 2016-11-11.
//  Copyright © 2016 Hamza Lakhani. All rights reserved.
//

#import "ViewController.h"
#import "Drawing.h"
#import "PaintPoint.h"
#import "Lines.h"
#import "Line.h"

@interface ViewController ()
// remove outlet
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
//@property (nonatomic) Lines *lines;
@property (weak, nonatomic) IBOutlet Drawing *drawingView;
@property (nonatomic) Line *line;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    
}
- (IBAction)blueColor:(id)sender {
    [self.view blueStroke:[sender Blue:self.view]];
}
- (IBAction)redColor:(id)sender {
}
- (IBAction)yellowColor:(id)sender {
}
- (IBAction)orangeColor:(id)sender {
}
- (IBAction)greenColor:(id)sender {
}
- (IBAction)blackColor:(id)sender {
}


// when location in point

- (IBAction)panLines:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.line = [Line new];
        [self.drawingView.lines.line addObject:self.line];
    }

    if (sender.state == UIGestureRecognizerStateChanged) {

        CGPoint point = [sender locationInView:self.drawingView];
        PaintPoint *paintPoint = [[PaintPoint alloc]initWithPoint:point];
        //paintpoints is the array in line class not the abpove variable init;
        [self.line.paintPoints addObject:paintPoint];
        [self.drawingView setNeedsDisplay];//causes it to call draw rect
    }
    
}


@end
