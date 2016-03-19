// array adder function 19-03-2016

//global array
[60, 62, 63, 65, 67, 69, 70, 72] @=> int scale[];

// array adder function
function void arrayAdder( int temp[], int index )
{
    1 +=> temp[index];
}

//test it 
<<< scale[0], scale[1], scale[2], scale[3] >>>;
arrayAdder(scale, 2);
<<< scale[0], scale[1], scale[2], scale[3] >>>;
<<< "scale[6] is ", scale[6] >>>;
arrayAdder(scale, 6);
<<< "scale[6] is ", scale[6] >>>;
