App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
  	document.getElementById("message-box").value = "";
    return "<p> <b>" + data.user + "(" + data.time + "): </b>" + data.message + "</p>";
  }


});

$(document).on('turbolinks:load', function() {
    $('input[type=submit]', this).attr('disabled', false)
});

