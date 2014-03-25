//
//  NABlockyArrayIterator.m
//  BlocksDemo
//
//  Created by Nicolas Ameghino on 3/25/14.
//  Copyright (c) 2014 Nicolas Ameghino. All rights reserved.
//

#import "NABlockyArrayIterator.h"

@implementation NABlockyArrayIterator

-(void)runOnArray:(NSArray *)array {
    if (!self.doEachBlock) {
        @throw [NSException exceptionWithName:@"NoDoEachBlockException"
                                       reason:@"A DoEach block must be supplied"
                                     userInfo:nil];
    }
    for (id o in array) {
        self.doEachBlock(o);
    }
}

@end
