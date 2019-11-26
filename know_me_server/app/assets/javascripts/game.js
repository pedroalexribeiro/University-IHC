(function() {
    this.channelConnection = {
        create: function(game_code) {
            App.room = App.cable.subscriptions.create("game_channel_" + game_code, {
                received: function(data) {
                    return $('#messages').append(data['message']);
                }
            });
        }
    }
}).call(this);