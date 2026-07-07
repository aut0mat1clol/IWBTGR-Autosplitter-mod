directory_create(working_directory+"\Snapshot")

appsurf=sureface(appsurf,800,608)

fn="Snapshot\"+current_date_filename()
if (file_exists(fn+".png")) {
    i=2
    while (file_exists(fn+" ("+string(i)+").png")) i+=1
    fn+=" ("+string(i)+")"
}

surface_save(appsurf,fn+".png")
