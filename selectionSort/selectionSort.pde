int[] ourList;

void bubbleSort(int[] someList) {
  boolean swapRequired = true;

  while (swapRequired) {
    swapRequired = false;

    //one pass is one time through the array
    for (int x=0; x < someList.length - 1; x++) {
      //check if need to swap
      if (someList[x] > someList[x+1]) {
         int temp = someList[x];
         someList[x] = someList[x+1];
         someList[x+1] = temp;
         swapRequired = true;
      }
    }
    
    //println(someList); println();
  }
}

void selectionSort(int[] aList) {
   int location = 0;
   
   while (location < aList.length) {
     
     int smallestLocation = location;
     //one pass
     for (int i=location; i < aList.length; i++) {
       if (aList[i] < aList[smallestLocation]) {
         smallestLocation = i;
       }
     }
     
     int temp = aList[location];
     aList[location] = aList[smallestLocation];
     aList[smallestLocation] = temp;
     
     location++;
   }
}

void setup() {
  //randomize array
  int arraySize = 100000;
  ourList = new int[arraySize];
  for (int i=0; i<arraySize; i++) {
    ourList[i] = int(random(1, 1000));
  }
  
  //check the speeds by printing out millis()
  //bubbleSort(ourList);
  //selectionSort(ourList);
  //ourList = sort(ourList);
  print(millis()); println();
  
  //println(ourList);
}

void draw() {
}