import ballerina/java;

public class Message {
    private byte[] messageContent = [];

    public isolated function getTextContent1() returns @tainted string|Error {
        return nativeGetTextContent(self.messageContent);
    }

    # Retrieves the JSON content of the Asb message.
    # ```ballerina
    # json|Asb:Error msgContent = message.getJSONContent();
    # ```
    #
    # + return - Message data as a JSON value or else a `Asb:Error` if an error is encountered
    public isolated function getJSONContent() returns @tainted json|Error {
        return nativeGetJSONContent(self.messageContent);
    }
}

isolated function nativeGetTextContent(byte[] messageContent) returns string|Error =
@java:Method {
    name: "getTextContent",
    'class: "com.roland.asb.AsbMessageUtils"
} external;

isolated function nativeGetJSONContent(byte[] messageContent) returns json|Error =
@java:Method {
    name: "getJSONContent",
    'class: "com.roland.asb.AsbMessageUtils"
} external;
