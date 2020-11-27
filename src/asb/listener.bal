import ballerina/lang.'object as lang;
import ballerina/java;

public class Listener {

    *lang:Listener;

    # Initializes a Listener object with the given `asb:Connection` object or connection configurations.
    # Creates a `asb:Connection` object if only the connection configuration is given. 
    #
    # + connectionOrConnectionConfig - A `asb:Connection` object or the connection configurations.
    public function init(ConnectionConfiguration? connectionOrConnectionConfig) {
        externInit(self);
    }

    # Attaches the service to the `asb:Listener` endpoint.
    #
    # + s - Type descriptor of the service
    # + name - Name of the service
    # + return - `()` or else a `asb:Error` upon failure to register the service
    public isolated function __attach(service s, string? name = ()) returns error? {
        return registerListener(self, s);
    }

    # Starts consuming the messages on all the attached services.
    #
    # + return - `()` or else a `asb:Error` upon failure to start
    public isolated function __start() returns error? {
        return 'start(self);
    }

    # Stops consuming messages and detaches the service from the `asb:Listener` endpoint.
    #
    # + s - Type descriptor of the service
    # + return - `()` or else  a `asb:Error` upon failure to detach the service
    public isolated function __detach(service s) returns error? {
        return detach(self, s);
    }

    # Stops consuming messages through all consumer services by terminating the connection and all its channels.
    #
    # + return - `()` or else  a `asb:Error` upon failure to close the `ChannelListener`
    public isolated function __gracefulStop() returns error? {
        return stop(self);
    }

    # Stops consuming messages through all the consumer services and terminates the connection
    # with the server.
    #
    # + return - `()` or else  a `asb:Error` upon failure to close ChannelListener.
    public isolated function __immediateStop() returns error? {
        return abortConnection(self);
    }
}  

isolated function externInit(Listener lis) =
@java:Method {
    name: "init",
    'class: "com.roland.samples.servicebus.connection.ListenerUtils"
} external;

isolated function registerListener(Listener lis, service serviceType) returns Error? =
@java:Method {
    'class: "com.roland.samples.servicebus.connection.ListenerUtils"
} external;

isolated function 'start(Listener lis) returns Error? =
@java:Method {
    'class: "com.roland.samples.servicebus.connection.ListenerUtils"
} external;

isolated function detach(Listener lis, service serviceType) returns Error? =
@java:Method {
    'class: "com.roland.samples.servicebus.connection.ListenerUtils"
} external;

isolated function stop(Listener lis) returns Error? =
@java:Method {
    'class: "com.roland.samples.servicebus.connection.ListenerUtils"
} external;

isolated function abortConnection(Listener lis) returns Error? =
@java:Method {
    'class: "com.roland.samples.servicebus.connection.ListenerUtils"
} external;

public type QueueConfiguration record {|
    string connectionString;
    string queueName;
|};

public type asbServiceConfig record {|
    QueueConfiguration queueConfig;
|};

# The annotation, which is used to configure the subscription.
public annotation asbServiceConfig ServiceConfig on service;
