import sarindasatwso2com/transformations;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns json|error {
        // Send a response back to the caller.
        transformations:Client transformationsEp = check new (clientConfig = {
            auth: {
                clientId: "",
                clientSecret: ""
            }
        });
        json postCarrierToEdi210Response = check transformationsEp->postCarrierToEdi210(payload = {});
        if name is "" {
            return error("name should not be empty!");
        }
        return postCarrierToEdi210Response;
    }
}

