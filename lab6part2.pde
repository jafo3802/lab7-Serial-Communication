import processing.serial.*;    // Importing the Serial library
import java.util.Map;          // Importing library to use HashMap

Serial port;    // Creating an object to handle serial communication

// String variable to store the received serial string
String serialString;
// Dictionary for all the values received over serial
HashMap<String, Integer> serialData = new HashMap<String, Integer>();

void setup() {    // Executes once
  size(640, 480);

  // Specifying the USB port to which the Arduino is connected
  // And attaching to the serial object 
  
  // ##### CHANGE FOR YOUR MACHINE, CHECK IN ARDUINO IDE #####
  String portName = "/dev/cu.usbmodem143201";  

  port = new Serial(this, portName, 9600);
  port.bufferUntil('\n');
}

void draw() {     
  // Parse the data received over Serial in the form 
  // key1:value1;key2:value2;key3:value3...
  parseSerialData();
 
  // Checks if serialData is available and updated before using it 
  if (!serialData.isEmpty()) {
    
    //################# WRITE YOUR CODE HERE #####################//
    int x = serialData.get("xVal");
    int y = serialData.get("yVal");
    int button = serialData.get("swVal");
    
    x = int(map(x, 0, 1023, 0, 640));
    y = int(map(y, 0, 1023, 0, 480));
    
    mouseX = x;
    mouseY = y;
    
 
    if(button == 0){
      fill(0);
      ellipse(x, y, 80, 80);
    }else{
      fill(255, 90, 5);
      ellipse(x, y, 80, 80);
    }
      
    




  }
}

// serialEvent function 
  // Triggered whenever data is received over serial
void serialEvent(Serial p) {
  serialString = p.readString();
}

// parseSerialData function
  // Read the serialString variable of the form 
  // "Key1:Value1;Key2:Value2;Key3:Value3 ..."
  // And update the serialData HashMap
void parseSerialData() {
  // Delimiters used to split the string
  final String MAP_ITEMS_DELIMITER = ";";  // ; to split key-value pairs
  final String KEY_VALUE_DELIMITER = ":";  // : to split key and value
  
  if (serialString == null || serialString.length() == 0) {
    // Do nothing if empty string
    return;
  }
  
  String[] keyValuePairStrings = serialString.split(MAP_ITEMS_DELIMITER);
  
  for (String kvString : keyValuePairStrings) {
    String[] keyValuePair = kvString.split(KEY_VALUE_DELIMITER);
    if (keyValuePair == null || keyValuePair.length < 2) {
      // skip if we have bad input
      continue;
    }
    
    // trim our values now 
    String keyItem = trim(keyValuePair[0]);
    String value = trim(keyValuePair[1]);
    int itemValue = int(value);
    
    // Put the value into our hashmap
    serialData.put(keyItem, itemValue);
  } 
}
