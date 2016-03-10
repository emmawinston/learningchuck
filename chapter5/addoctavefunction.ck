// function that adds octave to any MIDI note number passed to it

function int addOctave( int note )
{
    int result;
    note + 12 => result;
    return result;
}

// call and print out
addOctave(60) => int answer;
<<< answer >>>;