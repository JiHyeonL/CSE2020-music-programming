// tempo
0.66::second => dur beat; // basic duration
beat => dur qn; // quarter (1/4) note sound
beat * 2 => dur hn; // half (1/2) note sound
beat / 2 => dur en; // eighth (1/8) note sound
en / 2 => dur sn; // sixteen(1/16) note sound
sn / 2 => dur tn; // thirty(1/32) note sound
en+sn => dur en_d; // eighth dot note sound


Machine.add(me.dir()+"/drum.ck");
qn*7.837 => now;
Machine.add(me.dir()+"/sample.ck");
Machine.add(me.dir()+"/vocal.ck");
Machine.add(me.dir()+"/vocal2.ck");
qn*16 => now;
Machine.add(me.dir()+"/base.ck");
Machine.add(me.dir()+"/sample2.ck");
qn*48.05 => now;
Machine.add(me.dir()+"/guitar2.ck");
Machine.add(me.dir()+"/guitar2-2.ck");
qn*96 => now;
Machine.add(me.dir()+"/guitar2.ck");
Machine.add(me.dir()+"/guitar2-2.ck");
qn*66 => now;