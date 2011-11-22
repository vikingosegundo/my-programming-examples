//
//  main.m
//  polly
//
//  Created by Manuel Meyer on 10.10.11.
//  Copyright 2011 apparatschik. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * 1.: Polymorphism via subclassing	
 */
@interface MyBaseClass : NSObject
-(void)printName;
+(NSString*)printableName;
@end

@implementation MyBaseClass

+(NSString *)printableName
{
	return NSStringFromClass(self);
}

-(void)printName
{
	NSLog(@"%@", [[self class] printableName]);
}

@end


@interface MySubBaseClass : MyBaseClass
@end

@implementation MySubBaseClass
@end


/*
 * 2.: Polymorphism via formal protocol	
 */

@protocol PrintProtocol <NSObject>
-(void)print;
@end

@interface MyOtherBaseClass : NSObject <PrintProtocol>
@end

@implementation MyOtherBaseClass
-(void)print
{
	NSLog(@"I am a objects of %@", NSStringFromClass([self class]));
}
@end

@interface MyThirdBaseClass : NSObject <PrintProtocol>
@end

@implementation MyThirdBaseClass
-(void)print
{
	NSLog(@"It isnt ur business, that i am a object of %@", NSStringFromClass([self class]));
}
@end


/*
 * 3.: Polymorphism via informal protocol	
 */
@interface LastObject : NSObject
-(void)print;
@end

@implementation LastObject
-(void)print
{
	NSLog(@"I am a %@", NSStringFromClass([self class]));
}

@end
int main (int argc, const char * argv[])
{
	
	/*
	 * 1.: Polymorphism via subclassing. As seen in any Class-aware OO-language
	 */
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	MyBaseClass *myBaseObject = [[MyBaseClass alloc] init];
	[myBaseObject printName];
	[myBaseObject release];
	
	MySubBaseClass *mySubBaseObject = [[MySubBaseClass alloc] init];
	[mySubBaseObject printName];
	[mySubBaseObject release];
	
	/*
	 * 2.: Polymorphism via protocol	
	 */
	
	//we asure, that our object will be implementig the PrintProtocol
	//no further check needed
	id<PrintProtocol> myOtherClassObject = [[MyOtherBaseClass alloc] init];
	id<PrintProtocol> myThirdClassObject = [[MyThirdBaseClass alloc] init];
	
	[myOtherClassObject print];
	[myThirdClassObject print];
	
	[myOtherClassObject release];
	[myThirdClassObject release];
	
	
	
	//this might crash, as the id is not necessery implementing the protocol
	id aUnknowObject1 = [[MyOtherBaseClass alloc] init];
	id aUnknowObject2 = [[MyThirdBaseClass alloc] init];
	
	[aUnknowObject1 print];
	[aUnknowObject2 print];	
	
	//but we can ask an object, if it is implemntig the protocol
	if ([aUnknowObject1 conformsToProtocol:@protocol(PrintProtocol)]) {
		[aUnknowObject1 print];
	}
	
	if ([aUnknowObject2 conformsToProtocol:@protocol(PrintProtocol)]) {
		[aUnknowObject2 print];
	}
	
	
	//but truth to be told: We dont care about protocols! we just want to know, if a certain message can be send.
	LastObject *lastObject = [[LastObject alloc] init];
	
	if ([aUnknowObject1 respondsToSelector:@selector(print)]) {
		[aUnknowObject1 print];
	}
	
	if ([aUnknowObject2 respondsToSelector:@selector(print)]) {
		[aUnknowObject2 print];
	}
	
	//3.: Polymorphism via informal protocol	
	//Does not conform to the protocol, but knows to handle the message
	if ([lastObject respondsToSelector:@selector(print)]) {
		[lastObject print];
	}
	
	
	
	[aUnknowObject1 release];
	[aUnknowObject2 release];	
	[lastObject release];
	
	[pool drain];
    return 0;
}

