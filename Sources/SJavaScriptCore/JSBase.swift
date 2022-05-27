
import JavaScriptCore

/* JavaScript engine interface */

/** @typedef JSContextGroupRef A group that associates JavaScript contexts with one another. Contexts in the same group may share and exchange JavaScript objects. */
public typealias JSContextGroupRef = OpaquePointer

/** @typedef JSContextRef A JavaScript execution context. Holds the global object and other execution state. */
public typealias JSContextRef = OpaquePointer

/** @typedef JSGlobalContextRef A global JavaScript execution context. A JSGlobalContext is a JSContext. */
public typealias JSGlobalContextRef = OpaquePointer

/** @typedef JSStringRef A UTF16 character buffer. The fundamental string representation in JavaScript. */
public typealias JSStringRef = OpaquePointer

/** @typedef JSClassRef A JavaScript class. Used with JSObjectMake to construct objects with custom behavior. */
public typealias JSClassRef = OpaquePointer

/** @typedef JSPropertyNameArrayRef An array of JavaScript property names. */
public typealias JSPropertyNameArrayRef = OpaquePointer

/** @typedef JSPropertyNameAccumulatorRef An ordered set used to collect the names of a JavaScript object's properties. */
public typealias JSPropertyNameAccumulatorRef = OpaquePointer

/** @typedef JSTypedArrayBytesDeallocator A function used to deallocate bytes passed to a Typed Array constructor. The function should take two arguments. The first is a pointer to the bytes that were originally passed to the Typed Array constructor. The second is a pointer to additional information desired at the time the bytes are to be freed. */
public typealias JSTypedArrayBytesDeallocator = @convention(c) (UnsafeMutableRawPointer?, UnsafeMutableRawPointer?) -> Void

/* JavaScript data types */

/** @typedef JSValueRef A JavaScript value. The base type for all JavaScript values, and polymorphic functions on them. */
public typealias JSValueRef = OpaquePointer

/** @typedef JSObjectRef A JavaScript object. A JSObject is a JSValue. */
public typealias JSObjectRef = OpaquePointer

/* Clang's __has_declspec_attribute emulation */
/* https://clang.llvm.org/docs/LanguageExtensions.html#has-declspec-attribute */

/* JavaScript symbol exports */
/* These rules should stay the same as in WebKit/Shared/API/c/WKDeclarationSpecifiers.h */

/* !defined(JS_NO_EXPORT) */

/* defined(JS_NO_EXPORT) */

/* Script Evaluation */

/**
@function JSEvaluateScript
@abstract Evaluates a string of JavaScript.
@param ctx The execution context to use.
@param script A JSString containing the script to evaluate.
@param thisObject The object to use as "this," or NULL to use the global object as "this."
@param sourceURL A JSString containing a URL for the script's source file. This is used by debuggers and when reporting exceptions. Pass NULL if you do not care to include source file information.
@param startingLineNumber An integer value specifying the script's starting line number in the file located at sourceURL. This is only used when reporting exceptions. The value is one-based, so the first line is line 1 and invalid values are clamped to 1.
@param exception A pointer to a JSValueRef in which to store an exception, if any. Pass NULL if you do not care to store an exception.
@result The JSValue that results from evaluating script, or NULL if an exception is thrown.
*/
public func JSEvaluateScript(_ ctx: JSContextRef!, _ script: JSStringRef!, _ thisObject: JSObjectRef!, _ sourceURL: JSStringRef!, _ startingLineNumber: Int32, _ exception: UnsafeMutablePointer<JSValueRef?>!) -> JSValueRef!

/**
@function JSCheckScriptSyntax
@abstract Checks for syntax errors in a string of JavaScript.
@param ctx The execution context to use.
@param script A JSString containing the script to check for syntax errors.
@param sourceURL A JSString containing a URL for the script's source file. This is only used when reporting exceptions. Pass NULL if you do not care to include source file information in exceptions.
@param startingLineNumber An integer value specifying the script's starting line number in the file located at sourceURL. This is only used when reporting exceptions. The value is one-based, so the first line is line 1 and invalid values are clamped to 1.
@param exception A pointer to a JSValueRef in which to store a syntax error exception, if any. Pass NULL if you do not care to store a syntax error exception.
@result true if the script is syntactically correct, otherwise false.
*/
public func JSCheckScriptSyntax(_ ctx: JSContextRef!, _ script: JSStringRef!, _ sourceURL: JSStringRef!, _ startingLineNumber: Int32, _ exception: UnsafeMutablePointer<JSValueRef?>!) -> Bool

/**
@function JSGarbageCollect
@abstract Performs a JavaScript garbage collection.
@param ctx The execution context to use.
@discussion JavaScript values that are on the machine stack, in a register,
 protected by JSValueProtect, set as the global object of an execution context,
 or reachable from any such value will not be collected.

 During JavaScript execution, you are not required to call this function; the
 JavaScript engine will garbage collect as needed. JavaScript values created
 within a context group are automatically destroyed when the last reference
 to the context group is released.
*/
public func JSGarbageCollect(_ ctx: JSContextRef!)

/* Enable the Objective-C API for platforms with a modern runtime. NOTE: This is duplicated in VM.h. */

public var JSC_OBJC_API_ENABLED: Int32 { get }
