// playing a scale with functions and global values 19-03-16
Mandolin mand => dac;
60 => int note;

//functions
function void noteUp() 
{
    1 +=> note;
    <<< note >>>;
    play();
    }

function void noteDown()
{
    1 -=> note;
    <<< note >>>;
    play();
    }
    
function void play()
{
    Std.mtof(note) => mand.freq;
    1 => mand.noteOn;
    second => now;
} 

//main program
while (true) {
    noteUp();
    noteDown();
    noteUp();
    noteUp();
    noteDown();
}