import ballerina/java;
// import ballerina/io;

public class TestClient{

    function init(){

        // // Connection Configuration
        // string connectionString = "<SAS>";
        // string content = "This is My Message Body"; 
        // string queuePath = "roland1queue";
        // string topicPath = "roland1topic";
        // string subscriptionPath1 = "roland1topic/subscriptions/roland1subscription1";
        // string subscriptionPath2 = "roland1topic/subscriptions/roland1subscription2";
        // string subscriptionPath3 = "roland1topic/subscriptions/roland1subscription3";
        // int maxMessageCount = 3;


        // // publish and subscribe messages to topics and subscriptions
        // var s1 = send(java:fromString(connectionString),java:fromString(topicPath),java:fromString(content));
        // var r1 = receive(java:fromString(connectionString),java:fromString(subscriptionPath1));
        // var r2 = receive(java:fromString(connectionString),java:fromString(subscriptionPath2));
        // var r3 = receive(java:fromString(connectionString),java:fromString(subscriptionPath3));

        // // send and receive message to and from queue
        // var s2 = send(java:fromString(connectionString),java:fromString(queuePath),java:fromString(content));
        // var r4 = receive(java:fromString(connectionString),java:fromString(queuePath));

        // // publish and subscribe batch of messages to topics and subscriptions
        // var s3 = sendBatch(java:fromString(connectionString),java:fromString(topicPath),java:fromString(content),maxMessageCount);
        // var r5 = receiveBatch(java:fromString(connectionString),java:fromString(subscriptionPath1),maxMessageCount);
        // var r6 = receiveBatch(java:fromString(connectionString),java:fromString(subscriptionPath2),maxMessageCount);
        // var r7 = receiveBatch(java:fromString(connectionString),java:fromString(subscriptionPath3),maxMessageCount);

        // // send and receive batch of messages to and from queue
        // var s4 = sendBatch(java:fromString(connectionString),java:fromString(queuePath),java:fromString(content),maxMessageCount);
        // var r8 = receiveBatch(java:fromString(connectionString),java:fromString(queuePath),maxMessageCount);

        // // complete all the messages & delete from subscription
        // var s5 = send(java:fromString(connectionString),java:fromString(topicPath),java:fromString(content));
        // var r9 = completeFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath1));
        // var r10 = completeFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath2));
        // var r11 = completeFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath3));

        // // complete all the messages & delete from queue
        // var s6 = send(java:fromString(connectionString),java:fromString(queuePath),java:fromString(content));
        // var r12 = completeFromQueue(java:fromString(connectionString),java:fromString(queuePath));

        // // complete single message & delete from subscription
        // var s7 = send(java:fromString(connectionString),java:fromString(topicPath),java:fromString(content));
        // var r13 = completeMessageFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath1));
        // var r14 = completeMessageFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath2));
        // var r15 = completeMessageFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath3));
        // var r16 = completeMessageFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath1));
        // var r17 = completeMessageFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath2));
        // var r18 = completeMessageFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath3));

        // // complete single messages & delete from queue
        // var s8 = send(java:fromString(connectionString),java:fromString(queuePath),java:fromString(content));
        // var r19 = completeMessageFromQueue(java:fromString(connectionString),java:fromString(queuePath));
        // var r20 = completeMessageFromQueue(java:fromString(connectionString),java:fromString(queuePath));

        // // abandon message & make available again for processing based on messageLockToken functionality to subscription
        // var s9 = send(java:fromString(connectionString),java:fromString(topicPath),java:fromString(content));
        // var r21 = abandonFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath1));
        // var r22 = abandonFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath2));
        // var r23 = abandonFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath3));
        // var r24 = completeFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath1));
        // var r25 = completeFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath2));
        // var r26 = completeFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath3));

        // // abandon message & make available again for processing based on messageLockToken functionality to queue
        // var s10 = send(java:fromString(connectionString),java:fromString(queuePath),java:fromString(content));
        // var r27 = abandonFromQueue(java:fromString(connectionString),java:fromString(queuePath));
        // var r28 = completeFromQueue(java:fromString(connectionString),java:fromString(queuePath));

        // // Auto Forward - Send msg directly to a queue and send a msg to a topic that has activated autoforward in 
        // // a subsription that forwards to the original queue
        // var s11 = send(java:fromString(connectionString),java:fromString(queuePath),java:fromString(content));
        // var s12 = send(java:fromString(connectionString),java:fromString(topicPath),java:fromString(content));
        // var r29 = receive(java:fromString(connectionString),java:fromString(queuePath));


    }

