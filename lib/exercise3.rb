class EmailClient

  def initialize(message_class = Message)
    @message_class = message_class
  end

  def message
    @message_class.new
  end
end

class Message
  def send(to, body)
    return "#{to}, #{body}"
  end
end

class SayHelloToMyLittleFriend

  def initialize(client = EmailClient.new)
    @client = client
  end

  def run
    @client.message.send("friend@example.com","HELLO!")
  end
end
