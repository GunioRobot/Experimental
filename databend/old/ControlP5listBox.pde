/**
 * ControlP5 ListBox
 * listBox operates the same way as a scrollList, but
 * is optimized for many items (1000+). using a listBox
 * over a scrollList is recommended
 * by andreas schlegel, 2009
 */



void controlP5ListBox() {

  controlP5 = new ControlP5(this);
  l = controlP5.addListBox("myList",0,15,120,120);

  // apparence
  l.setItemHeight(15);
  l.setBarHeight(15);

  l.captionLabel().toUpperCase(true);
  l.captionLabel().set("images");
  l.captionLabel().style().marginTop = 3;
  l.valueLabel().style().marginTop = 3; // the +/- sign

  l.setColorBackground(color(0,128));
  l.setColorForeground(color(0));
  l.setColorActive(color(0));
  // fin apparence


  // ajouter les elements
  //println(filenames + " : cul");

  for(int i=0;i<filenames.length;i++) {
    l.addItem(filenames[i],i);
  }
}


void controlEvent(ControlEvent theEvent) {
  // ListBox is if type ControlGroup.
  // 1 controlEvent will be executed, where the event
  // originates from a ControlGroup. therefore
  // you need to check the Event with
  // if (theEvent.isGroup())
  // to avoid an error message from controlP5.

  if (theEvent.isGroup()) {
    // an event from a group e.g. scrollList
    println(theEvent.group().value()+" from "+theEvent.group());
  }
}

