class Message {
  final String message;
  final String id;

  Message(this.message, this.id);
  factory Message.fromjosn(josnData) {
    return Message(josnData['messages'],
    josnData['id']
    
    );
  }
}
