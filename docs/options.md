# Mini vMac Build Options

https://www.gryphel.com/c/minivmac/options.html
https://www.gryphel.com/c/minivmac/develop.html

# Options

## Target

What kind of computer do you want to run Mini vMac on? Choose one of these lines:

{Beta} -t mcar { Macintosh OS X - ARM (Apple Silicon) }
-t mc64 { Macintosh OS X - x86-64 }
-t imch { Macintosh OS X - x86-32 }
-t mach { Macintosh OS X - PowerPC }
-t wx64 { Microsoft Windows - x86-64 }
-t wx86 { Microsoft Windows - x86-32 }
-t lx64 { Linux - x86-64 }
-t lx86 { Linux - x86-32 }
-t lppc { Linux - PowerPC }
-t larm { Linux - ARM }
-t lspr { Linux - SPARC }
-t fb64 { FreeBSD on x86-64 }
-t fbsd { FreeBSD on x86-32 }
-t nb64 { NetBSD on x86-64 }
-t nbsd { NetBSD on x86-32 }
-t oi64 { OpenIndiana on x86-64 }
-t oind { OpenIndiana on x86-32 }
-t wcar { Pocket PC - ARM }

## Language

By default, the user interface of Mini vMac is in English. Other languages can be chosen with one of these lines:

-lang eng { (default) English }
-lang fre { French }
-lang ita { Italian }
-lang ger { German }
-lang dut { Dutch }
-lang spa { Spanish }
-lang pol { Polish }
-lang ptb { Brazilian Portuguese }
-lang cat { Catalan }
-lang cze { Czech }
-lang srl { Serbian Latin }

If you would be interested in translating the user interface into some other language, see the Localization page for more details.

## Model

By default, Mini vMac emulates a Macintosh Plus. But it also can be compiled to emulate a few other computers, with one of these lines:

-m 128K { Macintosh 128K }
-m 512Ke { Macintosh 512Ke }
-m Plus { (default) Macintosh Plus }
-m SE { Macintosh SE }
-m Classic { Macintosh Classic }
-m SEFDHD { Macintosh SE FDHD }
-m II { Macintosh II * }

* The Macintosh II emulation is incomplete, and should not be relied on to give accurate results, particularly numeric results. (Emulation of the Floating Point Unit is the main incomplete part.) It does seem suitable for games, many of which appear to work perfectly well.

The Macintosh II emulation is not available on a Macintosh 680x0 target (“-t m68k”), because the compiler used doesn’t support 64 bit integers currently needed for FPU emulation.

Since a Macintosh II can be hard to find, the Macintosh II emulator will accept the ROM from Macintosh IIx. The Macintosh IIx ROM appears to work with Macintosh II hardware. The Macintosh IIcx, the Macintosh II FDHD, and the Macintosh SE/30 all have the same ROM as the Macintosh IIx.

## Screen Size

You can choose the emulated screen size with lines such as:

-hres 640 { horizontal resolution }
-vres 512 { vertical resolution }

Mini vMac requires that the horizontal resolution be a multiple of 32.

For the Macintosh Plus, and other Macintosh computers without Color Quickdraw, this is a hack implemented with numerous ROM patches. It emulates a computer that never existed, so there will definitely be compatibility issues with some software. Also keep in mind that most games that will work on the Macintosh Plus are designed for 512x342, and don't benefit from a larger screen. You can also set the emulated screen smaller than 512x342, which could be useful on portable devices, but that will really cause compatibility issues.

For the Macintosh II emulation, these options specify the resolution of the external monitor, and shouldn't cause compatibility problems, at least if you choose values that were common on real monitors of the era. On the other hand, the Macintosh II emulation is unfinished, and not really usable yet.

Some example screen sizes:

common old Macintosh screen sizes

-hres 512 -vres 384 
-hres 640 -vres 480 
-hres 800 -vres 600 
-hres 1024 -vres 768 

common current screen sizes, but divided by two, so can use Magnify in full screen

-hres 512 -vres 384 { half 1024 x 768 }
-hres 640 -vres 400 { half 1280 x 800 }
-hres 640 -vres 512 { half 1280 x 1024 }
-hres 704 -vres 450 { half 1440 x 900, width constrained }
-hres 832 -vres 525 { half 1680 x 1050, width constrained }
-hres 960 -vres 540 { half 1920 x 1080 }
-hres 960 -vres 600 { half 1920 x 1200 }

Mini vMac allows up to 4 Megabytes of Video RAM in the Macintosh II emulation. Anything over 1 Megabyte requires a hack, since each NuBus slot only gets 1 Megabyte of the address space in 24 bit mode. Space from adjacent NuBus slots is given to the emulated video card.

## Screen Depth

You can choose the emulated screen color depth with lines such as:

-depth 0 { black and white }
-depth 1 { 2 bit color (4 colors) }
-depth 2 { 4 bit color (16 colors) }
-depth 3 { 8 bit color (256 colors) (default for Mac II emulation) }
-depth 4 { 16 bit color (thousands) }
-depth 5 { 32 bit color (millions) }

These options only work for Macintosh models that support Color Quickdraw, which currently means Mac II emulation only.

To use thousands or millions of colors in System 6, you need to have 32-Bit QuickDraw, which is available from the System 6.0.8 installer, under Customize.

Color depth is a compile time option, instead of run time option, to help keep Mini vMac simple and small. However, regardless of the chosen color depth, Black and White is also available, and can be selected from the "Monitors" control panel. (In fact, you may not see color until selecting it from the "Monitors" control panel.)

## Full Screen Mode

-fullscreen 0 { (default) start with Full Screen Mode off }
-fullscreen 1 { start with Full Screen Mode on }

-var-fullscreen 0 { Full Screen Mode is constant }
-var-fullscreen 1 { (default) Full Screen Mode is variable }

"-var-fullscreen 0" combines with -fullscreen like so:

-var-fullscreen 0 -fullscreen 0 { Never run in Full Screen Mode }
-var-fullscreen 0 -fullscreen 1 { Always run in Full Screen Mode }

