import ballerina/java;

public class SenderConnection{

    handle asbSenderConnection;

    private string connectionString;
    private string entityPath;

    public isolated function init(ConnectionConfiguration connectionConfiguration) {
        self.connectionString = connectionConfiguration.connectionString;
        self.entityPath = connectionConfiguration.entityPath;
        self.asbSenderConnection = <handle> createSenderConnection(java:fromString(self.connectionString),java:fromString(self.entityPath));
    }

    public isolated function createSenderConnection(ConnectionConfiguration connectionConfiguration) returns handle|error? {
        self.connectionString = connectionConfiguration.connectionString;
        self.entityPath = connectionConfiguration.entityPath;
        self.asbSenderConnection = <handle> createSenderConnection(java:fromString(self.connectionString),java:fromString(self.entityPath));
    }

    public isolated function closeSenderConnection() returns error? {
        return closeSenderConnection(self.asbSenderConnection);
    }

    public isolated function sendViaSenderConnection(string content) returns error? {
        return sendViaSenderConnection(self.asbSenderConnection, java:fromString(content));
    }

    public isolated function sendBytesMessageViaSenderConnection(byte[] content) returns error? {
        return sendBytesMessageViaSenderConnection(self.asbSenderConnection, content);
    }

    public isolated function sendBytesMessageViaSenderConnectionWithConfigurableParameters(byte[] content) returns error? {
        map<string> parameters = {contentType: "json", messageId: "rol", to: "roly", replyTo: "sola", label: "a1", sessionId: "b1", correlationId: "c1", timeToLive: "2"};
        map<string> properties = {a: "rol", b: "12"};
        return sendBytesMessageViaSenderConnectionWithConfigurableParameters(self.asbSenderConnection, content, parameters, properties);
    }

    public isolated function sendBytesMessageWithConfigurableParameters(byte[] content) returns error? {
        map<string> m = {a: "rol", b: "12"};
        return sendBytesMessageWithConfigurableParameters(self.asbSenderConnection, content, java:fromString("content"), java:fromString("content"), java:fromString("content"), java:fromString("content"), java:fromString("content"), java:fromString("content"), java:fromString("content"),m, 1);
    }

}

isolated function createSenderConnection(handle connectionString, handle entityPath) returns handle|error? = @java:Method {
    name: "createSenderConnection",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

isolated function closeSenderConnection(handle imessageSender) returns error? = @java:Method {
    name: "closeSenderConnection",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

isolated function sendViaSenderConnection(handle imessageSender, handle content) returns error? = @java:Method {
    name: "sendViaSenderConnection",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

isolated function sendBytesMessageViaSenderConnection(handle imessageSender, byte[] content) returns error? = @java:Method {
    name: "sendBytesMessageViaSenderConnection",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

isolated function sendBytesMessageViaSenderConnectionWithConfigurableParameters(handle imessageSender, byte[] content, map<string> parameters, map<string> properties) returns error? = @java:Method {
    name: "sendBytesMessageViaSenderConnectionWithConfigurableParameters",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;

isolated function sendBytesMessageWithConfigurableParameters(handle imessageSender, byte[] content,handle contentType, handle messageId, handle to, handle replyTo, handle label, handle sessionId, handle correlationId, map<string> properties, int timeToLive) returns error? = @java:Method {
    name: "sendBytesMessageWithConfigurableParameters",
    'class: "com.roland.samples.servicebus.connection.ConUtils"
} external;