<!DOCTYPE html>
<head>
  <title>Pusher Test</title>
  <script src="https://js.pusher.com/8.2.0/pusher.min.js"></script>
  {{-- <script>

    // Enable pusher logging - don't include this in production
    Pusher.logToConsole = true;

    var pusher = new Pusher('30fc81e772e20fcbe7c1', {
      cluster: 'ap2'
    });

    var channel = pusher.subscribe('my-channel');
    channel.bind('my-event', function(data) {
      alert(JSON.stringify(data));
    });
  </script> --}}
  {{-- <script src="https://js.pusher.com/7.0/pusher.min.js"></script> --}}
  <script>
      // Initialize Pusher
      var pusher = new Pusher('{{ env('PUSHER_APP_KEY') }}', {
          cluster: '{{ env('PUSHER_APP_CLUSTER') }}'
      });
  
      // Subscribe to the channel
      var channel = pusher.subscribe('order-placed-channel');
  
      // Bind to the event
      channel.bind('App\\Events\\OrderPlaced', function(data) {
          // Display the static notification "ORDER PLACED"
          alert(data.message);
          // You can also update UI, play a sound, etc.
      });
  </script>
</head>
<body>
  <h1>Pusher Test</h1>
  <p>
    Try publishing an event to channel <code>my-channel</code>
    with event name <code>my-event</code>.
  </p>
</body>