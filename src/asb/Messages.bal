# Provides the functionality to handle the messages received by the consumer services.
public class Messages {
    private int deliveryTag = -1;
    private Message[] messages = [];

    # Retrieves the Array of Asb message objects.
    # 
    # + return - Array of Message objects
    public function getMessages() returns Message[] {
        return self.messages;
    }

    # Retrieves the count of Message objects.
    # 
    # + return - Count of Message objects
    public function getDeliveryTag() returns int {
        return self.deliveryTag;
    }
}
