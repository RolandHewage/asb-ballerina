// import ballerina/java;

public class Messages {
    private int deliveryTag = -1;
    private Message[] messages = [];

    public function getMessages() returns Message[] {
        return self.messages;
    }

    public function getDeliveryTag() returns int {
        return self.deliveryTag;
    }
}
