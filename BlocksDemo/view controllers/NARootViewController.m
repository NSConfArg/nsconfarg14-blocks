//
//  NARootViewController.m
//  BlocksDemo
//
//  Created by Nicolas Ameghino on 3/25/14.
//  Copyright (c) 2014 Nicolas Ameghino. All rights reserved.
//

#import "NARootViewController.h"
#import "NASpeakersArrayIterator.h"
#import "NATopicsArrayIterator.h"
#import "NABlockyArrayIterator.h"

@interface NARootViewController ()

@property(nonatomic, strong) UITextView* textView;

@property(nonatomic, strong) NSArray *speakers;
@property(nonatomic, strong) NSArray *topics;

@end

@implementation NARootViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _speakers = @[@"Julio Carretoni", @"Ezequiel Aceto", @"Gonzalo Larralde", @"Nicolas Ameghino"];
        _topics = @[@"Performance", @"iBeacons", @"Peer to peer", @"Blocks"];
    }
    return self;
}

-(void)loadView {
    [super loadView];
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    _textView.editable = NO;
    [self.view addSubview:_textView];
}

-(void)viewWillAppear:(BOOL)animated {
    self.textView.text = @"ready\n";
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(run:)
                                   userInfo:nil
                                    repeats:NO];
}

-(void) run:(id) sender {
    NATemplateArrayIterator *speakersArrayIterator = [[NASpeakersArrayIterator alloc] init];
    speakersArrayIterator.textView = self.textView;
    [speakersArrayIterator runOnArray:self.speakers];
    
    NATemplateArrayIterator *topicsArrayIterator = [[NATopicsArrayIterator alloc] init];
    topicsArrayIterator.textView = self.textView;
    [topicsArrayIterator runOnArray:self.topics];
    
    NABlockyArrayIterator *speakersBlockyArrayIterator = [[NABlockyArrayIterator alloc] init];
    __weak NARootViewController* weakSelf = self;
    speakersBlockyArrayIterator.doEachBlock = ^(id o) {
        weakSelf.textView.text = [weakSelf.textView.text stringByAppendingFormat:@"%@\n", o];
    };
    
    [speakersBlockyArrayIterator runOnArray:self.speakers];
    
    speakersBlockyArrayIterator.doEachBlock = ^(id obj)
    {
        NSLog(@"%@", obj);
    };
    
    [speakersBlockyArrayIterator runOnArray:self.topics];
    
}

@end
