#include <ESP8266WiFi.h>
#include <WebSocketsClient.h>

WebSocketsClient wsc;

const char *ssid = "";
const char *pass = "";

#define SERVER  "192.168.43.228"
#define PORT    3000
#define URL     "/"

void websocketEvent(WStype_t type, uint8_t *data, size_t length){
  switch(type){
    case(WStype_CONNECTED):
      Serial.printf("connected to server\n");
      break;
    case WStype_DISCONNECTED:
      Serial.printf("Disconnected!\n");
      break;
    case WStype_TEXT:
       int value;
       if (length == 3 ){
          value = (data[0]-'0')*100 + (data[1]-'0')*10 + (data[2]-'0');
       } else if (length==2){
          value = (data[0]-'0')*10 + (data[1]-'0');
       } else {
          value = (data[0]-'0');
       }
        analogWrite(LED_BUILTIN, value*(1023/255));
        Serial.printf("value:%d\n", value);
        break;
  }
}

void setup(){
  Serial.begin(115200);

  WiFi.begin(ssid, pass);

  while(WiFi.status() != WL_CONNECTED){
    Serial.println(".");
    delay(500);
  }

  Serial.println(WiFi.SSID());
  Serial.println(WiFi.localIP());

  wsc.begin(SERVER, PORT, URL);
  wsc.onEvent(websocketEvent);
  // try ever 1000 again if connection has failed
  wsc.setReconnectInterval(1000);
}

void loop(){
  wsc.loop();
}
