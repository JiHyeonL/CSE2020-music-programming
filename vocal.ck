MidiOut mout;
MidiMsg msg;
7 => int port; // ??? ??? ?? ??? ?? ??
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
hn+qn => dur hn_d; // half dot
hn * 2 => dur wn; // 1 note sound
beat / 2 => dur en; // eighth (1/8) note sound
en / 2 => dur sn; // sixteen(1/16) note sound
en+sn => dur en_d; // eighth dot note sound
beat+en => dur qn_d;
beat / 5 => dur rest; // duration of no sound after each note


[sn,sn,sn,sn,sn,en,sn,sn,en,sn,sn,en,sn, sn,en,hn_d,sn,
sn,en,sn,sn,sn,sn,sn,sn,en,sn,sn,sn,sn,sn, sn,sn,sn+sn+qn,en,en_d,en_d, sn,en,sn,sn,en,sn,sn,en,sn,sn,sn,sn,sn,
sn,sn,en+qn,qn,sn,sn,sn,sn, sn,en,sn+sn,sn,sn,sn,sn,en,sn,sn,sn,sn,sn, sn,sn,en_d, sn,en,en,en,en,en+hn, qn,en,en,
en,en,en,sn,sn,en,sn,sn,sn,en,sn, sn,en+sn+qn,en,en,en,sn,sn, qn,qn,en,en,en,en+hn, qn,en,en,
en,sn,sn,sn,sn+en+en,en,en,en, en,en,en,qn,en,en,en, en,qn,qn,en,en_d,sn, sn,en,sn,sn,en,sn,sn,en,sn+sn,sn,en,

en,en,en,en,qn,en_d,sn, sn,en,sn,sn,en,sn,sn,en,sn,sn,sn,en, en,en,en,en,en,en,en,en, en,qn,en,en,en,en,en,
en,qn,en,en,en,en,en, en,en,en,qn,en,en,en, en,en,en_d,sn,sn,sn,sn,sn,sn,sn,sn,sn,
sn,en,sn,en_d,sn,sn,sn,sn,sn,sn,sn,sn,sn, sn,en,sn,en_d,sn,sn,sn,sn,sn,sn,en_d, sn,en,en,en,sn,en,en,sn,sn,en,
en,qn,en,en,en,en,en, en,qn,en,en,en,en,en, en,qn,en,en,en,en,en, qn,en,qn,en,en,en, en,en,en,en,en,en,qn,
qn,en,en,sn,sn,sn,sn,sn,sn,sn,sn, sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn, sn,sn,en,en,sn,sn,en,sn,sn,sn,sn,sn,sn,
sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,sn,en,en,sn, en,en,en,en,en,en,en,en, en,sn,sn,en,sn,sn,en,en,en_d,sn, sn,sn,sn,sn,en,sn,sn,en,en,qn,

en,en,en,en,en,en,en,sn,sn, sn,en,sn,sn,en,sn,sn,en,sn,sn,sn,en, en,en,en,en,qn,en_d,sn,
sn,en,sn,sn,en,sn,sn,en,sn,sn,sn,en, en,en,en,en,en,en,en,en, en,qn,en,en,en,en,en, en,qn,en,en,en,en,en,
en,en,en,qn,en,en,en, en,en,en_d,sn,sn,sn,sn,sn,sn,sn,sn,sn, sn,en,sn,en_d,sn,sn,sn,sn,sn,sn,sn,sn,sn,
sn,en,sn,en_d,sn,sn,sn,sn,sn,sn,en_d, sn,en,en,en,sn,en,en,sn,sn,en, en,qn,en,en,en,en,en, en,qn,en,en,en,en,en,
en,qn,en,en,en,en,en, qn,en,qn,en,en,en, en,en,en,en,en,en,qn
] @=> dur durs[]; 


