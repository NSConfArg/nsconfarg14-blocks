//
//  NABlocksSyntaxDemo.m
//  BlocksDemo
//
//  Created by Nicolas Ameghino on 4/5/14.
//

#import "NABlocksSyntaxDemo.h"

typedef void(^GreeterBlock)(NSString*);

@interface NABlocksSyntaxDemo ()
@property(nonatomic, strong) NSString *name;
@end

@implementation NABlocksSyntaxDemo


-(void) play {
    
    // Creacion de bloques sin typedef
    void(^italianGreeter)(NSString*) = ^void(NSString* name) {
        NSLog(@"Ciao, %@", name);
    };
    
    // Uso de typedefs para simplificar la creacion de bloques
    GreeterBlock englishGreeter = ^void(NSString* name) {
        NSLog(@"Hello, %@", name);
    };
    GreeterBlock spanishGreeter = ^void(NSString* name) {
        NSLog(@"Hola, %@", name);
    };
    
    // Ejecucion de bloques
    italianGreeter(@"Lorenzo");
    spanishGreeter(@"Nicolas");
    englishGreeter(@"Steve");
    
    // Mensaje que recibe un bloque como parametro,
    // definido anteriormente en una variable
    [self greet:@"Mariano" afterDelay:1.0f usingBlock:spanishGreeter];
    
    // Mensaje que recibe un bloque como parametro,
    // definido anteriormente en una variable y
    // utilizando un typedef en la firma
    [self greet:@"Roger" afterDelay:1.0f usingTypedefBlock:englishGreeter];
    
    // Mensaje que recibe un bloque como parametro,
    // definido en la misma llamada
    [self greet:@"Hans" afterDelay:1.0f usingBlock:^(NSString *name) {
        NSLog(@"Hallo, %@", name);
    }];
    
    __weak typeof(self) weakSelf = self;
    void(^propertyGreeter)(void) = ^{
        NSLog(@"Hola, %@", weakSelf.name);
    };
    
    propertyGreeter();
}

-(void) blocksAPI {
    NSArray *array = @[@(4), @(8), @(15), @(16), @(23), @(42)];
    [array enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"index %d: %@", idx, [obj description]);
        if (idx == 3) {
            *stop = YES;
        }
    }];
    
    NSPredicate *predicate =
    [NSPredicate predicateWithBlock:
     ^BOOL(id evaluatedObject, NSDictionary *bindings) {
         NSNumber *number = (NSNumber*) evaluatedObject;
         NSInteger n = [number integerValue];
         return n % 2 == 0;
     }];
    
    NSArray *pares = [array filteredArrayUsingPredicate:predicate];
    
    NSOperationQueue *opQueue = [[NSOperationQueue alloc] init];
    [[NSNotificationCenter defaultCenter]
     addObserverForName:nil
     object:nil
     queue:opQueue
     usingBlock:^(NSNotification *note) {
         NSLog(@"%@", note.name);
     }];
    
    NSURLRequest *request;
    [NSURLConnection
     sendAsynchronousRequest:request
     queue:opQueue
     completionHandler:^(NSURLResponse *response,
                         NSData *data,
                         NSError *connectionError) {
         if (connectionError) {
             NSLog(@"%@",
                   [connectionError localizedDescription]);
             return;
         }
         NSHTTPURLResponse *httpResponse = response;
         if (httpResponse.statusCode == 200) {
             NSLog(@"received data: %@", data);
         }
     }];
    
}

-(void) blockModifier {
    __block int x = 0;
    void(^incrementBlock)(void) = ^{
        x++;
    };
    incrementBlock(); // x = 1
    incrementBlock(); // x = 2
    incrementBlock(); // x = 3
}

-(void) play2 {
    UIView *view = [[UIView alloc] initWithFrame:
                    CGRectMake(0, 0, 100, 100)];
    [UIView animateWithDuration:1.0f animations:^{
        view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}

// Definicion de un metodo que recibe un block como parametro, sin typedef
-(void) greet:(NSString*) who
   afterDelay:(NSTimeInterval) interval
   usingBlock:(void(^)(NSString*)) block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        block(who);
    });
}

// Definicion de un metodo que recibe un block como parametro, con typedef
-(void) greet:(NSString*) who
   afterDelay:(NSTimeInterval)interval
usingTypedefBlock:(GreeterBlock) block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        block(who);
    });
}

@end
