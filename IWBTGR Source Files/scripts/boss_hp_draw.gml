///boss_hp_draw()
// Draws a small boss HP counter on the HUD.
// Called from world Draw event.

var _name, _hp, _max, _active, _x, _y, _barw, _fill, _str;

_name = "";
_hp = 0;
_max = 0;
_active = 0;

// Tyson. Uses direct HP.
if (instance_exists(Tyson)) {
    _name = "Tyson";
    _hp = Tyson.hp;
    _max = 5;
    _active = 1;
}

// Mother Brain. Uses direct HP.
if (instance_exists(MommyThinker)) {
    _name = "Mother Brain";
    _hp = MommyThinker.hp;
    _max = 35;
    _active = 1;
}

// Mecha Birdo has separate hitbox objects for phases.
if (instance_exists(MechaHitbox)) {
    _name = "Mecha Birdo";
    _hp = MechaHitbox.hp;
    _max = 30;
    _active = 1;
}
if (instance_exists(MechaHitbox2)) {
    _name = "Mecha Birdo";
    _hp = MechaHitbox2.hp;
    _max = 15;
    _active = 1;
}
if (instance_exists(MechaHitbox3)) {
    _name = "Mecha Birdo";
    _hp = MechaHitbox3.hp;
    _max = 5;
    _active = 1;
}

// Bowser fight object.
if (instance_exists(ClownCar)) {
    _name = "Bowser";
    _hp = ClownCar.hp;
    _max = 18;
    _active = 1;
}

// Dracula. Uses direct HP on the Dracula instance.
if (instance_exists(Dracula)) {
    _name = "Dracula";
    _hp = Dracula.hp;
    _max = 39;
    _active = 1;
}

// Dragon stores damage dealt in hp, so display remaining HP.
if (instance_exists(Dragon)) {
    _name = "Dragon";
    _hp = 50 - Dragon.hp;
    _max = 50;
    _active = 1;
}

// Kraidgief stores damage dealt, so display remaining HP.
if (instance_exists(Kraidgief)) {
    _name = "Kraidgief";
    _hp = 120 - Kraidgief.damage;
    _max = 120;
    _active = 1;
}

// The Guy stores damage dealt, so display remaining HP.
if (instance_exists(GuyFirst)) {
    _name = "The Guy";
    _hp = 49 - GuyFirst.damage;
    _max = 49;
    _active = 1;
}

if (!_active) exit;
if (_max <= 0) exit;

_hp = floor(median(0, _hp, _max));
_barw = 150;
_fill = floor(_barw * _hp / _max);
_x = view_xview[0] + 16;
_y = view_yview[0] + 16;
_str = _name + " HP: " + string(_hp) + "/" + string(_max);

// Box
draw_set_alpha(0.70);
draw_set_color(c_black);
draw_rectangle(_x, _y, _x + 230, _y + 44, false);
draw_set_alpha(1);

// Text shadow + text
draw_set_font(fSans);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text(_x + 9, _y + 5, _str);
draw_text(_x + 7, _y + 5, _str);
draw_text(_x + 8, _y + 4, _str);
draw_text(_x + 8, _y + 6, _str);
draw_set_color(c_white);
draw_text(_x + 8, _y + 5, _str);

// HP bar border/background
draw_set_color(c_black);
draw_rectangle(_x + 8, _y + 26, _x + 8 + _barw, _y + 36, false);
draw_set_color($303030);
draw_rectangle(_x + 9, _y + 27, _x + 7 + _barw, _y + 35, false);

// HP bar fill. Green above 50%, yellow below 50%, red below 25%.
if (_hp * 4 <= _max) draw_set_color($3030ff);
else if (_hp * 2 <= _max) draw_set_color($30ffff);
else draw_set_color($30ff30);

draw_rectangle(_x + 9, _y + 27, _x + 8 + _fill, _y + 35, false);

draw_set_color(c_white);
draw_set_alpha(1);
