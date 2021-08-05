# Jukebox
Juke-Box avec une puce RFID

> Définition de Jukebox : Électrophone automatique, généralement payant, que l’on retrouve dans certains lieux publics et qui permet de faire jouer un disque sélectionné. (Définition d’Antidote)

> Définition de RFID : Sigle de Radio frequency identification.

Le Jukebox électriquement est composé de 3 parties : 
1. Une partie qui est en charge de la puce RFID 
2. La seconde partie quant à elle est chargée de la partie lecture du fichier MP3 et de l’amplification audio.
3. Le tout est supervisé par une carte Arduino UNO


## Liste des composant

- PUCE RFID
- Carte Arduino Uno 
- Boutons poussoir 
- Connecteur Jack 
- Amplificateur et lecteur de carte SD
- Potentiomètre 
	 
## Le code es quand à lui es écrit en Arduino 

Ici c’es le code de la partie du player du jukebox

```c
/*
   Thanks to Original Author: ryand1011 (https://github.com/ryand1011)
   Edited by Ananords -

   See: https://github.com/miguelbalboa/rfid/tree/master/examples/rfid_write_personal_data

   Uses MIFARE RFID card using RFID-RC522 reader
   Uses MFRC522 - Library
   -----------------------------------------------------------------------------------------
               MFRC522      Arduino       Arduino   Arduino    Arduino          Arduino
               Reader/PCD   Uno/101       Mega      Nano v3    Leonardo/Micro   Pro Micro
   Signal      Pin          Pin           Pin       Pin        Pin              Pin
   -----------------------------------------------------------------------------------------
   RST/Reset   RST          9             5         D9         RESET/ICSP-5     RST
   SPI SS      SDA(SS)      10            53        D10        10               10
   SPI MOSI    MOSI         11 / ICSP-4   51        D11        ICSP-4           16
   SPI MISO    MISO         12 / ICSP-1   50        D12        ICSP-1           14
   SPI SCK     SCK          13 / ICSP-3   52        D13        ICSP-3           15



  PS: IF THE PLAYER FAILS TO START WHEN THE SERIAL MONITOR IS NOT OPEN, TRY TO COMMENT OUT Serial.begin(115200);
*/

#include <SPI.h>
#include <MFRC522.h>
#include "Arduino.h"
#include "SoftwareSerial.h"
#include "DFRobotDFPlayerMini.h"

#define RST_PIN         9           // Configurable, see typical pin layout above
#define SS_PIN          10          // Configurable, see typical pin layout above

const int playPauseButton = 4;
const int shuffleButton = 3;
const byte volumePot = A0;
int prevVolume; 

byte volumeLevel = 0; //variable for holding volume level

boolean isPlaying = false;

MFRC522 mfrc522(SS_PIN, RST_PIN);   // Create MFRC522 instance

SoftwareSerial mySoftwareSerial(5, 6); // RX, TX

DFRobotDFPlayerMini myDFPlayer;
void printDetail(uint8_t type, int value);



//*****************************************************************************************//
void setup() {
  Serial.begin(115200);                                           // Initialize serial communications with the PC, COMMENT OUT IF IT FAILS TO PLAY WHEN DISCONNECTED FROM PC
  mySoftwareSerial.begin(9600);
  SPI.begin();                                                  // Init SPI bus
  mfrc522.PCD_Init();                                              // Init MFRC522 card



  pinMode(playPauseButton, INPUT_PULLUP);
  pinMode(shuffleButton, INPUT_PULLUP);




  Serial.println(F("Initializing DFPlayer ... (May take 3~5 seconds)"));

  if (!myDFPlayer.begin(mySoftwareSerial)) {  //Use softwareSerial to communicate with mp3.
    Serial.println(F("Unable to begin:"));
    Serial.println(F("1.Please recheck the connection!"));
    Serial.println(F("2.Please insert the SD card!"));
  }
  Serial.println(F("DFPlayer Mini online. Place card on reader to play a spesific song"));

  //myDFPlayer.volume(15);  //Set volume value. From 0 to 30 
  volumeLevel = map(analogRead(volumePot), 0, 1023, 0, 30);   //scale the pot value and volume level
  myDFPlayer.volume(volumeLevel);
  prevVolume = volumeLevel;

  //----Set different EQ----
  myDFPlayer.EQ(DFPLAYER_EQ_NORMAL);
  //  myDFPlayer.EQ(DFPLAYER_EQ_POP);
  //  myDFPlayer.EQ(DFPLAYER_EQ_ROCK);
  //  myDFPlayer.EQ(DFPLAYER_EQ_JAZZ);
  //  myDFPlayer.EQ(DFPLAYER_EQ_CLASSIC);
  //  myDFPlayer.EQ(DFPLAYER_EQ_BASS);

}



//*****************************************************************************************//
void loop() {


  volumeLevel = map(analogRead(volumePot), 0, 1023, 0, 30);   //scale the pot value and volume level


  if (prevVolume != volumeLevel){
  myDFPlayer.volume(volumeLevel);
  }
    prevVolume = volumeLevel;


  // Prepare key - all keys are set to FFFFFFFFFFFFh at chip delivery from the factory.
  MFRC522::MIFARE_Key key;
  for (byte i = 0; i < 6; i++) key.keyByte[i] = 0xFF;

  //some variables we need
  byte block;
  byte len;
  MFRC522::StatusCode status;



  if (digitalRead(playPauseButton) == LOW) {
    if (isPlaying) {
      myDFPlayer.pause();
      isPlaying = false;
      Serial.println("Paused..");
    }
    else {
      isPlaying = true;
      myDFPlayer.start();
      Serial.println("Playing..");
    }
    delay(500);
  }


  if (digitalRead(shuffleButton) == LOW) {
    myDFPlayer.randomAll();
    Serial.println("Shuffle Play");
    isPlaying = true;
    delay(1000);
  }


  //-------------------------------------------

  // Reset the loop if no new card present on the sensor/reader. This saves the entire process when idle.
  if ( mfrc522.PICC_IsNewCardPresent()) {



    // Select one of the cards
    if ( ! mfrc522.PICC_ReadCardSerial()) {
      return;
    }

    Serial.println(F("**Card Detected:**"));

    //-------------------------------------------

    mfrc522.PICC_DumpDetailsToSerial(&(mfrc522.uid)); //dump some details about the card

    //mfrc522.PICC_DumpToSerial(&(mfrc522.uid));      //uncomment this to see all blocks in hex

    //-------------------------------------------

    Serial.print(F("Number: "));


    //---------------------------------------- GET NUMBER AND PLAY THE SONG

    byte buffer2[18];
    block = 1;
    len = 18;

    status = mfrc522.PCD_Authenticate(MFRC522::PICC_CMD_MF_AUTH_KEY_A, 1, &key, &(mfrc522.uid)); //line 834
    if (status != MFRC522::STATUS_OK) {
      Serial.print(F("Authentication failed: "));
      Serial.println(mfrc522.GetStatusCodeName(status));
      return;
    }

    status = mfrc522.MIFARE_Read(block, buffer2, &len);
    if (status != MFRC522::STATUS_OK) {
      Serial.print(F("Reading failed: "));
      Serial.println(mfrc522.GetStatusCodeName(status));
      return;
    }


    //PRINT NUMBER
    String number = "";

    for (uint8_t i = 0; i < 16; i++)
    {
      number += (char)buffer2[i];
    }
    number.trim();
    Serial.print(number);

    //PLAY SONG

    myDFPlayer.play(number.toInt());
    isPlaying = true;



    //----------------------------------------

    Serial.println(F("\n**End Reading**\n"));

    delay(1000); //change value if you want to read cards faster

    mfrc522.PICC_HaltA();
    mfrc522.PCD_StopCrypto1();
  }
}



//*****************************************************************************************//

```

