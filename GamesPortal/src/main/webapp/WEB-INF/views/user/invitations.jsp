<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<%@ page session="false"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@include file="../includes/scripts.jsp"%>
		<title>User Page</title>
<!-- <title>QuizMe Dashboard</title> -->
<!-- <meta charset="UTF-8"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- <!-- Optional theme --> 
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"> -->

<!-- <!-- Bootstrap core CSS --> 
<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet"> -->

<!-- <!-- Custom styles for this template --> 
<!-- <link href="../resources/css/dashboard.css" rel="stylesheet"> -->
<!-- <script type="text/javascript" src="../resources/js/lib/canvasjs.min.js"></script> -->
<%-- <link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-theme.min.css"/>'> --%>

 <style>
        #content { padding:5px; background:#ddd; border-radius:5px; overflow-y: scroll;
                   border:1px solid #CCC; margin-top:10px; height: 160px; }
        #input { border-radius:2px; border:1px solid #ccc;
                 margin-top:10px; padding:5px; width:400px;  }
        #status { width:88px; display:block; float:left; margin-top:15px; }
        </style>

</head>

	<body role="document">
		<%@include file="../includes/header2.jsp"%>
		<div class=" client-photo-background">
			<div class="container-fluid">
				<div class="row">
					<%@include file="../includes/side_bar.jsp"%>
					<div class="col-xs-9 col-xs-offset-3 col-md-10 col-md-offset-2">
						<div class="jumbotron">
<!-- 			<div class="col-sm-9col-sm-offset-3 col-md-10 main" -->
<!-- 				style="margin-left: 17%; margin-top: 0%; width: 80%;"> -->





				<div class="span12">
					<h2>List Of Invitations</h2>
				</div>
			
				</br>
				<table id="example" class="table table-striped table-bordered text-center"
					cellspacing="0" width="100%">
					<thead>
						<tr class="info">
							<th>Invitation From</th>
							<th width="30%"><spring:message code="user.options" /></th>
						</tr>
					</thead>
					<tfoot >
						<tr class="info">
							<th>Invitation From</th>
							<th width="30%"><spring:message code="user.options" /></th>
						</tr>
					</tfoot>
					<tbody>
						<c:if test="${invitations.size()==0}">
							<tr>
								<td>There are no new invitations.</td>
							</tr>
						</c:if>
						<c:forEach items="${invitations}" var="inv">
							<tr>
								<td>${inv.inviting.username}</td>
								<td align="center"><a onclick="sendData(${inv.id})"
									href="${contextPath}/user/invitation/accept/${inv.id}/${inv.quizId.id}"
									class="btn btn-primary" id="acceptBtn" role="button">Akceptuj</a>&nbsp;&nbsp;<a
									href="${contextPath}/user/invitation/reject/${inv.id}"
									class="btn btn-primary" role="button">Odrzuc</a>&nbsp;&nbsp;
									</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<input type="button" id="cceptBtn" value="accept" class="btn btn-primary btn-sm"> 
<!-- 				<input type="button" id="startBtn" value="Start" class="btn btn-primary btn-sm">  -->
<!-- 				<p id="demo" onclick="myFunction()">Click me to change my text color.</p> -->

<div id="login">${userLogin}</div>

 <div id="content"></div>
        <div>
            <span id="status">Connecting...</span>
            <input type="text" id="input" disabled="disabled" />
        </div>
			</div>
			
<!-- </div> -->
</div>
</div>

		</div>
	</div>

	<script
		src="http://cdn.datatables.net/1.10.6/js/jquery.dataTables.min.js"></script>
	<script
		src="http://cdn.datatables.net/plug-ins/1.10.6/integration/bootstrap/3/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#example').dataTable();
		});
		
		

// 		$('#startBtn').on('click', function() {
// 			board.start();
// 			updateStatus();
			
// 		});


	</script>
	
<script >

