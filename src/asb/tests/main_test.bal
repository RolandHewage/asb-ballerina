import ballerina/io;
import ballerina/test;
import ballerina/log;

// Connection Configuration
string connectionString = "Endpoint=sb://roland1.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OckfvtMMw6GHIftqU0Jj0A0jy0uIUjufhV5dCToiGJk=";
string queuePath = "roland1queue";
string topicPath = "roland1topic";
string subscriptionPath1 = "roland1topic/subscriptions/roland1subscription1";
string subscriptionPath2 = "roland1topic/subscriptions/roland1subscription2";
string subscriptionPath3 = "roland1topic/subscriptions/roland1subscription3";
int maxMessageCount = 3;

SenderConnection? senderConnection = ();
ReceiverConnection? receiverConnection = ();

// Input values
string stringContent = "This is My Message Body"; 
byte[] byteContent = stringContent.toBytes();
json jsonContent = {name: "apple", color: "red", price: 5.36};
byte[] byteContentFromJson = jsonContent.toJsonString().toBytes();
json[] jsonArrayContent = [{name: "apple", color: "red", price: 5.36}, {first: "John", last: "Pala"}];
string[] stringArrayContent = ["apple","mango","lemon","orange"];
int[] integerArrayContent = [4, 5, 6];
map<string> parameters = {contentType: "application/json", messageId: "one", to: "sanju", replyTo: "carol", label: "a1", sessionId: "b1", correlationId: "c1", timeToLive: "2"};
map<string> properties = {a: "nimal", b: "saman"};
map<string> parameters1 = {contentType: "application/json", messageId: "one"};

# Before Suite Function
@test:BeforeSuite
function beforeSuiteFunc() {
    io:println("I'm the before suite function!");

    log:printInfo("Creating a ballerina Asb Sender connection.");
    SenderConnection? con = new ({connectionString: connectionString, entityPath: queuePath});
    senderConnection = con;

    log:printInfo("Creating a ballerina Asb Receiver connection.");
    ReceiverConnection? rec = new ({connectionString: connectionString, entityPath: queuePath});
    receiverConnection = rec;
}

# Test Sender Connection
@test:Config{enable: false}
public function testSenderConnection() {
    boolean flag = false;
    SenderConnection? senderConnection = new ({connectionString: connectionString, entityPath: queuePath});
    if (senderConnection is SenderConnection) {
        flag = true;
    }
    test:assertTrue(flag, msg = "Asb Sender Connection creation failed.");
}

# Test Receiver Connection
@test:Config{enable: false}
public function testReceieverConnection() {
    boolean flag = false;
    ReceiverConnection? receiverConnection = new ({connectionString: connectionString, entityPath: queuePath});
    if (receiverConnection is ReceiverConnection) {
        flag = true;
    }
    test:assertTrue(flag, msg = "Asb Receiver Connection creation failed.");
}

# Test send to queue operation
@test:Config{enable: true}
function testSendToQueueOperation() {
    log:printInfo("Creating Asb sender connection.");
    SenderConnection? senderConnection = new ({connectionString: connectionString, entityPath: queuePath});

    if (senderConnection is SenderConnection) {
        log:printInfo("Sending via Asb sender connection.");
        checkpanic senderConnection.sendBytesMessageViaSenderConnectionWithConfigurableParameters(byteContent, parameters1, properties);
    } else {
        test:assertFail("Asb sender connection creation failed.");
    }

    if (senderConnection is SenderConnection) {
        log:printInfo("Closing Asb sender connection.");
        checkpanic senderConnection.closeSenderConnection();
    }
}

# Test receive from queue operation
@test:Config{enable: true}
function testReceiveFromQueueOperation() {
    log:printInfo("Creating Asb receiver connection.");
    ReceiverConnection? receiverConnection = new ({connectionString: connectionString, entityPath: queuePath});

    if (receiverConnection is ReceiverConnection) {
        log:printInfo("Receiving from Asb receiver connection.");
        var messages = receiverConnection.receiveBytesMessageViaReceiverConnectionWithConfigurableParameters();
        if(messages is handle) {
            checkpanic receiverConnection.checkMessage(messages);
        } else {
            test:assertFail("Receiving message via Asb receiver connection failed.");
        }
    } else {
        test:assertFail("Asb receiver connection creation failed.");
    }

    if (receiverConnection is ReceiverConnection) {
        log:printInfo("Closing Asb receiver connection.");
        checkpanic receiverConnection.closeReceiverConnection();
    }
}