In both cases, the "F" control mode command disappears.

## Magnify

-magnify 0 { (default) start with Magnify Mode off }
-magnify 1 { start with Magnify Mode on }

The magnification factor can be changed:

-mf 1 { disable magnification }
-mf 2 { (default) 2x }
-mf 3 { 3x }
-mf 4 { 4x }
...

Disabling magnification with "-mf 1" removes the Control-M command.

## Sound

The Macintosh, Windows, Linux, FreeBSD, and NetBSD versions have sound emulation on by default. The Dragonfly BSD and OpenIndiana version can be compiled with sound, but this hasn't been tested. The OpenBSD version can be compiled with sound, but it doesn't work. (Other versions don't implement sound.)

-sound 1 { Emulate sound }
-sound 0 { No sound emulation }

One reason to disable sound is to avoid the Macintosh start up beep. Another reason is to get a few percent better performance.

## Sound Sample Size

-sss 3 { (default) 8 bit sound }
-sss 4 { 16 bit sound }

A Macintosh Plus outputs 8 bit sound (256 possible levels), which is then modulated by the sound volume setting (8 possible levels), and also by the square wave generator. By default Mini vMac currently outputs 8 bit sound, but there is an option to output 16 bit sound, which allows more accurate output when the sound volume setting is less than maximum, and when the square wave generator is used.

## Number of disk images

By default, Mini vMac can mount up to 6 disk images (but for the Mac 128K/512K emulation the default is 2). This is because the replacement disk driver is trying to match the size of a data structure used by the real disk driver (on the Macintosh 128K/512K this structure is smaller). You can at compile time choose to support more disk images, up to 32, which makes this data structure larger, at some slight decrease in authenticity, and some slight memory and time overhead. Use a line such as:

-drives 1
-drives 2
-drives 3
...
-drives 6 { (default) }
...
-drives 16 
...
-drives 32

According to Apple’s Technical Note FL530, some versions of the System Software will not work correctly with more than 20 mounted volumes. The Standard File dialogs will corrupt the stack and may crash.

One reason for using the “-drives” option is that the installer programs for some Macintosh applications don't cope very well with multiple floppy drives, and insist on constantly ejecting the boot or destination disks rather than the install disks it has finished with. Some installers with this problem work much better if all installation disks can be mounted at once before starting.

## {Beta} Non Disk Image Protection

-ndp 0 { turn off Non Disk Image Protection }

As of branch 37, Mini vMac will check if a disk image that is being mounted looks like a Macintosh disk image format (HFS or MFS), and if not decline to mount it, showing an error message. This helps prevents accidentally corrupting other files, especially when using ImportFl.

But there are some other disk image formats that you might want to mount, such as Fat16 and ISO (which can be used by the emulated Macintosh with additional software). Or, you may be trying to create your own new disk image and want the emulated Macintosh to initialize it. In these cases you can use a version of Mini vMac compiled with the “-ndp 0” option to turn off this protection.

If a Branch option prior to 37 is chosen for compatibility with an earlier version, the default is “-ndp 0”, and you can use “-ndp 1” to turn on this protection.

## Checksum disk images

-sony-sum 1

With the above line, Mini vMac will update the checksum in a Disk Copy 4.2 disk image when it is unmounted. This prevents other programs that deal with such images from complaining about an invalid checksum. (I didn't include this by default, because it makes Mini vMac slightly bigger and slower.)

Disk images file tags

-sony-tag 1

With the above line, Mini vMac tries to support file tags, for disk image formats that support them. There are an additional 12 bytes for each 512 byte block on a 400K or 800K floppy disk, containing some additional information that was supposed to aid in recovering damaged disks, but was never actually used much. The Disk Copy 4.2 disk image format can support these tags. (The more usual raw format, such as found in Blanks, does not.)

For full support of Disk Copy 4.2 format, enable both checksums and tags:

-sony-sum 1 -sony-tag 1 

## Disk Copy 4.2 format

-sony-dc42 0 

The above line completely disables support for disk images in disk copy 4.2 format. This could be useful when trying to compile the smallest and simplest version of Mini vMac possible for some specific purpose. It should not be used when compiling a version of Mini vMac for general distribution, because a primary goal of Mini vMac is that disk images that work with any past version of the program should also work with the current and any future version (at least when default compile options are used).

## Enable Save Dialog

-svd 0 { disable save dialog }

Normally the OS X and Windows versions will display a save dialog when the Mini vMac extension to create a file is used. A save dialog is not implemented in the Linux version, instead it will create the file in a folder named “out” in the application directory. When this option is used to disable the save dialog, the OS X and Windows version will also save to an “out” folder in the same fashion as the Linux version. This is helpful when using Mini vMac in automated scripts.

## Insert Ith Disk Image

-iid 1 { enable Insert Ith Disk Image }

When this feature is enabled, if the Control key is held down and a number key from ‘1’ to ‘9’ is pressed, then Mini vMac will try to mount a disk image named from "disk1.dsk" to "disk9.dsk" in the folder containing the application.

This is the same series of disk image names that are automatically mounted when Mini vMac is launched. But it stops at the first image not found. So if you leave a name unused, then you can use a control-number key to mount disks after launch. Or, you can use a control-number key to remount a disk that was automatically mounted at launch and then later ejected.

One example use is if you have one copy of Mini vMac running a development environment (such as MPW) that is used to compile a program to a disk image. The disk image is then unmounted and mounted on another copy of Mini vMac running a testing environment. If the compiled program crashes badly, the development environment is not disturbed. The control-number key feature makes it easier to move the disk image back and forth between the two copies of Mini vMac.

## Command Control Swap

You can swap the emulated Command and Control keys with:

-ccs { Command Control Swap }

This could be useful for people who are used to Windows, so that you can use Control-C to copy instead of Command-C (or actually Alt-C, as Alt is located where the Command key is on a Macintosh keyboard).

It can also be useful for people used to Macintosh who have remapped the keys on their Windows machine to swap Control and Alt. Using '-ccs' will swap them back for Mini vMac.

Linux is the same as Windows in this way, as far as I have seen.

The '-ccs' option does not affect F1 and F2, but should affect any other keys that get mapped to Control and Command.

## Keyboard Remap

Change the mapping between keys on the real Keyboard and keys on the emulated Keyboard, or the Mini vMac Control Mode. For example:

-km Escape CM -km Control Control

The first -km above allows using the Escape Key for the Mini vMac Control Mode. The second -km allows using the Control Key to mean Control Key instead of the Mini vMac Control mode.

The general format is “-km <src> <dst>”, where <src> and <dst> can be one of:

Control
Command
Option
Shift
CapsLock
Escape
BackSlash
Slash
Grave
Enter
PageUp
PageDown
Home
End
Help
ForwardDel
F1
F2
F3
F4
F5

In addition <dst> can be “CM”, which means the key for the Mini vMac Control Mode.

Also in addition, <src> can be one of:

RControl
RCommand
ROption
RShift

Which means the keys on the right hand side of the keyboard, when both the operating system and the keyboard hardware permit distinguishing them from the left hand keys.

It is an error to have no key mapped to the control mode.

## Emulated Key Toggle

-ekt <dst>

Where <dst> can be any of the values allowed for the -km option, except “CM”.

Chooses which emulated key is toggled by the ‘K’ command of the Mini vMac Control Mode.

When this option is not used, the build system will pick an emulated key that is not mapped to any real key. That will be the control key if no “-km” options are used.

## Alternate Keyboard Mode

-akm { enable Alternate Keyboard Mode }

Some commonly used keys, such as the arrow keys, are a bit of a stretch to reach, and more importantly, their positions can be different on different keyboards. The Alternate Keyboard Mode provides an alternate way to type some of these keys.

The program starts with the mode on. Pressing the 'm' key leaves the mode. The intent is that you only leave the mode temporarily to type text. (I believe this is a similar idea to how the vi text editor works.) The alternate keyboard mode is entered by pressing the ';' key. Pressing ';' has no effect when in the alternate keyboard mode, so it can be used at any time to bring the program to a known state.

In the Alternate Keyboard Mode, the letter keys are remapped as follows (non letter keys are unchanged):

    j - Left arrow
    l - Right arrow
    i - Up arrow
    k - Down arrow

    s - Shift
    d - Option
    f - Command

    z - F1 (often means Undo)
    x - F2 (often means Cut)
    c - F3 (often means Copy)
    v - F4 (often means Paste)

    e - BackSpace
    r - Return
    t - Tab
    g - Enter
    y - Escape

    a - SemiColon
    u - [
    o - ]
    b - BackSlash
    h - Equal
    n - Minus
    q - Grave

There is a visual indication when the mode is off, intended to be easy to see in peripheral vision, without covering up where text is normally typed.

Holding down the command, option, or shift keys will temporarily turn off the Alternate Keyboard Mode. So if you have the mode on, commands like Command-S will still work, and anything except lowercase letters can be typed without leaving the mode.

## International Keyboard fix

The Virtual-Key Codes of Microsoft Windows, that are independent of differences in keyboard hardware, turn out not to be independent of the choice of Keyboard Layout. Changing the Keyboard Layout to something other than "US" may scramble the Virtual-Key Codes, strangely enough. Mini vMac will check the current Keyboard Layout, and attempt to unscramble the codes, so that the Keyboard Layout chosen in Macintosh operating system running within Mini vMac will work properly. You can disable this fix with:

-ikb 0 { International Keyboard fix off }

One reason for disabling it is because this is fairly large amount of code and US only users don't need it. But also it can be disabled because I'm not sure I really understand this. Why did no one complain about this issue in a decade?

This option is only for Microsoft Windows.

## Speed

You can use one of these lines to set initial speed:

-speed z { 1x }
-speed 1 { 2x }
-speed 2 { 4x }
-speed 3 { 8x }
-speed 4 { 16x }
-speed 5 { 32x }
-speed a { All out }

The default speed is usually 8x. For the Macintosh II the default speed is 4x. (A Macintosh II has twice the clock rate, so the actual number of instructions per second executed by default is the same. Actually, a real Macintosh II has a 68020 which executes more instructions per clock cycle than a 68000, but Mini vMac doesn’t account for that yet.)

You can use one of these lines to set initial value of the Run in Background option:

-bg 0 { (default) start with Run in Background off }
-bg 1 { start with Run in Background on }

You can use one of these lines to set initial value of the AutoSlow option:

-as 0 { start with AutoSlow disabled }
-as 1 { (default) start with AutoSlow enabled }

For Macintosh II emulation, AutoSlow is disabled by default. AutoSlow may need some further tuning to work well with Mac II emulation. {Beta} AutoSlow is now enabled by default for Macintosh II emulation (unless a prior Branch option is chosen).

## Timing Accuracy

Mini vMac estimates the number of clock cycles used by each instruction excuted. There are three levels of accuracy.

-ta 0 { least accurate timing }
-ta 1 { (default) }
-ta 2 { most accurate timing }

In "-ta 0" all instructions are assumed to take the same number of cycles. This closely matches Mini vMac 3.1.3 and earlier.

For "-ta 1", Mini vMac assigns an average number of cycles for each of the 65536 primary opcodes. This table is generated using timings from Motorola documentation. When a range of timings are possible for a primary opcode, an average was just guessed. In some future version of Mini vMac, this table should be tested and calibrated by comparing to real hardware.

For "-ta 2", Mini vMac supplements the cycles table by computing more accurate estimates for certain instructions depending on the current data. It is still not completely accurate. Completely accurate timing would be exceedingly difficult. For example, the CPU and video output conflict for accesses to RAM, and that would seem very complex to model.

Currently 68000 timings are used even in the 68020 emulation. More accurate timing for 68020 should be added in a future version. Truly accurate timing for 68020 would be much more difficult than for the 68000 because of pipelining and caching, probably to the point of being unfeasible for Mini vMac. But more accurate averages should be possible.

## Emulated CPU

Most computers emulated by Mini vMac have a 68000 processor. But you can force Mini vMac to emulate a 68020 processor with:

-em-cpu 2 { 68020 }

## Memory

By default, Mini vMac emulates a Macintosh Plus with 4M of memory. But it also can be compiled to emulate other memory sizes, depending on model:

Macintosh 128K and Macintosh 512Ke :
-mem 128K { 128 Kilobytes }
-mem 512K { 512 Kilobytes }

Macintosh Plus :
-mem 128K { 128 Kilobytes }
-mem 512K { 512 Kilobytes }
-mem 1M { 1 Megabyte }
-mem 2M { 2 Megabytes }
-mem 2.5M { 2.5 Megabytes }
-mem 4M { (default) 4 Megabytes }

Macintosh SE, Classic, and SE FDHD :
-mem 512K { 512 Kilobytes }
-mem 1M { 1 Megabyte }
-mem 2M { 2 Megabytes }
-mem 2.5M { 2.5 Megabytes }
-mem 4M { (default) 4 Megabytes }

Macintosh II :
-mem 1M { 1 Megabyte }
-mem 2M { 2 Megabytes }
-mem 4M { 4 Megabytes }
-mem 5M { 5 Megabytes }
-mem 8M { (default) 8 Megabytes }

The build system checks that the memory size you specify is supported by the Macintosh model you have chosen to emulate.

## Caret Blink Time

-cbt 3 { Fast }
-cbt 8 { Medium }
-cbt 15 { Slow }

The “Rate of Insertion Point Blinking” is stored in the Parameter RAM. The default is 3 (Fast), except for Macintosh II emulation where it is 8 (Medium). Must be between 1 and 15.

## Double Click Time

-dct 5 { Fast }
-dct 8 { Medium }
-dct 12 { Slow }

The “Double Click Time” (the maximum time between mouse button clicks which will be treated as a double click) is stored in the Parameter RAM. The default is 5 (Fast), except for Macintosh II emulation where it is 8 (Medium). Must be between 1 and 15.

## Menu Blinks

-mnb 0 { None }
-mnb 1 { once }
-mnb 2 { twice }
-mnb 3 { (default) thrice }

The number of times the selected menu item blinks when when the mouse button is released, which is stored in the Parameter RAM.

## Keyboard Repeat Threshold

-kyt 0 { Off }
-kyt 10 { Long }
-kyt 6 { (default) }
-kyt 4
-kyt 3 { Short }

The delay after a key is held down until it begins to automatically repeat, which is stored in the Parameter RAM. Must be between 0 and 15.

## Keyboard Repeat Rate

-kyr 0 { Very Slow }
-kyr 6 { Slow }
-kyr 4
-kyr 3 { (default) }
-kyr 1 { Fast }

The rate at which a key automatically repeats when it is held down, which is stored in the Parameter RAM. Must be between 0 and 15.

## Sound Volume

-svl 0 { Minimum }
...
-svl 7 { Maximum }

The Sound Volume is stored in the Parameter RAM. The default is 7 (Maximum) when sound is enabled, otherwise it is 0.

## Highlight Color

-hcr 39321 { red component }
-hcg 52428 { green component }
-hcb 65535 { blue component }

The color that is used for selected text, for example. It is stored in the Parameter RAM. There are three separate options for the red, green, and blue components. Each component value must be betwen 0 and 65535. If its option is not present, the value of the component is 0. These options are only allowed for Macintosh II (or IIx) emulation.

The “GetPRAM” tool can be used to get values for these options. That is, first set the desired highlight color in the “Color” Macintosh Control Panel, and then run GetPRAM.

## Location

The Parameter RAM has fields for Latitude and Longitude, which can be set with the Map control panel, and are only used by a few programs. Mini vMac tries to automatically set these fields by asking the host operating system. This is currently implemented only for older Macintosh, not including the latest port for Cocoa. When not implemented, both fields are set to zero. The automatic setting of these fields can be disabled by:

-alc 0 { Disable Automatic Location }

With the above option, the Latitude and Longitude can be set manually:

-lcy 485768755 { Latitude }
-lcx -883053230 { Longitude }

The above example is for New York city. The Latitude and Longitude in degrees is devided by 90 and then multiplied by 2 to the 30th power. The “GetPRAM” tool can be used to get values for these options. That is, first set the desired highlight location in the “Map” Macintosh Control Panel, and then run GetPRAM.

If ‘-alc 0’ is not used, then the ‘-lcy’ and ‘-lcx’ options will be ignored without warning. This is so the output of GetPRAM can be used directly without always disabling Automatic Location.

These options may not be used when emulating a Mac 128K, 512K, or 512Ke, which do not have Extended Parameter RAM.

## Time Zone

The Parameter RAM has fields for Time Zone, which include an offset in seconds from Greenwich mean time, and a flag for whether daylight saving time is in effect. The offset can be set with the Map control panel, and the flag can be set with the Data and Time control panel in System 7.5. These fields are only used by a few programs. (The system clock is kept in local time, and most programs use only local time.) Mini vMac tries to automatically set these fields by asking the host operating system. This is implemented for Macintosh, Windows, Linux. When not implemented, both fields are set to zero. The automatic setting of these fields can be disabled by:

-atz 0 { Disable Automatic Time Zone }

With the above option, the Time Zone field can be set manually:

-lcd 1 { Daylight Saving Time in effect }
-lczs -18000 { offset from GMT in seconds }

When the offset is even multiple of 3600, as is almost always the case, you can use:

-lcz -5 { offset from GMT in hours }

The “GetPRAM” tool can be used to get values for these options. That is, first set the desired highlight location in the “Map” Macintosh Control Panel, and if desired set the Daylight Savings flag in the “Data and Time” Macintosh Control Panel, and then run GetPRAM.

If ‘-alc 0’ is not used, then the ‘-lcd’, ‘-lczs’, and ‘-lcz’ options will be ignored without warning. This is so the output of GetPRAM can be used directly without always disabling Automatic Time Zone.

These options may not be used when emulating a Mac 128K, 512K, or 512Ke, which do not have Extended Parameter RAM.

## Minimum Extensions

-min-extn { Minimum Extensions }

This option turns off all but the minimum Mini vMac extensions, such as importing and exporting the clipboard, and creating new disk images and files, leaving just what is needed for the replacement disk driver to operate.

This makes the program smaller, and perhaps reduces potential security concerns. So it could be worth doing for when the extensions aren't needed, such as for most games.

## Mouse Emulation Accuracy

-emm 0 { less accurate emulation in Full Screen Mode }

This option disables the more accurate mouse emulation normally used in Full Screen Mode, which looks at the motion of the real mouse rather than its absolute position. This allows Mini vMac to work somewhat better on tablet computers without a mouse. But such computers are still not really supported.

## Grab Keys in Full Screen

-gkf 0 { don't grab keys in Full Screen Mode }

Normally, when in Full Screen Mode, Mini vMac will try to “grab” the keyboard, preventing the operating system from intercepting keys. So in the Windows version, the ‘windows’ key can be used as an ‘option’ key, instead of popping up the “Start” menu. And in the OS X version, Command-Tab won't switch away from Mini vMac. This is also implemented in the X version.

This option disables grabbing the keyboard, allowing the operating system to intercept keys when Mini vMac is in Full Screen Mode.

## Enable Control Interrupt

-eci 0 { disable Control-I command }

The ‘I’ command of the Mini vMac Control Mode, which presses the emulated Interrupt Button, can be disabled.

In a future version, it may be disabled by default. (In the original Macintosh, the Interrupt Button was disabled by default. You needed to install the “Programmer’s Switch” to use it.)

## Enable Control Reset

-ecr 0 { disable Control-R command }

The ‘R’ command of the Mini vMac Control Mode, which presses the emulated Reset Button, can be disabled.

In a future version, it may be disabled by default. (In the original Macintosh, the Reset Button was disabled by default. You needed to install the “Programmer’s Switch” to use it.)

## Enable Emulated Control Toggle

-eck 0 { disable Control-K command }

The ‘K’ command of the Mini vMac Control Mode, which toggles the emulated control key, can be disabled.

In a future version, it may be disabled by default. (The original Macintosh did not have a control key. And, using this command accidentally would be confusing.)

## 32 bit drawing

-ci 0 { do not use 32 bit drawing }

This option is only for Linux and other X versions, when color depth is zero. Passing single bit per pixel images to the operating system is suspected to be unreliable, so Mini vMac now always passes 32 bit images. This option forces it to use single bit images, which may be more efficient, when you know that it works (i.e. there weren't problems in Mini vMac 3.4 and earlier).

## Graphics Switching Enable

-gse 1 { allow switching GPU }

This option is only for the Cocoa version for OS X. On computers with more than one GPU, it allows the operating system to choose which one is used. Otherwise on a MacBook pro, it is reported that the higher power discrete GPU is always used instead of the lower power integrated GPU, and that besides wasting power for no noticable benefit, it also takes time to switch on the discrete GPU when Mini vMac starts.

This will probably become the default in a future version.

## Code Signing Disable

-sgn 0 { disable code signing }

This option is only for the Cocoa version for OS X which, as of Mini vMac 36, is normally signed with a certificate from Apple, so that the Gatekeeper feature of OS X will permit it to run.

Gatekeeper was added in OS X Mountain Lion (10.8). By default, the operating system will refuse to run applications downloaded from the internet, unless Apple considers it trustworthy (because it is digitally signed by a developer registered with Apple). Gatekeeper is in some ways a good idea, but some people consider it as one step along the way to making OS X like iOS, where no software can be installed without Apple's permission, and emulators are forbidden, including Mini vMac.

When Mini vMac is signed, Apple can at any time choose to revoke the certificate, and Mini vMac will stop working.

Another issue is that, since Mini vMac doesn’t use Apple’s time stamp server (because that would break reproducible builds, among other problems), Mini vMac will probably stop working when the certificate expires, 5 years after being issued. (The plan is to renew the certificate every year, so that a compile of Mini vMac should work for at least 4 years.)

To avoid these issues, you can disable code signing. The disadvantage is that OS X will by default refuse to run it. One way to override Gatekeeper, giving an application permission to run, is to hold down the control key and click on its icon (or right click) to get a contextual menu, then choose the Open item, and in the warning dialog that comes up click on the Open button. (This only needs to be done the first time Mini vMac is run.)

## Sandboxing Enable

-sbx 1 { enable Sandboxing }

This option is only for the Cocoa version for OS X. It enables “Sandboxing”, an Apple security mechanism, so that any bugs, or even maliciousness, in Mini vMac can only do limited harm. However, it does remove some capabilities. The single requested “entitlement” allows Mini vMac to read and write files that the user has selected, with the Open File dialog, or by dragging into the Mini vMac window or icon.

But Mini vMac’s ability to automatically find files by name in special locations is severely restricted. It is prevented from finding “vMac.ROM”, “disk1.dsk”, “disk2.dsk”, etc. in the folder containing the application. It can find such files in a “mnvm_dat” folder created inside the application, but only read only. It does not have access to “~/Library/Preferences” to find “vMac.ROM” (but it does get access to the corresponding folder inside its container folder, which is obscure). It does have read only acces to “/Library/Application Support/”. Furthermore, if these named files are links, that won’t work unless the file linked to is in one of the few places that a Sandboxed application has access to.

This may become the default in a future version.

## Alternate Happy Mac Icon

-ahm none { (default) }
-ahm aside
-ahm cheese
-ahm evil
-ahm horror
-ahm lady_mac
-ahm moustache
-ahm nerdy
-ahm pirate
-ahm sleepy
-ahm sly
-ahm sunglasses
-ahm surprise
-ahm tongue
-ahm yuck
-ahm zombie

Patch the ROM to replace the “Happy Mac” icon displayed on boot when a disk is inserted, with one of the images designed by Steve Chamberlin for his Mac ROM-inator (used with permission).

## ROM Size

-rsz 16 { 64K }
-rsz 17 { 128K }
-rsz 18 { 256K }
-rsz 19 { 512K }
-rsz 20 { 1024K }

The build system will normally select the correct ROM Size for the Macintosh model you have chosen to emulate. But you can override this, such as to use a ROM image for Steve Chamberlin’s Mac ROM-inator. If you use this option, you will also need “-chr 0” as described below. (You may also want “-drc 0 -drt 0 -speed z -ta 2 -sony-sum 1 -sony-tag 1” to test the image with maximum accuracy.)

## Check ROM Checksum

The first 4 bytes of a Macintosh ROM contain a checksum of the remaining bytes, and there is code in the ROM to check the checksum on boot. Mini vMac patches the ROM image, so it disables this checking code. Mini vMac does the check itself before patching the ROM. It also checks that the 4 byte checksum matches one of the known ROM images for the model you have chosen to emulate. If you want to have Mini vMac use a ROM image that has been modified you can disable these checks with:

-chr 0

## Disable Rom Check

There is code in the Macintosh ROM to checksum the ROM at boot. Since Mini vMac patches the ROM, it also patches out this check. If you are using a ROM image with Mini vMac that is already patched (such as for Steve Chamberlin’s Mac ROM-inator ), this check may already be patched out. In that case Mini vMac doesn't need to, and probably shouldn't, to avoid interference in case a different method of patching out is used.

-drc 0 { Don’t Disable Rom Check }

## Disable Ram Test

There is code in the Macintosh ROM to test proper operation of RAM at boot. Mini vMac normally patches the ROM to disable this test, to speed up booting. For greater realism, you can leave this test in.

-drt 0 { Don’t Disable Ram Test }

## LocalTalk

-lt { LocalTalk emulation }

This enables Mike Fort's LocalTalk emulation. There are currently some limitations. It is only implemented for OS X. It requires running the command “sudo chmod ugo+rw /dev/bpf*” to allow Mini vMac (and everyone else) access to all network traffic. The “-lt” option also causes Mini vMac to run in the background by default, because Mini vMac can't be a proper LocalTalk node if it isn't running. And you need to manually turn on AppleTalk in the chooser - I can set the PRAM flags to boot with AppleTalk already on, but it doesn't work properly.

## {Beta} LocalTalk Over

There is a now a second option for transporting LocalTalk packets, using UPD, by Rob Mitchelmore. It does not require setup or administrative privileges (no “sudo chmod ugo+rw /dev/bpf*” needed). The options are:

-lto udp { LocalTalk over User Datagram Protocol (default) }
-lto bpf { LocalTalk over Berkeley Packet Filter }

The new UPD option is the default as of Mini vMac branch 37. But if a prior Branch option is chosen for compatibility with an earlier version, the default is BPF.

## Icon Master

-im 1 { Icon Master }

When compiled with the "Icon Master" setting turned on, Mini vMac will try to take ownership of Disk Image files and ROM Image files. It is better to have at most one copy of Mini vMac compiled with '-im 1' on a single computer. It may be preferred to have no copies of Mini vMac compiled with '-im 1', to avoid possible conflicts with other programs.

In Mac OS X, Windows, and Mac OS 9 and earlier, double clicking on a Disk Image icon will open it with a copy of Mini vMac compiled with '-im 1'. Also, Disk Image and ROM Image files will be given Mini vMac icons.

In Mac OS 9, and early versions of OS X, Disk Image files should have the creator type set to “MnvM” for double clicking to work (see “SetFType”). Also, the file type should be “MvIm” to see the Mini vMac Disk Image icon. ROM Image files should have the creator type “MnvM” and the file type “ROM!” to see the Mini vMac ROM Image icon.

In Windows and later versions of Mac OS X, Disk Images files should have a name that ends in “.dsk” for double clicking to work and to see the Mini vMac Disk Image icon. ROM Images files should have a name that ends in “.ROM” to see the Mini vMac Disk Image icon.

In Windows, a copy of Mini vMac compiled with '-im 1' will install itself in the registry when it is launched. So it will not take ownership of Disk Image and ROM Image files until after the first launch. (And the Mini vMac document icons may not appear until the computer is rebooted.) Mini vMac can only install itself in the registry if it is launched from an administrator account.

This setting currently has no effect in the Linux and other X versions.

## Abnormal Situation Reports

-abr 1 { enable Abnormal Situation Reports }

When enabled, Mini vMac will display a warning message when it encounters an unexpected situation. The warning will include a 4 digit hexadecimal number that indicates the particular situation. A warning is displayed only after the first abnormal situation Mini vMac encounters, thereafter it is suppressed.

This is not enabled by default, because in the final stable version, it mostly reports about harmless bugs in Macintosh 680x0 software. Enabling it can be useful for programmers working on Mini vMac, and perhaps also for programmers writing Macintosh 680x0 software.

When trying to emulate some aspect of Macintosh hardware, my current strategy is not to try to figure it all out and then implement the entire emulation as best I can. Because if I did that, inevitably there would be a mistake somewhere, and when that causes some software to malfunction, I won’t have any clue of where to look for the mistake. Instead I would start with a place holder Abnormal Situation report. Then I find some Macintosh software that reaches that report, and look at that area of its code, and try to figure out what it is trying to do. Then I try to implement just enough emulation for it to work correctly, and give an Abnormal Situation report for code that does something else. If the Macintosh software still doesn't work, the problem is probably in the code I just wrote. If it does work, then I next try find some other Macintosh software that hits one of the new Abnormal Situation reports. And iterate. The result is code that is usually correct for what it does, and will tell you exactly where to look when it reaches something that hasn’t been implemented yet.

## Test Compile Error

-cte 1 { Compile Error }

If this option is present, the build system will generate source code that causes the compiler to generate an error. This is for testing the variation service.

## Test Build System Error

-bte { Build System Error }

If this option is present, the build system will treat it as an error. This is for testing the variation service.

## Override

! { Override }

Normally it is an error for the same option to be used twice. If this option is present, then options to the right of it will override options to the left of it. It is still an error for an option to be used twice on the same side of ‘!’.

## Branch

-br 36 { Options were from Mini vMac 36 }

This option is for future use. It currently has no effect. {Beta} It is now used in Mini vMac 37.

It tells the build system that the requested options were from a specific branch (version) of Mini vMac. The ‘P’ command of the Mini vMac Control Mode gets the options from an existing variation, and includes this Branch setting. If the default settings have changed from since that older version, then the build system will use defaults of the old version, rather than the current defaults. So the newly generated variation behaves as close as possible to the earlier variation.

The ‘P’ command retrieves the options in a canonical form. It always generates a “-br” option for the current version, rather than copying any “-br” option passed to the build system.

# Developer Options

## {Beta} Maintainer Name

If you are going to distribute the version of Mini vMac that you compile to other people, you should specify the maintainer name with a line like this:

-maintainer "Your name here"

If you don't specify this option, the maintainer name defaults to “unknown”.

## {Beta} Home Page

If you are going to distribute the version of Mini vMac that you compile to other people, and you have a webpage for it, you should specify the webpage with:

-homepage "Your webpage here"

This string is displayed by the About command of Mini vMac. If you don't specify this option, the homepage defaults to “(none)”.

## {Beta} Development Environment

-e xcd { Apple Xcode }
-e msv { Microsoft Visual C++ }
-e mpw { Macintosh Programmers Workshop }
-e mw8 { Metrowerks CodeWarrior }
-e bgc { Gnu tools }
-e lcc { lcc-win32 - Jacob Navia }
-e dvc { Bloodshed Dev-C++ }
-e mgw { MinGW }
-e cyg { Cygwin }
-e snc { Sun tools }
-e dmc { Digital Mars Compiler }
-e plc { Pelles C Compiler }
-e dkp { devkitpro }
-e ccc { Generic command line c compiler }
-e mvc { Mini vMac C (a specific version of gcc) }

    Mini vMac C is just the set of compilers that is used to build official binaries. Currently it is a set of GCC cross compilers and supporting files built with gcc-4.7.4, gmp-4.3.2, mpfr-2.4.2, mpc-0.8.1, and mingw-w64-v4.0.6.

## {Beta} Development Environment Version

-ev 1000 { Apple Xcode 1.0 }
-ev 1500 { Apple Xcode 1.5 }
-ev 2100 { Apple Xcode 2.1 }
-ev 2200 { Apple Xcode 2.2 }
-ev 2210 { Apple Xcode 2.2.1 }
-ev 2300 { Apple Xcode 2.3 }
-ev 2400 { Apple Xcode 2.4 }
-ev 2410 { Apple Xcode 2.4.1 }
-ev 3100 { Apple Xcode 3.1 }
-ev 4000 { Apple Xcode 4.0 }
-ev 4630 { Apple Xcode 4.6.3 }
-ev 6200 { Apple Xcode 6.2 }
-ev 6320 { Apple Xcode 6.3.2 }
-ev 6400 { Apple Xcode 6.4 }
-ev 7310 { Apple Xcode 7.3.1 }
-ev 8210 { Apple Xcode 8.2.1 }
-ev 9410 { Apple Xcode 9.4.1 }
-ev 12100 { Apple Xcode 12.1 }
-ev 12300 { Apple Xcode 12.3 }
-ev 6000 { Microsoft Visual C++ 6.0 }
-ev 7000 { Microsoft Visual Studio .NET 2002 }
-ev 7100 { Microsoft Visual Studio .NET 2003 }
-ev 8000 { Microsoft Visual Studio 2005 }
-ev 9000 { Microsoft Visual Studio 2008 }
-ev 10000 { Microsoft Visual Studio 2010 }
-ev 11000 { Microsoft Visual Studio 2012 }
-ev 12000 { Microsoft Visual Studio 2013 }
-ev 14000 { Microsoft Visual Studio 2015 }
-ev 15000 { Microsoft Visual Studio 2017 }
{Beta} -ev 16000 { Microsoft Visual Studio 2019 }

## {Beta} Use Command Line

-cl { use command line tools }

For Apple Xcode, Microsoft Visual C++, and lcc-win32, this option generates a makefile for use with the command line tools, instead of project file for the IDE.

## {Beta} Scripting Language

The configuration tool outputs a single script file. Executing this script generates all the configuration files. You can choose what scripting language is used with lines such as:

-scr mpw { Macintosh Programmers Workshop }
-scr aps { AppleScript }
-scr bsh { bash (default) }
-scr vbs { VBScript }
-scr xps { XP }

## {Beta} Use All Files

The configuration tool normally arranges that only source files needed for the current user options are compiled. This option causes all files to be compiled, which works because the source files themselves contain preprocessor conditionals to skip the unwanted code. This option also causes inclusion of all API header files and link libraries that could be needed for any set of user options, rather than only what is needed for the current user options.

This option can be useful when creating an external port based off a supported configuration. The files of an external port need to work for any set of user options.

-af { enable Use All Files }

## {Beta} Print File List

The configuration tool can generate a list of source files needed for the chosen options, when enabled by this line:

-l { Enable Print File List }

## {Beta} Print Variation Name

The configuration tool can generate a file containing the name of the Variation, when enabled by this line:

-pvn 1 { Enable Print Variation Name }

If you set the Variation Name with the -n option, that is what gets printed.

## {Beta} Print Variation Options

The configuration tool can generate a file containing the chosen options, when enabled by this line:

-pvo 1 { Enable Print Variation Options }

The printed options are in canonical form, unaffected by the order of the input options, and options set to the default value are omitted. Developer options are also omitted.

## Variation Name

If you compile a custom version of Mini vMac, you can label it with a line such as:

-n "minivmac-3.0.0-custom"

This string is displayed by the About command of Mini vMac, and is also used as the name of the archive exported by the build system.

## Abbreviated Name

Instead of specifying the whole variation name, you can just specify the abbreviated name, with a line such as:

-an mnvm0001

The version number and platform parts of the variation name are automatically generated. The abbreviated name must be 8 characters or less, and should only include lowercase letters, numbers, and underscores.

## International Characters

-intl

This option forces Mini vMac to support international characters in the user interface, even when using the default English. This is useful if the maintainer name needs the extra characters. (It would be nicer for the build system to figure out for itself what character set is needed. But this will do for now.)

## Target

Some additional options for target that are not officially supported:

-t xgen { Generic X11 }
-t mppc { Macintosh OS 9 and earlier - PowerPC }
-t m68k { Macintosh - 680x0 }
-t mfpu { Macintosh - 68020+ with FPU }
-t carb { Macintosh CarbonLib OSX/OS 8.6+ }
-t ob64 { OpenBSD on x86-64 }
-t obsd { OpenBSD on x86-32 }
-t db64 { Dragonfly BSD on x86-64 }
-t dbsd { Dragonfly BSD on x86-32 }
-t mx11 { X11 for Macintosh OS X - PowerPC }
-t mi11 { X11 for Macintosh OS X - Intel }
-t mx64 { X11 for Macintosh OS X - x86-64 }
-t cygw { Cygwin/X for Microsoft Windows }
-t fbpc { FreeBSD on PowerPC }
-t slrs { Solaris - SPARC }
-t sl86 { Solaris - Intel }
-t wc86 { Pocket PC - Intel (Emulator) }
-t irix { IRIX - MIPS }
-t ndsa { Nintendo DS - ARM }
-t minx { Minix 3.2 }
{Beta} -t port { Port : don't generate platform/compiler files }

## Model

Some additional options for model that are not officially supported:

-m Twiggy { Macintosh prototype }
-m Twig43 { Macintosh prototype }
-m PB100 { Macintosh PowerBook 100 }

The Twiggy emulation (by Matěj Hybler) allows use of the ROM from a Macintosh prototype that has a Twiggy floppy drive (used in the original Lisa computer), instead of the Sony drive that the Macintosh 128K ended up shipping with. Except for the disk driver, the ROMs are nearly identical, except most everything is shifted to somewhat different addresses. Probably because the trap patching technique used in Macintosh System Software tends to depend on exact locations of routines in ROM, no System Software that shipped will run with the Twiggy ROM. There are two known disk images that will work with it, one with an early version of MacWrite and one with an early version of MacPaint. However these image don't currently work as is in the Twiggy Mac emulation. Matěj Hybler figured out a small patch to their boot block code to make them work, that disables some sort of check for the disk being bootable. This might be needed because the emulation is still using a replacement disk driver that is trying to imitate the data structures in memory used by the Sony disk driver, while the Twiggy disk driver has significantly different data structures. (With this patch, these two disk images will also work fine in the Macintosh 128K emulation.)

The Twig43 emulation (also by Matěj Hybler) allows use of an even earlier ROM (which near the end of the ROM contains the string “ROM4.3T 07/04/83”). This ROM is more significantly different. Oddy though, it can use the early MacPaint and MacWrite images without modification.

There is some code for PowerBook 100 emulation, but it does not yet get very far in booting.

## CPU

The build system normally determines the CPU and operating system from the target (-t) you have specified. If a target doesn't yet exist for the combination of CPU and operating system you desire, you can select a target for that operating system and a different CPU, and then override the CPU with a line such as:

-cpu 68k { 680x0 }
-cpu ppc { PowerPC }
-cpu x86 { Intel 32 bit }
-cpu x64 { Intel 64 bit }
-cpu spr { sparc }
-cpu arm { ARM }
{Beta} -cpu a64 { ARM 64 bit }
-cpu mip { MIPS }
-cpu gen { generic }

It might or might not compile correctly, but it at least provides a starting point.

## API

The build system normally determines the appropriate API (Application Programming Interface) from the target (-t) you have specified. You can override this choice with lines such as:

-api mac { Macintosh OS }
-api osx { Carbon for Macintosh OS X }
-api cco { Cocoa for Macintosh OS X }
-api win { Microsoft Windows 32 }
-api xwn { X Window System }
-api gtk { GTK+ (GIMP Toolkit) }
-api sdl { Simple DirectMedia Layer 1.2 }
-api sd2 { Simple DirectMedia Layer 2.0 }

One useful use of this option is to specify '-api gtk' for a linux target (overriding the default '-api xwn'). This gets a menu bar and file dialogs, but loses other features since this port is incomplete.

## Sound API

The build system normally determines the appropriate Sound API from the target (-t) you have specified. You can override this choice with lines such as:

-snd-api alsa { Advanced Linux Sound Architecture }
-snd-api ddsp { Open Sound System and compatible }

Currently the only useful use of this option is to specify '-snd-api ddsp' for a linux target (overriding the default '-snd-api alsa').

## Debugging Level

-d d { debug }
-d t { test }
-d s { ship }

-log 1 { enable logging infrastructure }

Logging won't do much without further enabling or creating code to log various events that you are currently interested in.

-dis 1 { enable disassembler }

Besides disassembling a number of instructions executed after an event of interest, it can disassemble instructions prior to the event, as the emulator can save the addresses of instruction executed to a circular buffer. Requires the "-log" option. Nothing much will happen without further enabling or creating code to log various events that you are currently interested in.

## Vertical synchronization

bug : This isn't working correctly in Full Screen Mode, at least in OS X 10.6.8, and so is not supported for this version, at least.

-vsync 1 (mnvm0159)

Currently for OS X only, this option turns on OpenGL double buffering and sets AGL_SWAP_INTERVAL to 1. This eliminates the "tearing" issues noted by Manuel Alfayate. Unfortunately it isn't yet a real solution, it is more to help illustrate the issue before coming up with a better implementation. (See testsync.) Besides using much more memory, it also reduces the maximum speed of emulation unpredictably and erratically, because it makes aglSwapBuffers block until the vertical retrace, when Mini vMac is expecting to give the emulation extra time, for above "1x" speed.

## End of Developer Options

@ { no more developer options }

If this option is present, then no developer options are permitted to the right of this option. The Variations Service uses this to forbid developer options.