App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
  	document.getElementById("message-box").value = "";
	updateScroll();
	playAudio()
    return "<div> <b> (" + data.time + ")" + data.user + ": </b>" + data.message + "</div>";
  },


});

$(document).on('turbolinks:load', function() {
    $('input[type=submit]', this).attr('disabled', false)
    updateScroll();
});

function updateScroll() {
    var element = document.getElementById("chatroom-scroll");
    element.scrollTop = element.scrollHeight;
}

function playAudio() {
	$('#audio')[0].volume = 0.04
	$('#audio').trigger('play')
}
