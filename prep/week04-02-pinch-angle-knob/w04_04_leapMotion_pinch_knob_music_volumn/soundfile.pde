import processing.sound.*;
SoundFile soundfile;

void setupSound() {        
    //Load a soundfile
    soundfile = new SoundFile(this, "vibraphon.aiff");
    soundfile.loop();
} 