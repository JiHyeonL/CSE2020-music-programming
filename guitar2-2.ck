MidiOut mout;
MidiMsg msg;
14 => int port; // ??? ??? ?? ??? ?? ??
if (!mout.open(port)) {
    <<< "Error: MIDI port did not open on port: ", port >>>;
    me.exit();
}

fun void sendOutMIDInote(int on, int note, int velocity) {
    if(note != 0) {
    if (on == 0)
        128 => msg.data1; // 10000000 NoteOff
    else // on == 1
        144 => msg.data1; // 10010000 NoteOn
    note => msg.data2;
    velocity => msg.data3;
    <<< msg.data1, msg.data2, msg.data3 >>>;
    mout.send(msg);
}

}

// tempo
0.66::second => dur beat; // basic duration
beat => dur qn; // quarter (1/4) note sound
beat * 2 => dur hn; // half (1/2) note sound
beat / 2 => dur en; // eighth (1/8) note sound
en / 2 => dur sn; // sixteen(1/16) note sound
en+sn => dur en_d; // eighth dot note sound
beat / 5 => dur rest; // duration of no sound after each note


[83,71] @=> int a[];
[82,70] @=> int b[];
[85,73] @=> int c[];
[87,75] @=> int d[];
[0,0] @=> int n[];

[n,n,n,n,n,n,n,n, n,n,n,n,n,n,n,n, n,n,n,n,n,n,n,n, n,n,n,n,n,n,n,n,
n,n,n,n,n,n,n,n, n,n,n,n,n,n,n,n, n,n,n,n,n,n,n, a,b,a,c,c,d,
n,n,n,n,n,n,n,n, n,n,n,n,n,n,n,n, n,n,n,n,n,n,n,n, n,n,n,n,n,n,n,n,
n,n,n,n,n,n,n,n, n,n,n,n,n,n,n,n, n,n,n,n,n,n,n, a,b,a,c,c,d] @=> int chords[][];

[en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,qn, en,en,en,en,qn,qn,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,qn, en,en,en,en,qn,qn

] @=> dur durs[]; 


[79,0,0,0,0,0,0,0, 77,0,0,0,0,0,75,0, 79,0,0,0,0,0,0,0, 77,0,0,0,0,0,75,0,
75,70,75,77,0,0,0,0, 75,70,75,77,0,0,0,0, 78,70,78,77,0,0,0, -1,-1,-1,-1,0,-1,
79,0,0,0,0,0,0,0, 77,0,0,0,0,0,75,0, 79,0,0,0,0,0,0,0, 77,0,0,0,0,0,75,0,
75,70,75,77,0,0,0,0, 75,70,75,77,0,0,0,0, 78,70,78,77,0,0,0, -1,-1,-1,-1,0,-1
] @=> int melody[]; 

/*
[80,71,80,71] @=> int melody[];
for (0 => int i; i < 4; i++) {
sendOutMIDInote(1,melody[i], 100);
 0.25::second => now;
}
*/
//chords.size()

for (0 => int i; i < durs.size(); i++) {
    if(melody[i] == -1) {
        sendOutMIDInote(1,chords[i][0], 100);
        sendOutMIDInote(1,chords[i][1], 100);   
        durs[i] => now;
        
        sendOutMIDInote(0,chords[i][0], 100);
        sendOutMIDInote(0,chords[i][1], 100);  
        0.00001::second => now;     
        }
      else if(melody[i] == 0){
        sendOutMIDInote(0,melody[i], 100);
        durs[i] => now;
        
        sendOutMIDInote(0, melody[i], 0);
        0.00001::second => now;
        }  
    else {
        sendOutMIDInote(1,melody[i], 90);
        durs[i] => now;
        
        sendOutMIDInote(0, melody[i], 0);
        0.00001::second => now;
        }  
} 

me.exit();
