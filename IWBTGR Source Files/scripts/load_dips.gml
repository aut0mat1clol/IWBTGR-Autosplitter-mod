var list,i;

i=0
list[i]="noparticles" i+=1
list[i]="reduceblood" i+=1
list[i]="classicerror" i+=1
list[i]="paddle" i+=1
list[i]="crashing" i+=1
list[i]="bowlag" i+=1
list[i]="physics" i+=1
list[i]="piston" i+=1
list[i]="slurs" i+=1
list[i]="smoothmetroid" i+=1

list[i]="evilsaves" i+=1
list[i]="hitboxes" i+=1
list[i]="autofire" i+=1
list[i]="kraidgief" i+=1
list[i]="dragonskip" i+=1
list[i]="godmode" i+=1
list[i]="infjump" i+=1
list[i]="gameover" i+=1
list[i]="devkeys" i+=1

length=i

dip_scroll_pos=0
dip_default_unlock=10
dip_scroll_size=9
// FORMAT: setting name, disabled name, enabled name, description
dips=ds_list_create()

for (i=0;i<dip_default_unlock;i+=1) {
    ds_list_add(dips,list[i])
    ds_list_add(dips,lang("dips"+string(i)+"b"))
    ds_list_add(dips,lang("dips"+string(i)+"c"))
    ds_list_add(dips,lang("dips"+string(i)+"d"))
}

if (!unlocks("2")) {
    ds_list_add(dips,"nope.avi")
    ds_list_add(dips,lang("dipsmore"))
    ds_list_add(dips,lang("dipsmore"))
    ds_list_add(dips,lang("dipsmore2"))
} else {
    for (i=dip_default_unlock;i<length;i+=1) {
        ds_list_add(dips,list[i])
        ds_list_add(dips,lang("dips"+string(i)+"b"))
        ds_list_add(dips,lang("dips"+string(i)+"c"))
        ds_list_add(dips,lang("dips"+string(i)+"d"))
    }
}

numdips = ds_list_size(dips)/4