# Test send to topic operation
@test:Config{enable: false}
function testSendToTopicOperation() {
    log:printInfo("Creating Asb sender connection.");
    SenderConnection? senderConnection = new ({connectionString: connectionString, entityPath: topicPath});

    if (senderConnection is SenderConnection) {
        log:printInfo("Sending via Asb sender connection.");
        checkpanic senderConnection.sendBytesMessageViaSenderConnectionWithConfigurableParameters(byteContentFromJson, parameters, properties);
    } else {
        test:assertFail("Asb sender connection creation failed.");
    }

    if (senderConnection is SenderConnection) {
        log:printInfo("Closing Asb sender connection.");
        checkpanic senderConnection.closeSenderConnection();
    }
}

# Test receive from subscription operation
@test:Config{enable: false}
function testReceiveFromSubscriptionOperation() {
    log:printInfo("Creating Asb receiver connection.");
    ReceiverConnection? receiverConnection1 = new ({connectionString: connectionString, entityPath: subscriptionPath1});
    ReceiverConnection? receiverConnection2 = new ({connectionString: connectionString, entityPath: subscriptionPath2});
    ReceiverConnection? receiverConnection3 = new ({connectionString: connectionString, entityPath: subscriptionPath3});

    if (receiverConnection1 is ReceiverConnection) {
        log:printInfo("Receiving from Asb receiver connection 1.");
        var messages = receiverConnection1.receiveBytesMessageViaReceiverConnectionWithConfigurableParameters();
        if(messages is handle) {
            checkpanic receiverConnection1.checkMessage(messages);
        } else {
            test:assertFail("Receiving message via Asb receiver connection failed.");
        }
    } else {
        test:assertFail("Asb receiver connection creation failed.");
    }

    if (receiverConnection2 is ReceiverConnection) {
        log:printInfo("Receiving from Asb receiver connection 2.");
        var messages = receiverConnection2.receiveBytesMessageViaReceiverConnectionWithConfigurableParameters();
        if(messages is handle) {
            checkpanic receiverConnection2.checkMessage(messages);
        } else {
            test:assertFail("Receiving message via Asb receiver connection failed.");
        }
    } else {
        test:assertFail("Asb receiver connection creation failed.");
    }

    if (receiverConnection3 is ReceiverConnection) {
        log:printInfo("Receiving from Asb receiver connection 3.");
        var messages = receiverConnection3.receiveBytesMessageViaReceiverConnectionWithConfigurableParameters();
        if(messages is handle) {
            checkpanic receiverConnection3.checkMessage(messages);
        } else {
            test:assertFail("Receiving message via Asb receiver connection failed.");
        }
    } else {
        test:assertFail("Asb receiver connection creation failed.");
    }

    if (receiverConnection1 is ReceiverConnection) {
        log:printInfo("Closing Asb receiver connection 1.");
        checkpanic receiverConnection1.closeReceiverConnection();
    }

    if (receiverConnection2 is ReceiverConnection) {
        log:printInfo("Closing Asb receiver connection 2.");
        checkpanic receiverConnection2.closeReceiverConnection();
    }

    if (receiverConnection3 is ReceiverConnection) {
        log:printInfo("Closing Asb receiver connection 3.");
        checkpanic receiverConnection3.closeReceiverConnection();
    }
}







//--------------------------------------------------------------------------------------------------------------------------

# Publish and subscribe messages to topics and subscriptions
@test:Config{enable: false}
function testPublishAndSubscribe() {
    TestClient testClient = new();
    var s1 = testClient.sendToTopic(connectionString,topicPath,stringContent);
    var r1 = testClient.readFromSubscription(connectionString,subscriptionPath1);
    var r2 = testClient.readFromSubscription(connectionString,subscriptionPath2);
    var r3 = testClient.readFromSubscription(connectionString,subscriptionPath3);
}