    # Send message to queue with a content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + queuePath - Entitypath to the message broker resource
    # + content - MessageBody content
    # + return - An `asb:Error` if failed to send message or else `()`
    public function sendToQueue(string connectionString, string queuePath, string content) returns error? {
        var s = send(java:fromString(connectionString),java:fromString(queuePath),java:fromString(content));
    }

    # Receive message from queue and display content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + queuePath - Entitypath to the message broker resource
    # + return - An `asb:Error` if failed to read message or else `()`
    public function readFromQueue(string connectionString, string queuePath) returns error? {
        var r = receive(java:fromString(connectionString),java:fromString(queuePath));
    }

    # Publish message to topic with a content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + topicPath - Entitypath to the message broker resource
    # + content - MessageBody content
    # + return - An `asb:Error` if failed to send message or else `()`
    public function sendToTopic(string connectionString, string topicPath, string content) returns error? {
        var s = send(java:fromString(connectionString),java:fromString(topicPath),java:fromString(content));
    }

    # Receive subscribe message to subscriptions and display content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + subscriptionPath - Entitypath to the message broker resource
    # + return - An `asb:Error` if failed to read message or else `()`
    public function readFromSubscription(string connectionString, string subscriptionPath) returns error? {
        var r = receive(java:fromString(connectionString),java:fromString(subscriptionPath));
    }

    # Send batch of messages to queue with a content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + queuePath - Entitypath to the message broker resource
    # + content - MessageBody content
    # + maxMessageCount - maximum amount of messages to send in a batch
    # + return - An `asb:Error` if failed to send message or else `()`
    public function sendBatchToQueue(string connectionString, string queuePath, string content, int maxMessageCount) returns error? {
        var s = sendBatch(java:fromString(connectionString),java:fromString(queuePath),java:fromString(content), maxMessageCount);
    }

    # Receive batch of messages from queue and display content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + queuePath - Entitypath to the message broker resource
    # + maxMessageCount - maximum amount of messages to recieve from a batch
    # + return - An `asb:Error` if failed to read message or else `()`
    public function readBatchFromQueue(string connectionString, string queuePath, int maxMessageCount) returns error? {
        var r = receiveBatch(java:fromString(connectionString),java:fromString(queuePath), maxMessageCount);
    }

    # Publish batch of messages to topic with a content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + topicPath - Entitypath to the message broker resource
    # + content - MessageBody content
    # + maxMessageCount - maximum amount of messages to send in a batch
    # + return - An `asb:Error` if failed to send message or else `()`
    public function sendBatchToTopic(string connectionString, string topicPath, string content, int maxMessageCount) returns error? {
        var s = sendBatch(java:fromString(connectionString),java:fromString(topicPath),java:fromString(content),maxMessageCount);
    }

    # Receive batch of subscribe messages to subscriptions and display content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + subscriptionPath - Entitypath to the message broker resource
    # + maxMessageCount - maximum amount of messages to recieve from a batch
    # + return - An `asb:Error` if failed to read message or else `()`
    public function readBatchFromSubscription(string connectionString, string subscriptionPath, int maxMessageCount) returns error? {
        var r = receiveBatch(java:fromString(connectionString),java:fromString(subscriptionPath), maxMessageCount);
    }

    # Complete all messages and delete from queue and display content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + queuePath - Entitypath to the message broker resource
    # + return - An `asb:Error` if failed to complete messages or else `()`
    public function completeFromQueue(string connectionString, string queuePath) returns error? {
        var r = completeFromQueue(java:fromString(connectionString),java:fromString(queuePath));
    }

