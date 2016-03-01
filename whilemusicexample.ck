/* musical while loop 01/03/2016 */

SinOsc s => dac;

//initialise variable i
20 => int i;

//while loop instead of for loop
while (i < 400)
{
    <<< i >>>;
    i => s.freq;
    10::ms => now;
    i++; //update counter
}

while (i > 0)
{
    <<< i >>>;
    i => s.freq;
    10::ms => now;
    i--;
}