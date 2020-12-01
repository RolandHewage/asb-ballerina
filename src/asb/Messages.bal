# Provides the functionality to handle the messages received by the consumer services.
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
