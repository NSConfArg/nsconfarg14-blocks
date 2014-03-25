//
//  NATemplateArrayIterator.m
//  BlocksDemo
//
//  Created by Nicolas Ameghino on 3/25/14.
//  Copyright (c) 2014 Nicolas Ameghino. All rights reserved.
//

#import "NATemplateArrayIterator.h"

@implementation NATemplateArrayIterator

-(void)runOnArray:(NSArray *)array {
    for (id o in array) {
        [self doEach:o];
    }
}

-(void)doEach:(id)object {
    NSString *message = [NSString stringWithFormat:@"\"%@\" must be implemented in a subclass", NSStringFromSelector(_cmd)];
    @throw [NSException exceptionWithName:@"UnimplementedMethodException"
                                   reason:message
                                 userInfo:nil];
}

@end
