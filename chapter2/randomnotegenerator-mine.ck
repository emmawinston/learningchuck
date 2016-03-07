// 07-03-2016 Random MIDI number generation

SqrOsc s => dac;
1.0 => s.gain;

while (true) {
    
    Math.random2(0, 127) => int midi => Std.mtof => float note;
    note => s.freq;
    <<< "MIDI number", midi >>>;
    second / 2 => now;
}