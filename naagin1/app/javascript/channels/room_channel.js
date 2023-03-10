import consumer from "./consumer"

const my_consumer = consumer.subscriptions.create("RoomChannel", {
  connected() {

    // Called when the subscription is ready for use on the server
  },
  
  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  
  received(data) {
    console.log('Connected')
    if (data.start){
      $('#game_start').append('<div class="start_msg"> ' + data.content + '</div>')
    }else if (data.appendName){
      $('#users').append('<div class="message"> ' + data.content + '</div>')
    }
    // document.getElementById("users").append(data.name)
    // Called when there's incoming data on the websocket for this channel
  }
});

export default my_consumer