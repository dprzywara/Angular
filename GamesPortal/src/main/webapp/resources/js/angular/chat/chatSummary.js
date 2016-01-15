// This file is executed in the browser, when people visit /chat/<random id>

$(function(){

	// getting the id of the room from the url
	//var id = Number(window.location.pathname.match(/\/play\/(\d+)$/)[1]);
	//var id = Number(window.location.pathname.match(/\/question\/(\d+)$/)[1]);
	var id = document.getElementById("roomId").innerHTML;
	console.log("takie mam id: "+id);
	var mojWynik;//=document.getElementById("myScore").innerHTML;
//var id=5;
	// connect to the socket
	var socket = io('http://localhost:8090');
	
	var otrzymal=false;
	// variables which hold the data for each person
	var name = "",
		email = "",
		img = "",
		friend = "";
	
	// cache some jQuery objects
	var section = $(".section"),
		footer = $("footer"),
		onConnect = $(".connected"),
		inviteSomebody = $(".invite-textfield"),
		personInside = $(".personinside"),
		chatScreen = $(".chatscreen"),
		left = $(".left"),
		noMessages = $(".nomessages"),
		tooManyPeople = $(".toomanypeople"),
		graa= $(".graa"),
		question= $(".question"),
		result= $(".waiting"),
		end= $("#endButton"),
		waiting= $(".summary");
		
	// some more jquery objects
	var chatNickname = $(".nickname-chat"),
		leftNickname = $(".nickname-left"),
		loginForm = $(".loginForm"),
		answerForm = $(".answerForm"),
		yourName = $("#yourName"),
		score = $("#myScore"),
		yourEmail = $("#yourEmail"),
		hisName = $("#hisName"),
		hisEmail = $("#hisEmail"),
		chatForm = $("#chatform"),
		textarea = $("#message"),
		textToDisplay = $("#textToDisplay"),
		messageTimeSent = $(".timesent"),
		chats = $(".chats");

	// these variables hold images
	var ownerImage = $("#ownerImage"),
		leftImage = $("#leftImage"),
		noMessagesImage = $("#noMessagesImage");


	// on connection to server get the id of person's room
	socket.on('connect', function(){
		
		name = $.trim(yourName.val());
		email = yourEmail.val();
		mojWynik = score.val();
		socket.emit('login', {user: name, avatar: email, id: id});
		console.log("poszed emit z "+name+' '+email+' '+id);
		

		socket.emit('load', id);
		
	});

	// save the gravatar url
	socket.on('img', function(data){
		img = data;
	});

	// receive the names and avatars of all people in the chat room
	socket.on('peopleinchat', function(data){
		
		
		//alert("userow w czacie "+data.number);
		
		
//		if(data.number === 0){
//			
//			alert("nie ma nikogow czacie");
//			
//showMessage("start");
//
//			loginForm.on('submit', function(e){
//
//				e.preventDefault();
//
//				name = $.trim(yourName.val());
//				
//				if(name.length < 1){
//					alert("Please enter a nick name longer than 1 character!");
//					return;
//				}
//
//				email = yourEmail.val();
//
//				if(!isValid(email)) {
//					alert("Please enter a valid email!");
//				}
//				else {
//
//					showMessage("inviteSomebody");
//
//					// call the server-side function 'login' and send user's parameters
//					socket.emit('login', {user: name, avatar: email, id: id});
//				}
//			
//			});
//		}

//		else
//			if(data.number === 1) {
//			
//			//alert("jedna osoba w czacie " +data.user);
//			//showMessage("graa");
//			//showMessage("inviteSomebody");
//
//			//showMessage("personinchat",data);
//
//			loginForm.on('submit', function(e){
//
//				e.preventDefault();
//
//				name = $.trim(hisName.val());
//
//				if(name.length < 1){
//					alert("Please enter a nick name longer than 1 character!");
//					return;
//				}
//
//				if(name == data.user){
//					alert("There already is a \"" + name + "\" in this room!");
//					return;
//				}
//				email = hisEmail.val();
//
//				if(!isValid(email)){
//					alert("Wrong e-mail format!");
//				}
//				else {
//					socket.emit('login', {user: name, avatar: email, id: id});
//				}
//
//			});
//		}
//
//		else {
//			showMessage("tooManyPeople");
//		}

	});

	// Other useful 

	socket.on('startChat', function(data){
		//alert("weslo do start czat");
		socket.emit('wynik', {user: name, wynik: mojWynik});
		console.log("poszed emit z "+name+' '+mojWynik);
		console.log(data);
		if(data.boolean && data.id == id) {

			chats.empty();
//to wykorzystac do tego co ma sie kiedy pokazywac
			if(name === data.users[0]) {

				showMessage("youStartedChatWithNoMessages",data);
			}
			else {

				showMessage("heStartedChatWithNoMessages",data);
			}

			chatNickname.text(friend);
		}
	});

	socket.on('leave',function(data){

		if(data.boolean && id==data.room){

			showMessage("somebodyLeft", data);
			chats.empty();
		}

	});

	socket.on('tooMany', function(data){

		if(data.boolean && name.length === 0) {

			showMessage('tooManyPeople');
		}
	});

	socket.on('receive', function(data){

		showMessage('chatStarted');

		if(data.msg.trim().length) {
			createChatMessage(data.msg, data.user, data.img, moment());
			scrollToBottom();
		}
	});


	textarea.keypress(function(e){

		// Submit the form on enter

		if(e.which == 13) {
			e.preventDefault();
			chatForm.trigger('submit');
		}

	});
	

		
		
		
		
		

	
	socket.on('wynik', function(data){

			//odblokowuje ekran czekania i daje submit
		//alert("otrzymalem wynik " +data.wynik);
		if(mojWynik>data.wynik){
			textToDisplay.text("You win! Result "+mojWynik+" - "+data.wynik);
			result.fadeIn(1200);
		}
		if(mojWynik<data.wynik){
			textToDisplay.text("You lose! Result "+mojWynik+" - "+data.wynik);
			result.fadeIn(1200);
		}
		if(mojWynik==data.wynik){
			textToDisplay.text("Remis "+mojWynik+" - "+data.wynik);
			result.fadeIn(1200);
		}
	});
	socket.on('end', function(data){
		var url = "http://localhost:8085/GamesPortal/rest/invitation/";
		

		var client = new XMLHttpRequest();

		client.open("DELETE", url + id, false);

		client.setRequestHeader("Content-Type", "text/plain");

		client.send();
		if (client.status == 200) {
			alert("dobry status");
		}
		window.location.assign("http://"+window.location.host+"/GamesPortal/user/home");
		
	});
	

    end.on('click',function (e) {
    	e.preventDefault();
        socket.emit('end', {user: name, msg: 'koniec'});
        window.location.assign("http://"+window.location.host+"/GamesPortal/user/home");
    });

   

	chatForm.on('submit', function(e){

		e.preventDefault();

		// Create a new chat message and display it directly

		showMessage("graa");

		if(textarea.val().trim().length) {
			createChatMessage(textarea.val(), name, img, moment());
			scrollToBottom();

			// Send the message to the other person in the chat
			socket.emit('msg', {msg: textarea.val(), user: name, img: img});

		}
		// Empty the textarea
		textarea.val("");
	});

	// Update the relative time stamps on the chat messages every minute

	setInterval(function(){

		messageTimeSent.each(function(){
			var each = moment($(this).data('time'));
			$(this).text(each.fromNow());
		});

	},60000);

	// Function that creates a new chat message

	function createChatMessage(msg,user,imgg,now){

		var who = '';

		if(user===name) {
			who = 'me';
		}
		else {
			who = 'you';
		}

		var li = $(
			'<li class=' + who + '>'+
				'<div class="image">' +
					'<img src=' + imgg + ' />' +
					'<b></b>' +
					'<i class="timesent" data-time=' + now + '></i> ' +
				'</div>' +
				'<p></p>' +
			'</li>');

		// use the 'text' method to escape malicious user input
		li.find('p').text(msg);
		li.find('b').text(user);

		chats.append(li);

		messageTimeSent = $(".timesent");
		messageTimeSent.last().text(now.fromNow());
	}

	function scrollToBottom(){
		$("html, body").animate({ scrollTop: $(document).height()-$(window).height() },1000);
	}

	function isValid(thatemail) {

		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(thatemail);
	}

	function showMessage(status,data){

		if(status === "connected"){

			section.children().css('display', 'none');
			onConnect.fadeIn(1200);
		}

		else if(status === "inviteSomebody"){

			// Set the invite link content
			$("#link").text(window.location.href);

			onConnect.fadeOut(1200, function(){
				//inviteSomebody.fadeIn(1200);
			});
		}

		else if(status === "personinchat"){

			//onConnect.css("display", "none");
			//personInside.fadeIn(1200);
			
			//waiting.fadeIn(1200);
			chatNickname.text(data.user);
			ownerImage.attr("src",data.avatar);
		}

		else if(status === "youStartedChatWithNoMessages") {
			

//			left.fadeOut(1200, function() {
//				waiting.fadeOut(1200,function(){
//					//noMessages.fadeIn(1200);
//					graa.fadeIn(1200);
//					footer.fadeIn(1200);
//				});
////				inviteSomebody.fadeOut(1200,function(){
////					noMessages.fadeIn(1200);
////					footer.fadeIn(1200);
////				});
//			});

			friend = data.users[1];
			noMessagesImage.attr("src",data.avatars[1]);
		}

		else if(status === "heStartedChatWithNoMessages") {
			

//			waiting.fadeOut(1200,function(){
//				//noMessages.fadeIn(1200);
//				graa.fadeIn(1200);
//				footer.fadeIn(1200);
//			});
//			personInside.fadeOut(1200,function(){
//				noMessages.fadeIn(1200);
//				footer.fadeIn(1200);
//			});

			friend = data.users[0];
			noMessagesImage.attr("src",data.avatars[0]);
		}

		else if(status === "chatStarted"){

			section.children().css('display','none');
			chatScreen.css('display','block');
		}
		
		else if(status === "graa"){

			section.children().css('display','none');
			graa.fadeIn(1200);
		}
		else if(status === "waiting"){
			
			section.children().css('display','none');
			question.fadeOut();
			waiting.fadeIn(1200);
		}
		else if(status === "start"){
			
			section.children().css('display','none');
			question.fadeIn(1200);
		}

		else if(status === "somebodyLeft"){

			leftImage.attr("src",data.avatar);
			leftNickname.text(data.user);

			section.children().css('display','none');
			footer.css('display', 'none');
			left.fadeIn(1200);
		}

		else if(status === "tooManyPeople") {

			section.children().css('display', 'none');
			tooManyPeople.fadeIn(1200);
		}
	}

});
