///joy_get(joy,type,index)
//returns joystick state

if (argument[1]=0) return deadzone(joystick_axis(argument[0],argument[2]))
if (argument[1]=1) return joystick_check_button(argument[0],argument[2])
if (argument[1]=2) return joystick_pov_direction(argument[0])
if (argument[1]=3) return string(joystick_name(argument[0]))