    # complete all messages and delete from subscription and display content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + subscriptionPath - Entitypath to the message broker resource
    # + return - An `asb:Error` if failed to complete messages or else `()`
    public function completeFromSubscription(string connectionString, string subscriptionPath) returns error? {
        var r = completeFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath));
    }

    # Complete single message and delete from queue and display content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + queuePath - Entitypath to the message broker resource
    # + return - An `asb:Error` if failed to complete message or else `()`
    public function completeMessageFromQueue(string connectionString, string queuePath) returns error? {
        var r = completeMessageFromQueue(java:fromString(connectionString),java:fromString(queuePath));
    }

    # Complete single message and delete from subscription and display content
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + subscriptionPath - Entitypath to the message broker resource
    # + return - An `asb:Error` if failed to complete message or else `()`
    public function completeMessageFromSubscription(string connectionString, string subscriptionPath) returns error? {
        var r = completeMessageFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath));
    }

    # Abandon message & make available again for processing based on messageLockToken functionality to queue
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + queuePath - Entitypath to the message broker resource
    # + return - An `asb:Error` if failed to abandon message or else `()`
    public function abandonFromQueue(string connectionString, string queuePath) returns error? {
        var r = abandonFromQueue(java:fromString(connectionString),java:fromString(queuePath));
    }

    # Abandon message & make available again for processing based on messageLockToken functionality to subscription
    #
    # + connectionString - Service bus connection string with Shared Access Signatures
    #                      ConnectionString format: 
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessKeyName=SHARED_ACCESS_KEY_NAME;SharedAccessKey=SHARED_ACCESS_KEY or  
    #                      Endpoint=sb://namespace_DNS_Name;EntityPath=EVENT_HUB_NAME;
    #                      SharedAccessSignatureToken=SHARED_ACCESS_SIGNATURE_TOKEN
    # + subscriptionPath - Entitypath to the message broker resource
    # + return - An `asb:Error` if failed to abandon message or else `()`
    public function abandonFromSubscription(string connectionString, string subscriptionPath) returns error? {
        var r = abandonFromSubscription(java:fromString(connectionString),java:fromString(subscriptionPath));
    }

}


function newConUtils() returns handle = @java:Constructor {
    'class: "com.roland.asb.connection.ConUtils"
} external;

function send(handle connectionString, handle entityPath, handle content) returns error? = @java:Method {
    'class: "com.roland.asb.connection.ConUtils"
} external;

function receive(handle connectionString, handle entityPath) returns error? = @java:Method {
    name: "receive",
    'class: "com.roland.asb.connection.ConUtils"
} external;

function sendBatch(handle connectionString, handle entityPath, handle content, int maxMessageCount) returns error? = @java:Method {
    'class: "com.roland.asb.connection.ConUtils"
} external;

function receiveBatch(handle connectionString, handle entityPath, int maxMessageCount) returns error? = @java:Method {
    name: "receiveBatch",
    'class: "com.roland.asb.connection.ConUtils"
} external;

function completeFromQueue(handle connectionString, handle entityPath) returns error? = @java:Method {
    name: "complete",
    'class: "com.roland.asb.connection.ConUtils"
} external;

function completeFromSubscription(handle connectionString, handle entityPath) returns error? = @java:Method {
    name: "complete",
    'class: "com.roland.asb.connection.ConUtils"
} external;

function completeMessageFromQueue(handle connectionString, handle entityPath) returns error? = @java:Method {
    name: "completeMessage",
    'class: "com.roland.asb.connection.ConUtils"
} external;

function completeMessageFromSubscription(handle connectionString, handle entityPath) returns error? = @java:Method {
    name: "completeMessage",
    'class: "com.roland.asb.connection.ConUtils"
} external;

function abandonFromQueue(handle connectionString, handle entityPath) returns error? = @java:Method {
    name: "abandon",
    'class: "com.roland.asb.connection.ConUtils"
} external;

function abandonFromSubscription(handle connectionString, handle entityPath) returns error? = @java:Method {
    name: "abandon",
    'class: "com.roland.asb.connection.ConUtils"
} external;