# Send and receive message to and from queue
@test:Config{enable: false}
function testSendAndReceive() {
    TestClient testClient = new();
    var s2 = testClient.sendToQueue(connectionString,queuePath,stringContent);
    var r4 = testClient.readFromQueue(connectionString,queuePath);
}

# Publish and subscribe batch of messages to topics and subscriptions
@test:Config{enable: false}
function testPublishAndSubscribeBatch() {
    TestClient testClient = new();
    var s3 = testClient.sendBatchToTopic(connectionString,topicPath,stringContent,maxMessageCount);
    var r5 = testClient.readBatchFromSubscription(connectionString,subscriptionPath1,maxMessageCount);
    var r6 = testClient.readBatchFromSubscription(connectionString,subscriptionPath2,maxMessageCount);
    var r7 = testClient.readBatchFromSubscription(connectionString,subscriptionPath3,maxMessageCount);
}

# Send and receive batch of messages to and from queue
@test:Config{enable: false}
function testSendAndReceiveBatch() {
    TestClient testClient = new();
    var s4 = testClient.sendBatchToQueue(connectionString,queuePath,stringContent, maxMessageCount);
    var r8 = testClient.readBatchFromQueue(connectionString,queuePath, maxMessageCount);
}

# Complete all the messages & delete from subscription
@test:Config{enable: false}
function testCompleteAllFromSubscription() {
    TestClient testClient = new();
    var s5 = testClient.sendToTopic(connectionString,topicPath,stringContent);
    var r9 = testClient.completeFromSubscription(connectionString,subscriptionPath1);
    var r10 = testClient.completeFromSubscription(connectionString,subscriptionPath2);
    var r11 = testClient.completeFromSubscription(connectionString,subscriptionPath3);
}

# Complete all the messages & delete from queue
@test:Config{enable: false}
function testCompleteAllFromQueue() {
    TestClient testClient = new();
    var s6 = testClient.sendToQueue(connectionString,queuePath,stringContent);
    var r12 = testClient.completeFromQueue(connectionString,queuePath);
}

# Complete single message & delete from subscription
@test:Config{enable: false}
function testCompleteOneFromSubscription() {
    TestClient testClient = new();
    var s7 = testClient.sendToTopic(connectionString,topicPath,stringContent);
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
    var s8 = testClient.sendToQueue(connectionString,queuePath,stringContent);
    var r19 = testClient.completeMessageFromQueue(connectionString,queuePath);
    var r20 = testClient.completeMessageFromQueue(connectionString,queuePath);
}

# Abandon message & make available again for processing based on messageLockToken functionality to subscription
@test:Config{enable: false}
function testAbandonFromSubscription() {
    TestClient testClient = new();
    var s9 = testClient.sendToTopic(connectionString,topicPath,stringContent);
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
    var s10 = testClient.sendToQueue(connectionString,queuePath,stringContent);
    var r27 = testClient.abandonFromQueue(connectionString,queuePath);
    var r28 = testClient.completeFromQueue(connectionString,queuePath);
}

# Auto Forward - Send msg directly to a queue and send a msg to a topic that has activated autoforward in 
# a subsription that forwards to the original queue
@test:Config{enable: false}
function testAutoForward() {
    TestClient testClient = new();
    var s11 = testClient.sendToQueue(connectionString,queuePath,stringContent);
    var s12 = testClient.sendToTopic(connectionString,topicPath,stringContent);
    var r29 = testClient.completeFromQueue(connectionString,queuePath);
}

# After Suite Function
@test:AfterSuite {}
function afterSuiteFunc() {
    io:println("I'm the after suite function!");

    SenderConnection? con = senderConnection;
    if (con is SenderConnection) {
        log:printInfo("Closing the Sender Connection");
        checkpanic con.closeSenderConnection();
    }

    ReceiverConnection? rec = receiverConnection;
    if (rec is ReceiverConnection) {
        log:printInfo("Closing the Receiver Connection");
        checkpanic rec.closeReceiverConnection();
    }
}
