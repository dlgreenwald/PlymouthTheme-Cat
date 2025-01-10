# Cat - a plymouth theme
This is a fork of a lovely [PlymouthTheme-Cat](https://github.com/krishnan793/PlymouthTheme-Cat)
by [krishnan793](https://github.com/krishnan793). Since I really liked this old
theme, I decided to improve it a bit. Now the animation differs for booting and
shutdown modes. After playing some number of frames the animation is seamlessly
looping.


<table>
  <tr>
    <td>
        wakeup full animation:<p>
        <img src="./img/wakeup_full.gif" width = 250px>
    </td>
    <td>
        asleep full animation:<p>
        <img src="./img/asleep_full.gif" width = 250px></td>
  </tr> 
  <tr>
    <td>
        wakeup endless looping part:<p>
        <img src="./img/wakeup_loop.gif" width = 250px>
    </td>
    <td>
        asleep endless looping part:<p>
        <img src="./img/asleep_loop.gif" width = 250px>
    </td>
  </tr>
</table>


# Installation

Clone this repository somewhere.

    git clone https://github.com/derVedro/PlymouthTheme-Cat.git

Then copy the cat directory into your plymouth themes directory.

    cd PlymouthTheme-Cat; sudo cp -r cat /usr/share/plymouth/themes/

The next steps may vary from distribution to distribution:

## On most distros

(Tested on openSUSE Tumbleweed)

### Set GRUB2 up

Check `/etc/default/grub`. It should include the following:

    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

* If there are other parameters defined in `GRUB_CMDLINE_LINUX_DEFAULT="..."` you don't have to remove them unless they conflict with the ones above.
* `quiet` and `splash` are required to start plymouth
* Additionally you might have to [enable KMS](https://unix.stackexchange.com/a/110589) e.g. in case you're using integrated graphics by Intel by adding `i915.modeset=1`.

Reconfigure GRUB2, if you had to add something:

    sudo grub2-mkconfig -o /boot/grub2/grub.cfg

### Activate the theme

Check that the theme ended up in the right place:

    sudo plymouth-set-default-theme --list

Set the theme as default:

    sudo plymouth-set-default-theme cat -R

The -R option rebuilds the initrd automatically which is necessary.

## On Ubuntu

Install the theme.

    sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/cat/cat.plymouth 100

Select the default theme.

    sudo update-alternatives --config default.plymouth

Update the initramfs image.

    sudo update-initramfs -u

Now reboot.

If you want to install this on < Ubuntu 16.04, change the path from /usr/share/plymouth to /lib/plymouth/ . You need to do this on the cat.plymouth file also.

# Test theme

To test the current theme you can use the `preview-plymouth-theme.sh` bash
script from repository root directory. You should run it as root. You can pass
the preview duration as an optional argument to the script. Be warned if you pass
large time values. Plymouth takes over the keyboard input, so it is unfortunately
not possible to cancel the preview with CTRL+C.

    sudo ./preview-plymouth-theme.sh [TIME_IN_SECONDS]