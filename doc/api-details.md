## API message details ##

1. Requests from the client should always include
   the header "Accept: application/json"
   - Preferred include the header: "Content-Type: application/json", ot needed,
     though.
2. Answer from the server will have this form
   { answer: ans_value, message: msg_value, data: data_value }
   - ans_value: (Mandatory) Integer representing the code of the answer. (look into
     errors-list.md)
   - msg_value: (Optional) Message
   - data_value: (If required) The data asked on the request
3. The database will be loaded with one default group, and one default user.
   - group: "admin" => the all-mighty admin group.
   - user: "root" => belonging to :admin group. The password for root will be
     'root_pass'.
