//
//  NABlockMemoryManagementDemo.m
//  BlocksDemo
//
//  Created by Nicolas Ameghino on 4/4/14.
//

#import "NABlockMemoryManagementDemo.h"

@implementation NABlockMemoryManagementDemo

-(id) init {
    self = [super init];
    if (self) {
        self.myCopiedBlockProperty = ^{
            NSLog(@"este block siempre va a estar aqui");
        };
        
        self.myStrongBlockProperty = ^{
            NSLog(@"este block puede desaparecer");
            NSLog(@"(o no, depende del entorno)");
        };
        
        void(^localStrongBlock)(void) = ^{
            NSLog(@"este block vive en el stack");
        };
        
        void(^localCopiedBlock)(void) = [^{
            NSLog(@"este block vive en el heap");
        } copy];
        
        
        self.blockQueue = @[localCopiedBlock, localStrongBlock];
        localCopiedBlock = nil;
    }
    return self;
}

-(void) testMethod {
    self.myCopiedBlockProperty();
    self.myStrongBlockProperty();
    for (void(^block)(void) in self.blockQueue) {
        block();
    }
}

@end
