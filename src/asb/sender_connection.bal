import ballerina/java;

# Represents a single network sender connection to the Asb broker.
public class SenderConnection {
    handle asbSenderConnection;

    private string connectionString;
    private string entityPath;

    # Initiates an Asb Sender Connection using the given connection configuration.
    # 
    # + connectionConfiguration - Configurations used to create a `asb:Connection`
    public isolated function init(ConnectionConfiguration connectionConfiguration) {
        self.connectionString = connectionConfiguration.connectionString;
        self.entityPath = connectionConfiguration.entityPath;
        self.asbSenderConnection = <handle> createSenderConnection(java:fromString(self.connectionString),
            java:fromString(self.entityPath));
    }

    # Creates a Asb Sender Connection using the given connection parameters.
    # 
    # + connectionConfiguration - Configurations used to create a `asb:Connection`
    # + return - An `asb:Error` if failed to create connection or else `()`
    public isolated function createSenderConnection(ConnectionConfiguration connectionConfiguration) 
        returns handle|error? {
        self.connectionString = connectionConfiguration.connectionString;
        self.entityPath = connectionConfiguration.entityPath;
        self.asbSenderConnection = <handle> createSenderConnection(java:fromString(self.connectionString),
            java:fromString(self.entityPath));
    }

    # Closes the Asb Sender Connection using the given connection parameters.
    #
    # + return - An `asb:Error` if failed to close connection or else `()`
    public isolated function closeSenderConnection() returns error? {
        return closeSenderConnection(self.asbSenderConnection);
    }

    # Send message to queue with a content and optional parameters
    #
    # + content - MessageBody content
    # + parameters - Optional Message parameters 
    # + properties - Message properties
    # + return - An `asb:Error` if failed to send message or else `()`
    public isolated function sendMessageWithConfigurableParameters(byte[] content, map<string> parameters, 
        map<string> properties) returns error? {
        return sendMessageWithConfigurableParameters(self.asbSenderConnection, content, parameters, properties);
    }

    public isolated function sendBytesMessageWithConfigurableParameters(byte[] content) returns error? {
        map<string> m = {a: "rol", b: "12"};
        return sendBytesMessageWithConfigurableParameters(self.asbSenderConnection, content, java:fromString("content"), 
            java:fromString("content"), java:fromString("content"), java:fromString("content"), 
            java:fromString("content"), java:fromString("content"), java:fromString("content"),m, 1);
    }

    # Send batch of messages to queue with a content and optional parameters
    #
    # + content - MessageBody content
    # + parameters - Optional Message parameters 
    # + properties - Message properties
    # + maxMessageCount - Maximum no. of messages in a batch
    # + return - An `asb:Error` if failed to send message or else `()`
    public isolated function sendBatchMessage(string[] content, map<string> parameters, map<string> properties, 
        int maxMessageCount) returns error? {
        return sendBatchMessage(self.asbSenderConnection, content, parameters, properties, maxMessageCount);
    }
}

isolated function createSenderConnection(handle connectionString, handle entityPath) 
    returns handle|error? = @java:Method {
    name: "createSenderConnection",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function closeSenderConnection(handle imessageSender) returns error? = @java:Method {
    name: "closeSenderConnection",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function sendMessageWithConfigurableParameters(handle imessageSender, byte[] content, map<string> parameters, 
    map<string> properties) returns error? = @java:Method {
    name: "sendBytesMessageViaSenderConnectionWithConfigurableParameters",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function sendBytesMessageWithConfigurableParameters(handle imessageSender, byte[] content, handle contentType, 
    handle messageId, handle to, handle replyTo, handle label, handle sessionId, handle correlationId, 
    map<string> properties, int timeToLive) returns error? = @java:Method {
    name: "sendBytesMessageWithConfigurableParameters",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function sendBatchMessage(handle imessageSender, string[] content, map<string> parameters, 
    map<string> properties, int maxMessageCount) returns error? = @java:Method {
    name: "sendBatchMessage",
    'class: "com.roland.asb.connection.ConUtils"
} external;
