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

    # Send message to queue with a content
    #
    # + content - MessageBody content
    # + contentType - Content type of the message content
    # + messageId - This is a user-defined value that Service Bus can use to identify duplicate messages, if enabled
    # + to - Send to address
    # + replyTo - Address of the queue to reply to
    # + label - Application specific label
    # + sessionId - Identifier of the session
    # + correlationId - Identifier of the correlation
    # + properties - Message properties
    # + timeToLive - This is the duration, in ticks, that a message is valid. The duration starts from when the 
    #                message is sent to the Service Bus.
    # + return - An `asb:Error` if failed to send message or else `()`
    public isolated function sendMessage(byte[] content, string contentType, string messageId, string to, 
        string replyTo, string label, string sessionId, string correlationId, map<string> properties, int timeToLive) 
            returns error? {
        return sendMessage(self.asbSenderConnection, content, java:fromString(contentType), java:fromString(messageId), 
            java:fromString(to), java:fromString(replyTo), java:fromString(label), java:fromString(sessionId), 
            java:fromString(correlationId), properties, timeToLive);
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

isolated function sendMessage(handle imessageSender, byte[] content, handle contentType, handle messageId, handle to, 
    handle replyTo, handle label, handle sessionId, handle correlationId, map<string> properties, int timeToLive) 
    returns error? = @java:Method {
    name: "sendBytesMessageWithConfigurableParameters",
    'class: "com.roland.asb.connection.ConUtils"
} external;

isolated function sendBatchMessage(handle imessageSender, string[] content, map<string> parameters, 
    map<string> properties, int maxMessageCount) returns error? = @java:Method {
    name: "sendBatchMessage",
    'class: "com.roland.asb.connection.ConUtils"
} external;
