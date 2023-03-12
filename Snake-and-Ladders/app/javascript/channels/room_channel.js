import consumer from "./consumer"

const createRoomChannel = (roomId) => {
  consumer.subscriptions.create({ channel: "RoomChannel", room_id: roomId }, {
    connected() {
      console.log(`Connected to room ${roomId}`)
    },

    disconnected() {
      console.log(`Disconnected from room ${roomId}`)
    },

    received(data) {
      console.log(`Received data in room ${roomId}:`, data)
      switch (data.type){
        case "new_player":
          add_player(data.user.name,data.user.id)
          break;
        case "remove_player":
          remove_player(data.user.id)
          break;
        case "start_game":
          start_game()
          break;
          case "stop_game":
            stop_game()
            break;
        default:
          console.log("Default") 
      }
      console.log("Received.")
    }
  })
}

window.createRoomChannel = createRoomChannel

const add_player=(player_name , player_id)=>{
  const pTag = document.createElement("p");
  pTag.innerText = player_name;
  pTag.style.id = `player_${player_id}`;
  document.getElementById('players').appendChild(pTag)
}

const remove_player = (player_id)=>{
  const div = document.getElementById("players");

  for(let i=0;i<div.children.length;i++){
    const child = div.children[i];

    if (child.style.id == `player_${player_id}`){
      console.log("Here")
      div.removeChild(child)
      break;
    }
  }
}
const stop_game = () =>{
  document.getElementById('game').style.display="none";
    
}
const start_game = () =>{
  document.getElementById('game').style.display="block";
}










//start_game
// document.getElementById('start_button').remove()
// const game = document.getElementById('game')

// let string  = ""

// let k =100;
// for (let i=0;i<10;i++){
//   let part = ""
//   for(let j=0;j<10;j++){
//     part+= `<div class="square" id=${k}>${k}</div>`
//     k--;
//   }
//   if (i%2!=0){
//     string += `
//       <div class="row odd">
//         ${part}
//       </div>
//     `
//   }else{
//     string += `
//       <div class="row">
//         ${part}
//       </div>
//     `
//   }
// }
// const imageSrc = `${appPaths.imagePath}/dice.jpg`;
// const imageTag = ``;
//   game.innerHTML = `
//     <div id="game-board">
//       ${string}
//     </div>
//     <div id="dice">
//     <img src="${imageSrc}" alt="My Image" class="img-fluid"/>
//     </div>
//     <div id="move">
//     </div>
//   `