require 'exercise3'

describe EmailClient do
  it 'creates new message' do
    message_double = double :message
    allow(message_double).to receive(:send)
    expect(subject.message).to respond_to(:send)
  end
end

describe Message do
  it 'sends a message to someone' do
    expect(subject.send("josh", "Hello")).to eq "josh, Hello"
  end
end

describe SayHelloToMyLittleFriend do
 describe '#run' do
   it 'sends the message to someone' do
     message_double = double :message, to: "friend@example.com", body: "HELLO!"
     message_class_double = double :message_class, new: message_double
     client_double = double :emailclient, new: message_class_double
     allow(client_double).to receive(:message).and_return(message_class_double)
     allow(message_class_double).to receive(:send).and_return("#{message_double.to}, #{message_double.body}")
     hello = SayHelloToMyLittleFriend.new(client_double)
     hello.run
     expect(message_class_double.send).to eq "friend@example.com, HELLO!"
   end
 end
end
