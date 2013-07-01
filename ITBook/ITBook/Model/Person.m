//
//  Person.m
//  ITBook
//
//  Created by SkyLORD on 29.06.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

// <challenge the directive #import, shall connect a type library that describes the use of COM interfaces>
			#import "Person.h"
#import "ITBook.h"

			NSString *const kPersonFirstNameKey = @"firstName";
			NSString *const kPersonLastNameKey = @"lastName";

//* <These directives provide the scoping information the compiler needs to associate the enclosed methods with the corresponding class. A method’s definition therefore matches its corresponding declaration in the interface, except for the inclusion of a code block.> *//
			@implementation Person

// <compiler directive to ask the compiler to generate the methods according to the specification in the declaration>
			@synthesize firstName = _firstName, lastName = _lastName;

// ad method declararation for variable "firstName":
			- (id)initWithFirstName:(NSString *)aFirstName
						{
								return [self initWithFirstName:aFirstName lastName:nil];
						}

// ad method declararation for variable "lastName":
			- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName
						{
								if (self = [super init])
                                {
                                    self.firstName = aFirstName;
                                    self.lastName = aLastName;
                                }
                            
                            return self;
						}

//the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

// ad method declararation for variable "dict":
			- (id)initWithDictionaryRepresentation:(NSDictionary *)aDict
						{
								self = [super init];
								if (self)
								{
										self.firstName = [aDict objectForKey:kPersonFirstNameKey];
										self.lastName = [aDict objectForKey:kPersonLastNameKey];
                                    [self.books addObjectsFromArray:[aDict objectForKey:@"books"]];
								}
	
								return self;
						}

// ad method declararation for variable "representation":
			- (NSDictionary *)dictionaryRepresentation
						{
								NSMutableDictionary *theRepresentation = [NSMutableDictionary dictionary];
	
                            if (nil != self.firstName)
                            {
										[theRepresentation setObject:self.firstName forKey:kPersonFirstNameKey];
                            }
								if (nil != self.lastName)
								{
										[theRepresentation setObject:self.lastName forKey:kPersonLastNameKey];
								}
	
								return [[theRepresentation copy] autorelease];
						}


// free the memory:
			- (void)dealloc
						{
								[_firstName release];
								[_lastName release];
                            [_books makeObjectsPerformSelector:@selector(setPerson:) withObject:nil];
                            [_books release];
	
								[super dealloc];
						}

// the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

- (NSMutableArray *)books
{
    if (nil == _books)
    {
        _books = [NSMutableArray new];
    }
    
    return _books;
}
// the directive "#pragma mark" adds a new line to the "Function menu"
			#pragma mark -

- (NSString *)description
						{

								return [NSString stringWithFormat:@"FirstName:%@ LastName:%@.", self.firstName, self.lastName];
						}

- (void)borrowBook:(ITBook *)aBook
{
    // add book to array
    [self.books addObject:aBook];
    // set book person self

}

- (void)giveInBook:(ITBook *)aBook
{
    //set bosok person nil
    // remove from array
    [self.books removeObject:aBook];
}


			@end
