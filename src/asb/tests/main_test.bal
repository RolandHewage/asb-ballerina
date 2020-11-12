import ballerina/io;
import ballerina/test;

// Connection Configuration
string connectionString = "Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk=";
string content = "This is My Message Body"; 
string queuePath = "roland1queue";
string topicPath = "roland1topic";
string subscriptionPath1 = "roland1topic/subscriptions/roland1subscription1";
string subscriptionPath2 = "roland1topic/subscriptions/roland1subscription2";
string subscriptionPath3 = "roland1topic/subscriptions/roland1subscription3";
int maxMessageCount = 3;

# Before Suite Function
@test:BeforeSuite
function beforeSuiteFunc() {
    io:println("I'm the before suite function!");
}

# Publish and subscribe messages to topics and subscriptions
@test:Config{enable: false}
function testPublishAndSubscribe() {
    TestClient testClient = new();
    var s1 = testClient.sendToTopic(connectionString,topicPath,content);
    var r1 = testClient.readFromSubscription(connectionString,subscriptionPath1);
    var r2 = testClient.readFromSubscription(connectionString,subscriptionPath2);
    var r3 = testClient.readFromSubscription(connectionString,subscriptionPath3);
}

# Send and receive message to and from queue
@test:Config{enable: false}
function testSendAndReceive() {
    TestClient testClient = new();
    var s2 = testClient.sendToQueue(connectionString, queuePath, content);
    var r4 = testClient.readFromQueue(connectionString,queuePath);
}

# Publish and subscribe batch of messages to topics and subscriptions
@test:Config{enable: false}
function testPublishAndSubscribeBatch() {
    TestClient testClient = new();
    var s3 = testClient.sendBatchToTopic(connectionString,topicPath,content,maxMessageCount);
    var r5 = testClient.readBatchFromSubscription(connectionString,subscriptionPath1,maxMessageCount);
    var r6 = testClient.readBatchFromSubscription(connectionString,subscriptionPath2,maxMessageCount);
    var r7 = testClient.readBatchFromSubscription(connectionString,subscriptionPath3,maxMessageCount);
}

# Send and receive batch of messages to and from queue
@test:Config{enable: false}
function testSendAndReceiveBatch() {
    TestClient testClient = new();
    var s4 = testClient.sendBatchToQueue(connectionString,queuePath,content, maxMessageCount);
    var r8 = testClient.readBatchFromQueue(connectionString,queuePath, maxMessageCount);
}

# Complete all the messages & delete from subscription
@test:Config{enable: false}
function testCompleteAllFromSubscription() {
    TestClient testClient = new();
    var s5 = testClient.sendToTopic(connectionString,topicPath,content);
    var r9 = testClient.completeFromSubscription(connectionString,subscriptionPath1);
    var r10 = testClient.completeFromSubscription(connectionString,subscriptionPath2);
    var r11 = testClient.completeFromSubscription(connectionString,subscriptionPath3);
}

# Complete all the messages & delete from queue
@test:Config{enable: false}
function testCompleteAllFromQueue() {
    TestClient testClient = new();
    var s6 = testClient.sendToQueue(connectionString,queuePath,content);
    var r12 = testClient.completeFromQueue(connectionString,queuePath);
}

# Complete single message & delete from subscription
@test:Config{enable: false}
function testCompleteOneFromSubscription() {
    TestClient testClient = new();
    var s7 = testClient.sendToTopic(connectionString,topicPath,content);
    var r13 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath1);
    var r14 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath2);
    var r15 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath3);
    var r16 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath1);
    var r17 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath2);
    var r18 = testClient.completeMessageFromSubscription(connectionString,subscriptionPath3);
}

# Complete single messages & delete from queue
@test:Config{enable: false}
function testCompleteOneFromQueue() {
    TestClient testClient = new();
    var s8 = testClient.sendToQueue(connectionString,queuePath,content);
    var r19 = testClient.completeMessageFromQueue(connectionString,queuePath);
    var r20 = testClient.completeMessageFromQueue(connectionString,queuePath);
}

# Abandon message & make available again for processing based on messageLockToken functionality to subscription
@test:Config{enable: false}
function testAbandonFromSubscription() {
    TestClient testClient = new();
    var s9 = testClient.sendToTopic(connectionString,topicPath,content);
    var r21 = testClient.abandonFromSubscription(connectionString,subscriptionPath1);
    var r22 = testClient.abandonFromSubscription(connectionString,subscriptionPath2);
    var r23 = testClient.abandonFromSubscription(connectionString,subscriptionPath3);
    var r24 = testClient.completeFromSubscription(connectionString,subscriptionPath1);
    var r25 = testClient.completeFromSubscription(connectionString,subscriptionPath2);
    var r26 = testClient.completeFromSubscription(connectionString,subscriptionPath3);
}

# Abandon message & make available again for processing based on messageLockToken functionality to queue
@test:Config{enable: false}
function testAbandonFromQueue() {
    TestClient testClient = new();
    var s10 = testClient.sendToQueue(connectionString,queuePath,content);
    var r27 = testClient.abandonFromQueue(connectionString,queuePath);
    var r28 = testClient.completeFromQueue(connectionString,queuePath);
}

# Auto Forward - Send msg directly to a queue and send a msg to a topic that has activated autoforward in 
# a subsription that forwards to the original queue
@test:Config{enable: false}
function testAutoForward() {
    TestClient testClient = new();
    var s11 = testClient.sendToQueue(connectionString,queuePath,content);
    var s12 = testClient.sendToTopic(connectionString,topicPath,content);
    var r29 = testClient.completeFromQueue(connectionString,queuePath);
}

# After Suite Function
@test:AfterSuite {}
function afterSuiteFunc() {
    io:println("I'm the after suite function!");
}