Juke Card programmer

Ici c’es le code source qui sert pour le programmer la jukebox. 

```c
/*
   Write song number data to a MIFARE RFID card using a RFID-RC522 reader
   Uses MFRC522 - Library to use ARDUINO RFID MODULE KIT 13.56 MHZ WITH TAGS SPI W AND R BY COOQROBOT.
   -----------------------------------------------------------------------------------------
               MFRC522      Arduino       Arduino   Arduino    Arduino          Arduino
               Reader/PCD   Uno/101       Mega      Nano v3    Leonardo/Micro   Pro Micro
   Signal      Pin          Pin           Pin       Pin        Pin              Pin
   -----------------------------------------------------------------------------------------
   RST/Reset   RST          9             5         D9         RESET/ICSP-5     RST
   SPI SS      SDA(SS)      10            53        D10        10               10
   SPI MOSI    MOSI         11 / ICSP-4   51        D11        ICSP-4           16
   SPI MISO    MISO         12 / ICSP-1   50        D12        ICSP-1           14
   SPI SCK     SCK          13 / ICSP-3   52        D13        ICSP-3           15

   Hardware required:
   Arduino
   PCD (Proximity Coupling Device): NXP MFRC522 Contactless Reader IC
   PICC (Proximity Integrated Circuit Card): A card or tag using the ISO 14443A interface, eg Mifare or NTAG203.
   The reader can be found on eBay for around 5 dollars. Search for "mf-rc522" on ebay.com or Aliexpress
*/

#include <SPI.h>
#include <MFRC522.h>

#define RST_PIN         9           // Configurable, see typical pin layout above
#define SS_PIN          10          // Configurable, see typical pin layout above

String mode;
int currentNumber = 1; //NUMBER TO START FROM

MFRC522 mfrc522(SS_PIN, RST_PIN);   // Create MFRC522 instance

void setup() {
  Serial.begin(115200);        // Initialize serial communications with the PC
  SPI.begin();               // Init SPI bus
  mfrc522.PCD_Init();        // Init MFRC522 card
  Serial.println(F("Write manual for Manual mode or auto for Automatic mode"));

}


void loop() {

  if (Serial.available()) {

    mode = Serial.readStringUntil('\n');


    if (mode == "auto" || "manual") {
      Serial.println(" ");
      Serial.println("Device is now in " + mode + " mode");
      Serial.println(F("Place the card on the reader and hold it there to write song number data to the card"));
      if (mode == "auto") Serial.println((String)"Number to be written to card: " + currentNumber);

    }

    while (mode == "auto") {

      autoModus();


    }


    while (mode == "manual") {


      manualModus();


    }

    if (mode != "auto" || "manual") {

      Serial.println("Wrong value, write auto or manual");

    }


  }



}

void autoModus() {



  // Prepare key - all keys are set to FFFFFFFFFFFFh at chip delivery from the factory.
  MFRC522::MIFARE_Key key;
  for (byte i = 0; i < 6; i++) key.keyByte[i] = 0xFF;

  // Reset the loop if no new card present on the sensor/reader. This saves the entire process when idle.
  if ( mfrc522.PICC_IsNewCardPresent()) {

    Serial.println(" ");

    // Select one of the cards
    if ( ! mfrc522.PICC_ReadCardSerial()) {
      return;
    }

    Serial.print(F("Card UID:"));    //Dump UID
    for (byte i = 0; i < mfrc522.uid.size; i++) {
      Serial.print(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " ");
      Serial.print(mfrc522.uid.uidByte[i], HEX);
    }


    Serial.print(F(" PICC type: "));   // Dump PICC type
    MFRC522::PICC_Type piccType = mfrc522.PICC_GetType(mfrc522.uid.sak);
    Serial.println(mfrc522.PICC_GetTypeName(piccType));

    byte buffer[16];
    MFRC522::StatusCode status;
    byte block;
    byte len;
    block = 1;



    len = sprintf(buffer, "%d", currentNumber);
    for (byte i = len; i < 30; i++) buffer[i] = ' ';


    //Serial.println(F("Authenticating using key A..."));
    status = mfrc522.PCD_Authenticate(MFRC522::PICC_CMD_MF_AUTH_KEY_A, block, &key, &(mfrc522.uid));
    if (status != MFRC522::STATUS_OK) {
      Serial.print(F("PCD_Authenticate() failed: "));
      Serial.println(mfrc522.GetStatusCodeName(status));
      return;
    }
    else Serial.println(F("PCD_Authenticate() success: "));

    // Write block
    status = mfrc522.MIFARE_Write(block, buffer, 16);
    if (status != MFRC522::STATUS_OK) {
      Serial.print(F("MIFARE_Write() failed: "));
      Serial.println(mfrc522.GetStatusCodeName(status));
      Serial.print(F("Try to reset the device"));
      return;
    }
    else Serial.println(F("MIFARE_Write() success: "));


    mfrc522.PICC_HaltA(); // Halt PICC
    mfrc522.PCD_StopCrypto1();  // Stop encryption on PCD


    currentNumber++;
    Serial.println((String)"Put a new card on the reader to write the number: " + currentNumber);

  }
}


void manualModus() {


  // Prepare key - all keys are set to FFFFFFFFFFFFh at chip delivery from the factory.
  MFRC522::MIFARE_Key key;
  for (byte i = 0; i < 6; i++) key.keyByte[i] = 0xFF;

  // Reset the loop if no new card present on the sensor/reader. This saves the entire process when idle.
  if ( ! mfrc522.PICC_IsNewCardPresent()) {
    return;
  }

  // Select one of the cards
  if ( ! mfrc522.PICC_ReadCardSerial()) {
    return;
  }

  Serial.print(F("Card UID:"));    //Dump UID
  for (byte i = 0; i < mfrc522.uid.size; i++) {
    Serial.print(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " ");
    Serial.print(mfrc522.uid.uidByte[i], HEX);
  }
  Serial.print(F(" PICC type: "));   // Dump PICC type
  MFRC522::PICC_Type piccType = mfrc522.PICC_GetType(mfrc522.uid.sak);
  Serial.println(mfrc522.PICC_GetTypeName(piccType));

  byte buffer[34];
  byte block;
  MFRC522::StatusCode status;
  byte len;

  Serial.setTimeout(20000L) ;     // wait until 20 seconds for input from serial
  // Ask for song number data
  Serial.println(F("Type any number and hit send/enter"));
  len = Serial.readBytesUntil('\n', (char *) buffer, 30) ; // read number from serial
  for (byte i = len; i < 30; i++) buffer[i] = ' ';     // pad with spaces

  block = 1;
  //Serial.println(F("Authenticating using key A..."));
  status = mfrc522.PCD_Authenticate(MFRC522::PICC_CMD_MF_AUTH_KEY_A, block, &key, &(mfrc522.uid));
  if (status != MFRC522::STATUS_OK) {
    Serial.print(F("PCD_Authenticate() failed: "));
    Serial.println(mfrc522.GetStatusCodeName(status));
    return;
  }
  else Serial.println(F("PCD_Authenticate() success: "));

  // Write block
  status = mfrc522.MIFARE_Write(block, buffer, 16);
  if (status != MFRC522::STATUS_OK) {
    Serial.print(F("MIFARE_Write() failed: "));
    Serial.println(mfrc522.GetStatusCodeName(status));
    return;
  }
  else Serial.println(F("MIFARE_Write() success: "));

  Serial.println("Put a new card on the reader to write a new number");



  Serial.println(" ");
  mfrc522.PICC_HaltA(); // Halt PICC
  mfrc522.PCD_StopCrypto1();  // Stop encryption on PCD

}

```



### Liens 

[https://fr.wikipedia.org/wiki/Arduino](https://fr.wikipedia.org/wiki/Arduino)
[https://github.com/miguelbalboa/rfid/tree/master/examples/rfid\_write\_personal\_data](https://github.com/miguelbalboa/rfid/tree/master/examples/rfid_write_personal_data)
