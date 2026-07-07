#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle=0
blocks[0]=noone
blocks[1]=noone
blocks[2]=noone
blocks[3]=noone
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Initialize tetrimino
var i;
for (i=0; i<4; i+=1)
    with (blocks[i]) instance_destroy()
switch type {
case tetrisController.l: switch angle {
    case 0: {
        blocks[0]=instance_create(x-32,y-64,tetrisBlock)
        blocks[1]=instance_create(x-32,y-32,tetrisBlock)
        blocks[2]=instance_create(x-32,y,tetrisBlock)
        blocks[3]=instance_create(x,y,tetrisBlock)
    } break
    case 1: {
        blocks[0]=instance_create(x+32,y-32,tetrisBlock)
        blocks[1]=instance_create(x,y-32,tetrisBlock)
        blocks[2]=instance_create(x-32,y-32,tetrisBlock)
        blocks[3]=instance_create(x-32,y,tetrisBlock)
    } break
    case 2: {
        blocks[0]=instance_create(x-32,y-64,tetrisBlock)
        blocks[1]=instance_create(x,y-64,tetrisBlock)
        blocks[2]=instance_create(x,y-32,tetrisBlock)
        blocks[3]=instance_create(x,y,tetrisBlock)
    } break
} break
case tetrisController.z: switch angle {
    case 0: {
        blocks[0]=instance_create(x,y-32,tetrisBlock)
        blocks[1]=instance_create(x,y,tetrisBlock)
        blocks[2]=instance_create(x-32,y,tetrisBlock)
        blocks[3]=instance_create(x-32,y+32,tetrisBlock)
    } break
    case 1: {
        blocks[0]=instance_create(x-64,y,tetrisBlock)
        blocks[1]=instance_create(x-32,y,tetrisBlock)
        blocks[2]=instance_create(x-32,y+32,tetrisBlock)
        blocks[3]=instance_create(x,y+32,tetrisBlock)
    } break
} break
case tetrisController.t: switch angle {
    case 0: {
        blocks[0]=instance_create(x-32,y-32,tetrisBlock)
        blocks[1]=instance_create(x-32,y,tetrisBlock)
        blocks[2]=instance_create(x,y,tetrisBlock)
        blocks[3]=instance_create(x-32,y+32,tetrisBlock)
    } break
    case 1: {
        blocks[0]=instance_create(x-64,y,tetrisBlock)
        blocks[1]=instance_create(x-32,y,tetrisBlock)
        blocks[2]=instance_create(x-32,y+32,tetrisBlock)
        blocks[3]=instance_create(x,y,tetrisBlock)
    } break
    case 2: {
        blocks[0]=instance_create(x-32,y-32,tetrisBlock)
        blocks[1]=instance_create(x-32,y,tetrisBlock)
        blocks[2]=instance_create(x-64,y,tetrisBlock)
        blocks[3]=instance_create(x-32,y+32,tetrisBlock)
    } break
    case 3: {
        blocks[0]=instance_create(x-64,y,tetrisBlock)
        blocks[1]=instance_create(x-32,y,tetrisBlock)
        blocks[2]=instance_create(x-32,y-32,tetrisBlock)
        blocks[3]=instance_create(x,y,tetrisBlock)
    } break
} break
case tetrisController.j: switch angle {
    case 0: {
        blocks[0]=instance_create(x,y-64,tetrisBlock)
        blocks[1]=instance_create(x,y-32,tetrisBlock)
        blocks[2]=instance_create(x-32,y,tetrisBlock)
        blocks[3]=instance_create(x,y,tetrisBlock)
    } break
    case 1: {
        blocks[0]=instance_create(x-64,y-32,tetrisBlock)
        blocks[1]=instance_create(x-64,y,tetrisBlock)
        blocks[2]=instance_create(x-32,y,tetrisBlock)
        blocks[3]=instance_create(x,y,tetrisBlock)
    } break
    case 2: {
        blocks[0]=instance_create(x,y-64,tetrisBlock)
        blocks[1]=instance_create(x-32,y-64,tetrisBlock)
        blocks[2]=instance_create(x-32,y-32,tetrisBlock)
        blocks[3]=instance_create(x-32,y,tetrisBlock)
    } break
} break
case tetrisController.i: switch angle {
    case 0: {
        blocks[0]=instance_create(x,y-64,tetrisBlock)
        blocks[1]=instance_create(x,y-32,tetrisBlock)
        blocks[2]=instance_create(x,y,tetrisBlock)
        blocks[3]=instance_create(x,y+32,tetrisBlock)
    } break
    case 1: {
        blocks[0]=instance_create(x-64,y-32,tetrisBlock)
        blocks[1]=instance_create(x-32,y-32,tetrisBlock)
        blocks[2]=instance_create(x,y-32,tetrisBlock)
        blocks[3]=instance_create(x+32,y-32,tetrisBlock)
    } break
} break
case tetrisController.o: {
    blocks[0]=instance_create(x-32,y-32,tetrisBlock)
    blocks[1]=instance_create(x,y-32,tetrisBlock)
    blocks[2]=instance_create(x-32,y,tetrisBlock)
    blocks[3]=instance_create(x,y,tetrisBlock)
} break
case tetrisController.s: {
    blocks[0]=instance_create(x-32,y-32,tetrisBlock)
    blocks[1]=instance_create(x-32,y,tetrisBlock)
    blocks[2]=instance_create(x,y,tetrisBlock)
    blocks[3]=instance_create(x,y+32,tetrisBlock)
} break
}
for (i=0; i<4; i+=1) {
    blocks[i].image_index=type-1
}