[70,70,70,70,70,67,68,68,67,67,67,65,65, 65,67,67,63,
70,70,70,70,67,67,68,68,67,67,67,65,63,65, 65,70,67,0,-1,-1, 70,70,70,70,75,75,75,70,70,70,68,67,68,
68,67,65,0,68,68,68,68, 68,67,67,0,0,68,68,67,67,67,65,63,65, 65,63,63,0,0,-1,77,-1,75, 0,77,77,
0,79,0,0,70,80,79,77,77,75,75, 75,72,0,75,75,77,75, 72,0,-1,77,-1,75, 0,77,77,
0,79,77,79,77,70,70,70, 70,72,75,79,80,82,75, 75,72,79,79,75,80, 80,79,79,0,77,77,0,75,75,77,77,

0,75,82,79,79,75,80, 80,79,79,0,77,77,0,75,75,0,77,77, 0,75,82,-1,75,75,87,82, 82,75,75,75,75,87,82,
82,75,72,75,72,75,75, 78,78,75,78,80,82,82, 0,82,0,70,80,80,80,80,0,80,0,79,
79,75,0,0,70,80,80,80,80,0,80,0,79, 79,75,0,0,70,80,80,80,80,0,79, 82,82,82,75,75,75,75,75,77,77,
77,0,75,75,75,87,82, 82,75,75,75,75,87,82, 82,75,72,75,72,75,75, 78,75,78,80,82,82, 0,75,75,77,80,79,75,
0,72,75,0,72,75,72,75,72,79,77, 0,77,0,0,75,72,75,72,75,72,75,72,75,72,79,77, 0,77,0,0,72,75,0,72,72,75,72,75,72,
75,0,72,0,75,72,75,72,75,77,79,77,75,72, 0,79,79,77,77,77,0,75, 75,0,72,75,0,72,75,77,0,75, 77,75,77,75,77,78,77,0,77,77,

79,79,-1,-1,-1,0,-1,0,-1, -1,79,79,0,77,77,0,75,75,0,77,77, 0,75,82,79,79,75,80,
80,79,79,0,77,77,0,75,75,0,77,77, 0,75,82,-1,75,75,87,82, 82,75,75,75,75,87,82, 82,75,72,75,72,75,75,
78,75,75,78,80,82,82, 0,82,0,70,80,80,80,80,0,80,0,79, 79,75,0,0,70,80,80,80,80,0,80,0,79,
79,75,0,0,70,80,80,80,80,0,79, 82,82,82,75,75,75,75,75,77,77, 77,0,75,75,75,87,82, 82,75,75,75,75,87,82,
82,75,72,75,72,75,75, 78,75,78,80,82,82, 0,75,75,77,80,79,75
] @=> int melody[]; 


[67,63,0] @=> int a[];
[65,62,0] @=> int b[];
[75,72,67] @=> int c[];
[74,70,67] @=> int d[];
[75,70,0] @=> int e[];
[74,70,0] @=> int f[];
[79,75,0] @=> int g[];

[79,75,70] @=> int h[];
[79,74,68] @=> int ii[];
[79,72,68] @=> int jj[];
[75,65,0] @=> int k[];
[80,75,0] @=> int l[];
[79,75,0] @=> int m[];
[0,0,0] @=> int n[];

[a,b,c,d,e,f,g,h,ii,jj,k,l,l,m

] @=> int chords[][]; 

0 => int j;
for (0 => int i; i < durs.size(); i++) {
    if (melody[i] != 0 && melody[i] != -1) {
        sendOutMIDInote(1,melody[i], 90);
        durs[i] => now;
        
        sendOutMIDInote(0, melody[i], 90);
        0.00001::second => now;
    }

    if (melody[i] == -1) {
            sendOutMIDInote(1,chords[j][0], 90);
            sendOutMIDInote(1,chords[j][1], 90);
            sendOutMIDInote(1,chords[j][2], 90);
            durs[i] => now;
        
            sendOutMIDInote(0,chords[j][0], 90);
            sendOutMIDInote(0,chords[j][1], 90);
            sendOutMIDInote(0,chords[j][2], 90);
            0.00001::second => now;
            j+1 => j;
     }
     if(melody[i] == 0) {
         sendOutMIDInote(1, melody[i], 90);
          durs[i] => now;
         
            sendOutMIDInote(0,melody[i], 90);
            0.00001::second => now;
         }

} 

me.exit();
