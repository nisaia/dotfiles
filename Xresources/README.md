# .Xresources

First thing, create a **.xres** folder in **~/** folder.

```bash
mkdir ~/.xres
```

Now copy the **themes** folder and its content inside the .xres folder created previously.

```bash
cp -r themes/ ~/.xres
```
 
## URxvt
This file contains all configurations for URxvt's terminal.

Copy the **urxvt** file inside the .xres folder created previously

```bash
cp urxvt ~/.xres
```

**NB:** To use the font, it must be installed on the operating system.

For more details about URxvt configurations check the link: [URxvt_manual](https://linux.die.net/man/1/urxvt)

Now copy the **.Xresources** file in **~/** folder

If you want to use the *.Xresource* file you need replace **{absolute_path}** with folder absolute path and **{theme}** with your favorite theme present [here](themes/). 

Whenever you want to make a change to the various configuration files, to confirm the changes, go to the **~/** folder and run:

```bash
xrdb .Xresources
```