var connection = new WebSocket('ws://127.0.0.1:1337');
//----------------------------------------------------
function sendData(id){
//window.alert("wyswietlil sie alert z id"+ id );
//var qameId=id;
	connection.send(id);
	console.log('poszlo id');
}
//----------------------------------------------------
var init = function() {
	
	var content = $('#content');
    var input = $('#input');
    var status = $('#status');
    var login =document.getElementById("login").innerHTML;
    // my color assigned by the server
    var myColor = false;
    // my name sent to the server
    var myName = false;//document.getElementById("login").innerHTML;
    
    // if user is running mozilla then use it's built-in WebSocket
    window.WebSocket = window.WebSocket || window.MozWebSocket;

    // if browser doesn't support WebSocket, just show some notification and exit
    if (!window.WebSocket) {
        content.html($('<p>', { text: 'Sorry, but your browser doesn\'t '
                                    + 'support WebSockets.'} ));
        input.hide();
        $('span').hide();
        return;
    }

    // open connection
    var connection = new WebSocket('ws://127.0.0.1:1337');

    connection.onopen = function () {
        // first we want users to enter their names
        input.removeAttr('disabled');
       // status.text('Choose name:');
        status.text(myName + ': ');
    };

    connection.onerror = function (error) {
        // just in there were some problems with conenction...
        content.html($('<p>', { text: 'Sorry, but there\'s some problem with your '
                                    + 'connection or the server is down.' } ));
    };

    // most important part - incoming messages
    connection.onmessage = function (message) {
        // try to parse JSON message. Because we know that the server always returns
        // JSON this should work without any problem but we should make sure that
        // the massage is not chunked or otherwise damaged.
        try {
            var json = JSON.parse(message.data);
        } catch (e) {
            console.log('This doesn\'t look like a valid JSON: ', message.data);
            return;
        }

        // NOTE: if you're not sure about the JSON structure
        // check the server source code above
        if (json.type === 'color') { // first response from the server with user's color
            myColor = json.data;
            status.text(myName + ': ').css('color', myColor);
            input.removeAttr('disabled').focus();
            // from now user can start sending messages
        } else if (json.type === 'history') { // entire message history
            // insert every single message to the chat window
            for (var i=0; i < json.data.length; i++) {
                addMessage(json.data[i].author, json.data[i].text,
                           json.data[i].color, new Date(json.data[i].time));
            }
        } else if (json.type === 'message') { // it's a single message
            input.removeAttr('disabled'); // let the user write another message
            addMessage(json.data.author, json.data.text,
                       json.data.color, new Date(json.data.time));
        } else {
            console.log('Hmm..., I\'ve never seen JSON like this: ', json);
        }
    };

    /**
     * Send mesage when user presses Enter key
     */
    
    $('#acceptBtn').on('click', function() {
    	 var login = $('#login').html(); 
		  connection.send(login);
    	//var id =  $('#gameId').html();
    		//document.getElementById("gameId").innerHTML;
    	
    	console.log("po wyslaniu!!!!!!!! " +login + id);
    	//connection.send("dududud");
	});
    
    $('#startBtn').on('click', function() {
    	window.alert("jestem po kliknieciu"); 
		
	});
    
    
	
    input.keydown(function(e) {
        if (e.keyCode === 13) {
            var msg = $(this).val();
            if (!msg) {
                return;
            }
            // send the message as an ordinary text
            connection.send(msg);
            $(this).val('');
            // disable the input field to make the user wait until server
            // sends back response
            
            //input.attr('disabled', 'disabled');

            // we know that the first message sent from a user their name
            if (myName === false) {
                myName = msg;
            }
        }
    });
   

    /**
     * This method is optional. If the server wasn't able to respond to the
     * in 3 seconds then show some error message to notify the user that
     * something is wrong.
     */
    setInterval(function() {
        if (connection.readyState !== 1) {
            status.text('Error');
            input.attr('disabled', 'disabled').val('Unable to comminucate '
                                                 + 'with the WebSocket server.');
        }
    }, 3000);

    /**
     * Add message to the chat window
     */
    function addMessage(author, message, color, dt) {
        content.prepend('<p><span style="color:' + color + '">' + author + '</span> @ ' +
             + (dt.getHours() < 10 ? '0' + dt.getHours() : dt.getHours()) + ':'
             + (dt.getMinutes() < 10 ? '0' + dt.getMinutes() : dt.getMinutes())
             + ': ' + message + '</p>');
    }
    
}



$('#acceptBtn').on('click', function() {
	  var login = $('#login').html(); 
	  connection.send(login);
});

$(document).ready(init);
//$(document).ready(sendLogin);
	
</script>


<script src="<c:url value="/resources/js/angular/chat/socket.io.js" />"></script>
<script src="<c:url value="/resources/js/angular/chat/chat.js" />"></script>
<script src="<c:url value="/resources/js/angular/chat/moment.min.js" />"></script>

<%-- <script src="<c:url value="/resources/js/angular/frontend.js" />"></script> --%>
</body>
</html>
