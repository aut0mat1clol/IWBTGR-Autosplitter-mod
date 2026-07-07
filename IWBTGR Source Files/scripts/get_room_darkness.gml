//returns how dark the room is for owata's outlines
var sx,sy,f;

sx=floor(x/800)
sy=floor(y/608)
f=frac(y/608)

switch (room) {
    case rGuy1: {
        if (sx=0 && sy=0) return 1
        if ((sx=0 || sx=4 || sx=5) && sy=1) return min(1,2-f*2)
        if ((sx=2 || sx=3 || sx=4) && sy=0) return min(1,2-f*2)
        if (sx=5 && sy=0) return 1
        if (sx=0 && sy=2) return max(0,f*5-4)
        if (sx=1 && sy=1) return max(0,f*4-3)
        if (sx=4 && sy=3) return median(0,1-(y-2048)/32,1)
        return 0
    }
    case rZelda: {return sy=0}
    case rMechaBirdoBoss: {return min(1,2-f*2)}
    case rKraidgiefLair: {
        if (sx=0 || sx>5) return 1
        return 0
    }
    case rMegaman: {return 0}
    case rFactoryOutskirts: {
        if ((sx=0 || sx=1) && sy=1) return f/2
        if ((sx=0 || sx=1) && sy=2) return f/2+0.5
        if (sx=5 && sy=2) return 1-f/2
        if (sx=1 && sy=4) return median(0,1-(x-1248)/32,1)
        if (sx=1 && sy=5) return 1-f
        return 1
    }
    case rGuyFortress1: {
        return 0.5
    }
    case rGuyLabyrinth: {
        return 0.5
    }
    case rGuyFortress2: {
        return 0.5
    }
    case rGuyTower: {
        return 0.5
    }
    case rGuyBoss: {
        return 0.5
    }
    case rCredits: {return 0}
}

return 1
