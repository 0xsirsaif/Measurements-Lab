const express = require('express')
const app = express()

const PORT = 3000

app.get('/',function(req,res){
    res.sendFile(__dirname+"/index.html");
});

const server = app.listen(PORT,function(){
    console.log("Server is runinng at port "+ PORT);
});

const SocketServer = require('ws').Server;
const wss = new SocketServer({ server });


wss.on('connection', function(ws){
	console.log('Client connected');
	
    ws.send("HELLO CLIENT")

	ws.on('message', function(msg){
        data = JSON.parse(msg)
        broadcast(data);
	});
	
	ws.on('close', function(){
		console.log('Client disconnected');
	});
});

function broadcast(msg) {    
	wss.clients.forEach(function (client) {
		if (client.readyState === client.OPEN) {
			client.send(msg);
		} else {
			console.log("client off");
		}
	});
}