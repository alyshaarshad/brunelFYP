// == OscListener ===============================================

class MyOSCListener {
  

  
  int port;
  OscP5 osc;
  boolean filterMessage;
  
  MyOSCListener(int thePort) {
    port = thePort;
    osc = new OscP5(this,port);
  }
  
  public void stop() { 
    osc.stop();  
  }
  
  public void oscEvent(OscMessage theOscMessage)throws IOException {
    
    // store address in oscaddressesHash
    addOSCaddress(theOscMessage.addrPattern());
    
    // normally all messages are filtered (pass through filter)
    // if there is an item in the oscFilteraddressedHash its 
    // compared with the incoming message if the addresses in in the Hash list
    // the message is passed through. 
    
    if(countFilteredaddresses>0)
    { filterMessage = false;
      
      if((Integer) oscaddressesHash.get(theOscMessage.addrPattern()) == 1)
      { filterMessage = true;
      }    
    }
    else filterMessage = true;
   
    // only monitor message if filter pass through is true   
    if(filterMessage)
    { // empty the monitor string
      monitor = "";
      
      // dadd address pattern to string
      monitor = "["+port+"] " + theOscMessage.addrPattern();
      
      typetag = theOscMessage.typetag();
      
      // display each data item in the monitor.   
      for(int i=0;i<typetag.length();i++)
      { tag = typetag.charAt(i);
        
        if(tag == 'i') // message has integer
        { monitor = monitor + " " + theOscMessage.get(i).intValue() + " (int)";    
        }
        else if(tag == 'f') // message has float
        { // use nfc to lmit the float to 3 decimals and convert it to a string
          monitor = monitor + " " + nfc(theOscMessage.get(i).floatValue(),3) + " (float)";
        }
        else if(tag == 's') // message has string
        { monitor = monitor + " " + theOscMessage.get(i).stringValue() + " (string)";
        }  
        else
        { // other type see documentation:
          // http://www.sojamo.de/libraries/oscP5/reference/oscP5/OscArgument.html
          // print the type tag but not the value
          monitor = monitor + " type:" + typetag;
        }
      }
      
      monitorHash.put(theOscMessage.addrPattern(),new String(monitor));
      
      println(monitor);


                // Step #1. Create a file object.
                File file = new File("Desktop/disso/data/section 3 data/data-mag.txt");
                //data - section1-wt.txt",data - section2-wt.txt
                //data-section3-KA.txt
                //data-section2-ES.txt
                //data-section3-MA
                //data-section1-TA
                
                

                // Step #2. Create a file writer object with above file.
                FileWriter fileWriter = new FileWriter(file,true);

                // Step #3. Create a file object with above file writer.
                BufferedWriter writer = new BufferedWriter(fileWriter);

                // Step #4. Prepare data to be stored in above file.
                String message = "New Content in the file";

                // Step #5. Perform write operation.
                writer.append(",");
                writer.append(monitor);

                // Step #6. free the resources.
                writer.close();
                
      
      //String objectsCommaSeparated = objects.stream().collect(Collectors.joining(","));
      //System.out.println(objectsCommaSeparated);
      
      // add the string to the monitor list array. 
      // will be displayed in the draw() loop.
      // if statement prevents adding to much data
      // incase of a data overflow no new data is added...
      if(monitorList.size()<monitorListLength+25)
      { monitorList.add((String) monitor);
      }
      else 
      { //println("overflow...");
      }
      
      
    }
  }
}
