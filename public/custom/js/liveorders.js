
"use strict";


var liveOrders=null;

function getLiveOrders(){
  axios.get('/liveapi').then(function (response) {
    console.log("response: " , JSON.stringify(response));
    liveOrders.neworders=response.data.neworders;
    liveOrders.accepted=response.data.accepted;
    liveOrders.done=response.data.done;
    liveOrders.calculateBiggest()
    
  })
  .catch(function (error) {
    
  });
};

window.onload = function () {

    var audio = new Audio('https://soundbible.com/mp3/old-fashioned-door-bell-daniel_simon.mp3');
    var welcomeAudio = new Audio('https://soundbible.com/mp3/Blop-Mark_DiAngelo-79054334.mp3');
    Pusher.logToConsole = true;
    var pusher = new Pusher(PUSHER_APP_KEY, {
      cluster: PUSHER_APP_CLUSTER
  });

  // Subscribe to the channel
  var channel = pusher.subscribe('order-placed-channel');

  // Bind to the event
  channel.bind('App\\Events\\OrderPlaced', function(data) {
    console.log("data-=====================================",data);  
      // Display the static notification "ORDER PLACED"
      // alert(data.message);
      // js.notify(data.message,data.order_id, "primary");
      js.notify(data.message, `Order ID: ${data.order_id}`, "primary");
      // You can also update UI, play a sound, etc.
  });
    //VUE CART
    liveOrders = new Vue({
      el: '#liveorders',
      data: {
        neworders: [],
        accepted: [],
        done:[],
        biggestBefore:null,
      },
      methods:{
        calculateBiggest(){
          if(this.biggestBefore==null){
            //initial -- loop over the neworders to find the biggest it
            
            this.biggestBefore=this.findBiggest();
            
            welcomeAudio.play();
          }else{
            //on update
            //Find biggest
            
            var newBiggest=this.findBiggest();
            if(newBiggest>this.biggestBefore){
              //Set new biggest
              
              this.biggestBefore=newBiggest;
              
              audio.play();
            }else{
              
            }
          }
        },
        findBiggest(){
          var biggest=0;
          this.neworders.forEach(element => {
            if(element.id>biggest){
              biggest=element.id;
            }
          });
          return biggest;
        }
      }
    })

    getLiveOrders();
    setInterval(getLiveOrders, 10000);

}