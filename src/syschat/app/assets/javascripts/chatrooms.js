$(document).ready(initialize);
function initialize(){
	var source = new EventSource('/messages');
	source.addEventListener('message', update);
};
function update(){
	var item = $('<li>').text(event.data);
	$('#messages').append(item);
};