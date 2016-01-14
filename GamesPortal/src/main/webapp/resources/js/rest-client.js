setInterval("calling();",5000);
function calling() {
	var url = "http://localhost:8085/GamesPortal/rest/invite/";
	var url2 = "http://localhost:8085/GamesPortal/rest/chatInvite/";
	
//	var login = document.getElementById("login");
	var login = document.getElementById("login").innerHTML;

	var client = new XMLHttpRequest();

	client.open("GET", url + login, false);

	client.setRequestHeader("Content-Type", "text/plain");

	client.send();

	if (client.status == 200) {
		$('#messages').css('background', 'white');
	}
	
	var client2 = new XMLHttpRequest();

	client2.open("GET", url2 + login, false);

	client2.setRequestHeader("Content-Type", "text/plain");

	client2.send();

	if (client2.status == 200) {
		$('#chatInvitations').css('background', 'white');
	}
	
}

