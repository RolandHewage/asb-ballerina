import ballerina/java;

# Represents a single network receiver connection to the RabbitMQ broker.
public class ReceiverConnection {

    handle asbReceiverConnection;

    private string connectionString;
    private string entityPath;

    # Initiates an Asb Receiver Connection using the given connection configuration.
    # 
    # + connectionConfiguration - Configurations used to create a `asb:Connection`
    public isolated function init(ConnectionConfiguration connectionConfiguration) {
        self.connectionString = connectionConfiguration.connectionString;
        self.entityPath = connectionConfiguration.entityPath;
        var receiver = createReceiverConnection(java:fromString(self.connectionString), 
            java:fromString(self.entityPath));
        self.asbReceiverConnection = <handle> createReceiverConnection(java:fromString(self.connectionString), 
            java:fromString(self.entityPath));
    }

    # Creates a Asb Receiver Connection using the given connection parameters.
    # 
    # + connectionConfiguration - Configurations used to create a `asb:Connection`
    # + return - An `asb:Error` if failed to create connection or else `()`
    public isolated function createReceiverConnection(ConnectionConfiguration connectionConfiguration) 
        returns handle|error? {
        self.connectionString = connectionConfiguration.connectionString;
        self.entityPath = connectionConfiguration.entityPath;
        self.asbReceiverConnection = <handle> createReceiverConnection(java:fromString(self.connectionString), 
            java:fromString(self.entityPath));
    }

    # Closes the Asb Receiver Connection using the given connection parameters.
    #
    # + return - An `asb:Error` if failed to close connection or else `()`
    public isolated function closeReceiverConnection() returns error? {
        return closeReceiverConnection(self.asbReceiverConnection);
    }

    public isolated function receiveBytesMessageViaReceiverConnectionWithConfigurableParameters() 
        returns handle|error? {
        return receiveBytesMessageViaReceiverConnectionWithConfigurableParameters(self.asbReceiverConnection);
    }

    public isolated function checkMessage(handle imessages) returns error? {
        checkpanic checkMessage(imessages);
    }

    # Receive Message from queue.
    # 
    # + return - A Message object
    public isolated function receiveMessage() returns Message|error {
        return receiveMessage(self.asbReceiverConnection);
    }

    # Receive messages from queue.
    # 
    # + return - A Messages object with an array of Message objects
    public isolated function receiveMessages() returns Messages|error {
        return receiveMessages(self.asbReceiverConnection);
    }

    # Receive batch of messages from queue.
    # 
    # + maxMessageCount - Maximum no. of messages in a batch
    # + return - A Message object
    public isolated function receiveBatchMessage(int maxMessageCount) returns Messages|error {
        return receiveBatchMessage(self.asbReceiverConnection, maxMessageCount);
    }

    isolated function getAsbReceiverConnection() returns handle {
        return self.asbReceiverConnection;
    }

    # Complete Messages from Queue or Subscription based on messageLockToken.
    # 
    # + return - An `asb:Error` if failed to complete message or else `()`
    public isolated function completeMessages() returns error? {
        return completeMessages(self.asbReceiverConnection);
    }

    # Complete One Message from Queue or Subscription based on messageLockToken.
    # 
    # + return - An `asb:Error` if failed to complete messages or else `()`
    public isolated function completeOneMessage() returns error? {
        return completeOneMessage(self.asbReceiverConnection);
    }

    # Abandon message & make available again for processing from Queue or Subscription based on messageLockToken
    # 
    # + return - An `asb:Error` if failed to abandon message or else `()`
    public isolated function abandonMessage() returns error? {
        return abandonMessage(self.asbReceiverConnection);
    }
}

isolated function createReceiverConnection(handle connectionString, handle entityPath) 
    returns handle|error? = @java:Method {
    name: "createReceiverConnection",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function closeReceiverConnection(handle imessageSender) returns error? = @java:Method {
    name: "closeReceiverConnection",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function receiveBytesMessageViaReceiverConnectionWithConfigurableParameters(handle imessageReceiver) 
    returns handle|error? = @java:Method {
    name: "receiveBytesMessageViaReceiverConnectionWithConfigurableParameters",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function checkMessage(handle imessage) returns error? = @java:Method {
    name: "checkMessage",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function receiveMessage(handle imessageReceiver) returns Message|error = @java:Method {
    name: "receiveOneBytesMessageViaReceiverConnectionWithConfigurableParameters",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function receiveMessages(handle imessageReceiver) returns Messages|error = @java:Method {
    name: "receiveMessages",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function receiveBatchMessage(handle imessageReceiver, int maxMessageCount) 
    returns Messages|error = @java:Method {
    name: "receiveBatchMessage",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function completeMessages(handle imessageReceiver) returns error? = @java:Method {
    name: "completeMessages",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function completeOneMessage(handle imessageReceiver) returns error? = @java:Method {
    name: "completeOneMessage",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function abandonMessage(handle imessageReceiver) returns error? = @java:Method {
    name: "abandonMessage",
    'class: "com.roland.asb.connection.ConUtils"
} external;
