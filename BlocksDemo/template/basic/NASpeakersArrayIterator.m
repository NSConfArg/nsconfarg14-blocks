//
//  NASpeakersArrayIterator.m
//  BlocksDemo
//
//  Created by Nicolas Ameghino on 3/25/14.
//  Copyright (c) 2014 Nicolas Ameghino. All rights reserved.
//

#import "NASpeakersArrayIterator.h"

@implementation NASpeakersArrayIterator

-(void)doEach:(id)object {
    NSString *message = [NSString stringWithFormat:@"speakers template iterator: %@", object];
    self.textView.text = [self.textView.text stringByAppendingFormat:@"%@\n", message];
}

@end
