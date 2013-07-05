//
//  ITLibrary.m
//  ITBook
//
//  Created by SkyLORD on 04.07.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

// <challenge the directive #import, shall connect a type library that describes the use of COM interfaces>
#import "ITLibrary.h"
#import "ITBook.h"
#import "Person.h"

NSString *const kLibraryBooksKey = @"books";
NSString *const kLibraryPersonsKey = @"persons";

//* <These directives provide the scoping information the compiler needs to associate the enclosed methods with the corresponding class. A method’s definition therefore matches its corresponding declaration in the interface, except for the inclusion of a code block.> *//
@implementation ITLibrary

// <compiler directive to ask the compiler to generate the methods according to the specification in the declaration>
@synthesize books=_books, persons=_persons;

// ad method declararation for variable "addBook":
- (void)addBook:(ITBook *)aBook;
{
	[self.books addObject:aBook];
}

// ad method declararation for variable "removeBook":
- (void)removeBook:(ITBook *)aBook;
{
	[self.books removeObject:aBook];
}

// ad method declararation for variable "addPerson":
- (void)addPerson:(Peron *)aPerson;
{
	[self.persons addObject:aPerson];
}

// ad method declararation for variable "aremovePerson":
- (void)removePerson:(Person *)aPerson;
{
	[self.persons removeObject:aPerson];
}

// the directive "#pragma mark" adds a new line to the "Function menu"
#pragma mark -

/*
// ad method declararation for variable "dict":
- (id)initWithDictionaryRepresentation:(NSDictionary *)aDict
{
	self = [super init];
	if (self)
	{
		self.books = [aDict objectForKey:kLibraryBooksKey];
		self.persons = [aDict objectForKey:kLibraryPersonsKey];
		[self.books addObjectsFromArray:[aDict objectForKey:@"books"]];
	}
	return self;
}
*/

// ad method declararation for variable "representation":
- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *theRepresentation = [NSMutableDictionary dictionary];
	if (nil != self.self.books)
	{
		[theRepresentation setObject:self.books forKey:kLibraryBooksKey];
	}
	if (nil != self.persons)
	{
		[theRepresentation setObject:self.persons forKey:kLibraryPersonsKey];
	}
	return [[theRepresentation copy] autorelease];
}


// free the memory:
- (void)dealloc
{
	[_books release];
	[_persons release];
	
	[super dealloc];
}

// ad lazy initialization for variable "books"
-(NSMutableArray *)books
{
	if (nil == _books)
	{
		_books = [NSMutableArray new];
	}
	return _books;
}

// ad lazy initialization for variable "persons"
-(NSMutableArray *)persons
{
	if (nil == _persons)
	{
		_persons = [NSMutableArray new];
	}
	return _persons;
}

@end
