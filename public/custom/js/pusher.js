"use strict";
$(document).ready(function() {
    // Enable pusher logging - don't include this in production
    // if (PUSHER_APP_KEY) {
    //     Pusher.logToConsole = true;

    //     var pusher = new Pusher(PUSHER_APP_KEY, {
    //         cluster: PUSHER_APP_CLUSTER
    //     });

    //     var channel = pusher.subscribe('user.' + USER_ID);

    //     // console.log("Fetching audio URL for the authenticated user.");

    //     // Fetch the audio URL from the API
    //     $.ajax({
    //         url: '/api/getaudio/cybinixtest',
    //         method: 'GET',
    //         success: function(response) {
    //             console.log("API Response: ", response);

    //             if (response.audio) {
    //                 var audio = new Audio(response.audio);
    //                 console.log("Audio URL: ", response.audio);

    //                 channel.bind('callwaiter-event', function(data) {
    //                     console.log("callwaiter-event data: ", data);
    //                     js.notify(data.msg + " " + data.table.restoarea.name + " " + data.table.name, "primary");
    //                     audio.play();
    //                 });

    //                 channel.bind('neworder-event', function(data) {
    //                     console.log("neworder-event data: ", data);
    //                     js.notify(data.msg + " #" + data.order.id, "primary");
    //                     audio.play();
    //                 });
    //             } else {
    //                 console.error("Audio URL not found in response");
    //             }
    //         },
    //         error: function(xhr) {
    //             console.error('Failed to fetch audio URL', xhr);
    //         }
    //     });
    // }
    // if (PUSHER_APP_KEY) {
    //     Pusher.logToConsole = true;
    
    //     var pusher = new Pusher(PUSHER_APP_KEY, {
    //         cluster: PUSHER_APP_CLUSTER
    //     });
    
    //     var channel = pusher.subscribe('user.' + USER_ID);
    
    //     // Fetch the audio URL from the API
    //     $.ajax({
    //         url: '/api/getaudio/cybinixtest',
    //         method: 'GET',
    //         success: function(response) {
    //             console.log("API Response: ", response);
    
    //             // Default sound URL
    //             var defaultSoundUrl = 'https://soundbible.com/mp3/old-fashioned-door-bell-daniel_simon.mp3';
    //             var audioUrl = response.audio;
    
    //             // If the audio URL is null or an empty string, use the default sound URL
    //             if (!audioUrl || audioUrl === 'http://localhost/storage') {
    //                 audioUrl = defaultSoundUrl;
    //             }
    
    //             var audio = new Audio(audioUrl);
    //             console.log("Audio URL: ", audioUrl);
    
    //             channel.bind('callwaiter-event', function(data) {
    //                 console.log("callwaiter-event data: ", data);
    //                 js.notify(data.msg + " " + data.table.restoarea.name + " " + data.table.name, "primary");
    //                 audio.play();
    //             });
    
    //             channel.bind('neworder-event', function(data) {
    //                 console.log("neworder-event data: ", data);
    //                 js.notify(data.msg + " #" + data.order.id, "primary");
    //                 audio.play();
    //             });
    //         },
    //         error: function(xhr) {
    //             console.error('Failed to fetch audio URL', xhr);
    //         }
    //     });
    // }
    if (PUSHER_APP_KEY) {
        Pusher.logToConsole = true;
    
        var pusher = new Pusher(PUSHER_APP_KEY, {
            cluster: PUSHER_APP_CLUSTER
        });
    
        var channel = pusher.subscribe('user.' + USER_ID);
    
        // Fetch the audio URL from the API
        $.ajax({
            url: '/api/getaudio/cybinixtest',
            method: 'GET',
            success: function(response) {
                console.log("API Response: ", response);
    
                // Default sound URL
                var defaultSoundUrl = 'https://soundbible.com/mp3/old-fashioned-door-bell-daniel_simon.mp3';
                var audioUrl = response.audio;
                var enableAudio = response.enable;
    
                // Determine if audio should be played based on enable status
                if (enableAudio === 1) {
                    // If the audio URL is null or an empty string, use the default sound URL
                    if (!audioUrl || audioUrl === 'http://localhost/storage') {
                        audioUrl = defaultSoundUrl;
                    }
    
                    var audio = new Audio(audioUrl);
                    console.log("Audio URL: ", audioUrl);
    
                    // Bind events to Pusher channels
                    channel.bind('callwaiter-event', function(data) {
                        console.log("callwaiter-event data: ", data);
                        js.notify(data.msg + " " + data.table.restoarea.name + " " + data.table.name, "primary");
                        audio.play();
                    });
    
                    channel.bind('neworder-event', function(data) {
                        console.log("neworder-event data: ", data);
                        js.notify(data.msg + " #" + data.order.id, "primary");
                        audio.play();
                    });
                } else {
                    // Bind events to Pusher channels without playing audio
                    channel.bind('callwaiter-event', function(data) {
                        console.log("callwaiter-event data: ", data);
                        js.notify(data.msg + " " + data.table.restoarea.name + " " + data.table.name, "primary");
                    });
    
                    channel.bind('neworder-event', function(data) {
                        console.log("neworder-event data: ", data);
                        js.notify(data.msg + " #" + data.order.id, "primary");
                    });
                }
            },
            error: function(xhr) {
                console.error('Failed to fetch audio URL', xhr);
            }
        });
    }
     
    else {
        console.error("PUSHER_APP_KEY is not defined");
    }
    

    function subscribePerOrder(orderID) {
        var audio = new Audio('https://soundbible.com/mp3/old-fashioned-door-bell-daniel_simon.mp3');

        Pusher.logToConsole = true;

        var pusherForOrder = new Pusher(PUSHER_APP_KEY, {
            cluster: PUSHER_APP_CLUSTER
        });

        var channelForOrder = pusherForOrder.subscribe('order.' + orderID);
        channelForOrder.bind('updateorder-event', function(data) {
            js.notify(data.msg + " #" + data.order.id, "primary");
            audio.play();
        });
    }
});
