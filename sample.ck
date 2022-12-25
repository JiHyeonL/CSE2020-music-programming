MidiOut mout;
MidiMsg msg;
1 => int port; // ??? ??? ?? ??? ?? ??
if (!mout.open(port)) {
    <<< "Error: MIDI port did not open on port: ", port >>>;
    me.exit();
}

fun void sendOutMIDInote(int on, int note, int velocity) {
    if (on == 0)
        128 => msg.data1; // 10000000 NoteOff
    else // on == 1
        144 => msg.data1; // 10010000 NoteOn
    note => msg.data2;
    velocity => msg.data3;
    <<< msg.data1, msg.data2, msg.data3 >>>;
    mout.send(msg);
}

// tempo
0.66::second => dur beat; // basic duration
beat => dur qn; // quarter (1/4) note sound
beat * 2 => dur hn; // half (1/2) note sound
beat / 2 => dur en; // eighth (1/8) note sound
en / 2 => dur sn; // sixteen(1/16) note sound
en+sn => dur en_d; // eighth dot note sound
beat / 5 => dur rest; // duration of no sound after each note


[56,63,70,74,0,0] @=> int A9[];
[56,63,68,70,75,0] @=> int Aadd9[];
[58,65,70,74,0,0] @=> int B[];
[58,65,70,75,0,0] @=> int Bsus4[];
[51,58,63,67,70,75] @=> int E[];
[51,65,70,70,75,0] @=> int Eadd9G[];
[56,63,67,71,75,0] @=> int AmM7[];
[56,63,68,71,77,0] @=> int Am6[];
[60,67,70,72,75,0] @=> int Cm7[];
[55,65,70,75,0,0] @=> int Gm7[];
[53,63,68,70,75,0] @=> int Fm11[];
[56,63,68,71,75,0] @=> int Am[];
[56,63,68,71,78,0] @=> int Am7[];
[53,60,63,69,75,77] @=> int F7[];
[58,65,70,74,80,0] @=> int B7[];
[56,63,68,72,0,0] @=> int A[];
[55,65,70,74,0,0] @=> int Gm[];
[53,63,68,72,0,0] @=> int Fm7[];

[A9,A9,Aadd9,Aadd9,Aadd9,Aadd9,Aadd9,Aadd9,
B,B,Bsus4,Bsus4,Bsus4,Bsus4,Bsus4,Bsus4, E,E,E,E,E,E,E,E, Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,
A9,A9,Aadd9,Aadd9,Aadd9,Aadd9,Aadd9,Aadd9, B,B,Bsus4,Bsus4,Bsus4,Bsus4,Bsus4,Bsus4, E,E,E,E,E,E,E,E, Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,
A9,A9,Aadd9,Aadd9,Aadd9,Aadd9,Aadd9,Aadd9, B,B,Bsus4,Bsus4,Bsus4,Bsus4,Bsus4,Bsus4, E,E,E,E,E,E,E,E, Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,Eadd9G,
A9,A9,Aadd9,Aadd9,Aadd9,Aadd9,Aadd9,Aadd9, A9,A9,A9,A9,A9,A9,A9,A9, AmM7,AmM7,AmM7,AmM7,AmM7,AmM7,AmM7,AmM7, Am6,Am6,Am6,Am6,Am6,Am6,Am6,Am6,Am6,

E,E,E,E,E,E,E,E, B,B,B,B,B,B,B,B, Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7, Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,
Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11, Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11, Am,Am,Am,Am,Am,Am,Am,Am, Am7,Am7,Am7,Am7,Am6,Am6,Am6,Am6,
E,E,E,E,E,E,E,E, B,B,B,B,B,B,B,B, Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7, Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,
Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11, Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11, Am,Am,Am,Am,Am,Am,Am,Am, Am7,Am7,Am7,Am7,Am6,Am6,Am6,Am6,
Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7, F7,F7,F7,F7,F7,F7,F7,F7, B7,B7,B7,B7,B7,B7,B7,B7, E,E,E,E,E,E,E,E,
Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7, F7,F7,F7,F7,F7,F7,F7,F7, B,B,B,B,A,A,A,A, Gm,Gm,Gm,Gm,Fm7,Fm7,Fm7,Fm7,


E,E,E,E,E,E,E,E, B,B,B,B,B,B,B,B, Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7, Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,
Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11, Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11, Am,Am,Am,Am,Am,Am,Am,Am, Am7,Am7,Am7,Am7,Am6,Am6,Am6,Am6,
E,E,E,E,E,E,E,E, B,B,B,B,B,B,B,B, Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7,Cm7, Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,Gm7,
Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11, Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11,Fm11, Am,Am,Am,Am,Am,Am,Am,Am, Am7,Am7,Am7,Am7,Am6,Am6,Am6,Am6


] @=> int chords[][];

[qn,en_d,en, sn,en, en,sn,sn,    //8
qn,en_d,en, sn,en, en,sn,sn,     qn,en_d,en, sn,en, en,sn,sn,     qn,en_d,en, sn,en, en,sn,sn,   // 32
qn,en_d,en, sn,en, en,sn,sn,     qn,en_d,en, sn,en, en,sn,sn,     qn,en_d,en, sn,en, en,sn,sn,     qn,en_d,en, sn,en, en,sn,sn, //64
qn,en_d,en, sn,en, en,sn,sn,     qn,en_d,en, sn,en, en,sn,sn,     qn,en_d,en, sn,en, en,sn,sn,     qn,en_d,en, sn,en, en,sn,sn,  //96
qn,en_d,en, sn,en, en,sn,sn,     qn,en_d,en, sn,en, en,sn,sn,     qn,en_d,en, sn,en, en,sn,sn,     en,en,en,en, en,en, en,sn,sn,

en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,

en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en
] @=> dur durs[]; 

/*
[80,71,80,71] @=> int melody[];
for (0 => int i; i < 4; i++) {
sendOutMIDInote(1,melody[i], 100);
 0.25::second => now;
}
*/
//chords.size()

for (0 => int i; i < durs.size(); i++) {
    sendOutMIDInote(1,chords[i][0], 60);
    sendOutMIDInote(1,chords[i][1], 60);
    sendOutMIDInote(1,chords[i][2], 60);
    sendOutMIDInote(1,chords[i][3], 60);
    sendOutMIDInote(1,chords[i][4], 60);
    sendOutMIDInote(1,chords[i][5], 60);
    durs[i] => now;
    
    sendOutMIDInote(0,chords[i][0], 60);
    sendOutMIDInote(0,chords[i][1], 60);
    sendOutMIDInote(0,chords[i][2], 60);
    sendOutMIDInote(0,chords[i][3], 60);
    sendOutMIDInote(0,chords[i][4], 60);
    sendOutMIDInote(0,chords[i][5], 60);
    0.00001::second => now;
} 

me.exit();
