//
//   Copyright 2012 Square Inc.
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//

#import <Foundation/Foundation.h>
#import <Security/SecCertificate.h>

typedef enum {
        SIO_CONNECT   = 1,
        SIO_HEARTBEAT = 2,
        SIO_MESSAGE   = 3,
        SIO_JSON_MESSAGE = 4,
        SIO_EVENT        = 5,
        SIO_ACK          = 6,
        SIO_ERROR        = 7,
        SIO_NOOP        = 8,
} SIOMessageID;

typedef enum {
    SR_CONNECTING   = 0,
    SR_OPEN         = 1,
    SR_CLOSING      = 2,
    SR_CLOSED       = 3,
    
} SRReadyState;

@class SRWebSocket;

extern NSString *const SRWebSocketErrorDomain;

@protocol SRWebSocketDelegate;

@interface SRWebSocket : NSObject <NSStreamDelegate> {
    BOOL isSocketIO;
    NSString  *sessionId;
    NSInteger *closeTimeout;
    NSInteger *heartbeatTimeout;
    /* needed to complete the socketIO handshake */
    NSURLConnection *urlConnection;
    NSMutableData *responseData;
    NSString *sessionURL; /* url of connection after fully established */
    NSString *hostURL;
}

@property (nonatomic, assign) id <SRWebSocketDelegate> delegate;

@property (nonatomic, readonly) SRReadyState readyState;
@property (nonatomic, readonly, retain) NSURL *url;

// This returns the negotiated protocol.
// It will be niluntil after the handshake completes.
@property (nonatomic, readonly, copy) NSString *protocol;

// Protocols should be an array of strings that turn into Sec-WebSocket-Protocol
- (id)initWithURLRequest:(NSURLRequest *)request protocols:(NSArray *)protocols;
- (id)initWithURLRequest:(NSURLRequest *)request;
- (id)initWithSocketIO:(NSString *) baseUrl;

// Some helper constructors
- (id)initWithURL:(NSURL *)url protocols:(NSArray *)protocols;
- (id)initWithURL:(NSURL *)url;

// SRWebSockets are intended one-time-use only.  Open should be called once and only once
- (void)open;

- (void)close;
- (void)closeWithCode:(NSInteger)code reason:(NSString *)reason;

// Send a UTF8 String or Data
- (void)send:(id)data;

//Send a socketIO event
- (void) sendEvent : (NSString *) name : (NSDictionary *) payload;

@end

@protocol SRWebSocketDelegate <NSObject>

// message will either be an NSString if the server is using text 
// or NSData if the server is using binary
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message;

@optional

- (void)webSocketDidOpen:(SRWebSocket *)webSocket;
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error;
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean;

- (void) webSocket:(SRWebSocket *)webSocket didReceiveEvent:(id) event name:(NSString *)name;

@end


@interface NSURLRequest (CertificateAdditions)

@property (nonatomic, retain, readonly) NSArray *SR_SSLPinnedCertificates;

@end


@interface NSMutableURLRequest (CertificateAdditions)

@property (nonatomic, retain) NSArray *SR_SSLPinnedCertificates;

@end
