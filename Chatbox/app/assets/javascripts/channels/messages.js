App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
  	document.getElementById("message-box").value = "";
	updateScroll();
    return "<div> <b> (" + data.time + ")" + data.user + ": </b>" + data.message + "</div>";
  }


});

$("#chatroom-scroll").animate({ scrollTop: $('#chatroom-scroll').prop("scrollHeight")}, 1000);

$(document).on('turbolinks:load', function() {
    $('input[type=submit]', this).attr('disabled', false)
    var element = document.getElementById("chatroom-scroll");
    element.scrollTop = element.scrollHeight;
});

function updateScroll(){
    var element = document.getElementById("chatroom-scroll");
    element.scrollTop = element.scrollHeight;
}

