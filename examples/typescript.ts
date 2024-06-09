// This is a single-line comment

/*
  This is a multi-line comment
  describing the following code.
*/

/**
 * This is a documentation comment (JSDoc/TSDoc)
 *
 * @param x - A number
 * @returns The square of the number
 */
function square(x: number): number {
  return x * x; // returning the square of the input number
}

square(5); // calling the function

import { Component } from "react"; // import statement

const myConstant: string = "Hello, World!"; // string literal
let myVariable: number = 42; // number literal
let isDone: boolean = false; // boolean literal

// Regular expression
const regex: RegExp = /ab+c/;

enum Color { // enum declaration
  Red,
  Green,
  Blue,
}

let color: Color = Color.Green; // enum member

type User = {
  // type alias
  id: number; // property
  name: string; // property
  isActive: boolean; // property
};

interface IUser {
  // interface declaration
  id: number; // property
  name: string; // property
  isActive: boolean; // property
}

class Greeter {
  // class declaration
  private greeting: string; // private property

  constructor(message: string) {
    // constructor
    this.greeting = message; // 'this' keyword
  }

  @logMethod // decorator
  public greet(): string {
    // public method
    return `Hello, ${this.greeting}`; // template string
  }

  public static log(): void {
    // static method
    console.log("Logging..."); // function call
  }
}

function logMethod(
  target: any,
  propertyKey: string,
  descriptor: PropertyDescriptor,
) {
  const originalMethod = descriptor.value;
  descriptor.value = function (...args: any[]) {
    console.log(`Calling ${propertyKey} with args: ${args}`);
    return originalMethod.apply(this, args);
  };
}

// Function with parameters and return type
function add(a: number, b: number): number {
  return a + b; // addition operator
}

// Using an array
const numbers: number[] = [1, 2, 3, 4, 5];

// Iterating with for-of loop
for (const num of numbers) {
  console.log(num); // logging each number
}

// Using a Map
const map: Map<string, number> = new Map();
map.set("one", 1);
map.set("two", 2);
map.set("three", 3);

// Template strings with interpolation
const userName: string = "Alice";
console.log(`User name is ${userName}`); // logging with template string

// Type assertion
let someValue: any = "this is a string";
let strLength: number = (someValue as string).length;

// Using 'any' type
let randomValue: any = 4;
randomValue = "maybe a string instead";

// Type guard with 'typeof'
if (typeof randomValue === "string") {
  console.log(`Random value is a string of length ${randomValue.length}`);
}

// Nullable types
let nullableString: string | null = null;

// Function with rest parameters
function sum(...args: number[]): number {
  return args.reduce((previous, current) => previous + current);
}

// Function with destructuring in parameters
function printUser({
  id,
  name,
  isActive,
}: {
  id: number;
  name: string;
  isActive: boolean;
}) {
  console.log(`User ID: ${id}, Name: ${name}, Active: ${isActive}`);
}

// Function with default parameters
function greet(name: string = "stranger"): string {
  return `Hello, ${name}`;
}
