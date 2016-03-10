//addoctave function for music
function int addOctave( int note )
{
    int result;
    note + 12 => result;
    return result;
}

// run the program with function
SinOsc s => dac;
60 => int myNote;

Std.mtof(myNote) => s.freq;
second => now;

myNote => addOctave => Std.mtof => s.freq;
second => now;
