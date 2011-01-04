#import "NewViewController.h"

@interface NewViewController ()
@property(retain) NSString *name;
@end

@implementation NewViewController
@synthesize label;
@synthesize name;

-(id) initWithString:(NSString *)string
{
	if (self = [super initWithNibName:@"NewViewController" bundle:nil]) {
		self.name = string;
	}
	return self;
}

-(void) viewDidLoad
{
	self.label.text = self.name;
}

-(void) viewDidUnload
{
	[super viewDidUnload];
	self.name = nil;
}

- (void)dealloc {
	[name release];
	[label release];
	[super dealloc];
}


@end
