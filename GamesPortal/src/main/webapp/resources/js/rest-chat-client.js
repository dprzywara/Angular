setInterval("calling();",3000);
function calling() {
	var url = "http://localhost:8085/GamesPortal/rest/chatInvite/";
	
//	var login = document.getElementById("login");
	var login = document.getElementById("login").innerHTML;

	var client = new XMLHttpRequest();

	client.open("GET", url + login, false);

	client.setRequestHeader("Content-Type", "text/plain");

	client.send();

	if (client.status == 200) {
		$('#chatInvitations').css('background', 'white');
	}
}

