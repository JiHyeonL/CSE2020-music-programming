MidiOut mout;
MidiMsg msg;
5 => int port; // ??? ??? ?? ??? ?? ??
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


[wn,wn,hn_d,qn,wn,
wn,wn,wn,wn, 
wn,wn,wn,hn,en,en,en,en,
wn,wn,wn,wn,
wn, qn_d,en,en,en,qn, wn, hn_d,en,en,
wn,hn_d,en,en,wn,wn,
wn,hn,en,en,qn,wn,wn,
wn,wn,wn,wn,
wn,hn,qn,en,en, qn,qn,en,en,en,en, en,en,en,en,en,en,en,en,
wn,wn,wn,wn,
wn, qn_d,en,en,en,qn, wn, hn_d,en,en,
wn,hn_d,en,en,wn,wn,
wn,hn,en,en,qn,wn,wn,
hn,qn,qn
] @=> dur durs[]; 


[56,58,51,53,55,
44,46,51,43, 
44,44,44,44,44,44,44,44,
51,46,48,43,
41,41,48,53,53,53,44,44,44,46,
51,46,53,46,48,43,
41,53,53,53,53,44,44,
0,0,0,0,
0,0,0,0,41, 46,46,44,44,44,44, 43,43,43,43,41,41,41,0,
51,46,48,43,
41,41,48,53,53,53,44,44,44,46,
51,46,53,46,48,43,
41,53,53,53,53,44,44
//44,44,44
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
    if (melody[i] != 0) {
        sendOutMIDInote(1,melody[i], 110);
    }
    durs[i] => now;
    sendOutMIDInote(0, melody[i], 110);
    0.0001::second => now;
} 

me.exit();
