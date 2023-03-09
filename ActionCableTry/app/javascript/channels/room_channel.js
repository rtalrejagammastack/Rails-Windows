import consumer from "./consumer"

const roomChannel = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the chat room!");
  },

  disconnected() {
    console.log("DisConnected to the chat room!");
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Received.")
    // console.log(data.content)
    $('#msg').append('<div class="message"> ' + data.content + '</div>')
  },
  speak(message) {
    this.perform('speak', { message: message })
  }
});

export default roomChannel;