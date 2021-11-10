# **Getting started with Zerynth SDK**

Zerynth SDK is the gateway to develop IoT products and applications. It includes Zerynth OS, VScode extension, compilation and debugging tools, examples and demos.


Zerynth installer supports Windows, Mac and linux.
You can download it from these links:

- [**Windows 10**](https://downloads.zerynth.com/v3/installer/zerynth-installer.exe)
- [**Linux**](https://downloads.zerynth.com/v3/installer/zerynth-installer.AppImage)
- [**Mac**](https://downloads.zerynth.com/v3/installer/zerynth-installer.dmg)

Once downloaded, simply run it and follow the instructions. The installation process is different on each platform.

#### Installer for Windows

Double click the `zerynth-installer.exe`. The first time Windows may pop up a dialog saying that
the application is signed by Zerynth; just click continue to go on with the execution. It is possible that Windows will present you a blue dialog title "Windows protected your PC"; in that case, just click "more info" and run the installer.

<figure>
  <a data-fancybox="gallery" href="../img/windows-screen.png">
  <img src="../img/windows-screen.png"/>
  </a>
  <figcaption>Windows Smartscreen warning</figcaption>
</figure>


#### Installer for Linux

The `zerynth-installer.AppImage` file you just downloaded can be executed in some distributions with a simple double click. However,
in general you may need to give execution permissions to the file before running it. This is done from a terminal with the command `chmod 755 <path-to-zerynth-installer>`.

<figure>
  <a data-fancybox="gallery" href="../img/installer-linux-01.png">
  <img src="../img/installer-linux-01.png"/>
  </a>
</figure>

#### Installer for Mac

The `zerynth-installer.dmg` archive you just downloaded can be double clicked and mounted on the Finder. Just drag the `zerynth-installer` app contained within to the `Applications` folder. Next, click on `Applications` and run the `zerynth-installer` app.

<figure>
  <a data-fancybox="gallery" href="../img/installer-mac-01.png">
  <img src="../img/installer-mac-01.png"/>
  </a>
</figure>

!!! Note
    If you are using a Mac based on the new M1 cpu, you are required to install [Rosetta](https://osxdaily.com/2020/12/04/how-install-rosetta-2-apple-silicon-mac/).

### Installation process

The installer will install the **Zerynth SDK** in your development machine in a few steps. If you encounter any error please refere to our [Installer FAQ](../reference/faq/installer.md).

<figure>
  <a data-fancybox="gallery" href="../img/installer-01.png">
  <img src="../img/installer-01.png" width="600"/>
  </a>
</figure>

First, accept the license and terms and press `Install`. This will install the latest version of the SDK together with Visual Studio Code (a.k.a. VSCode) and the [VSCode Zerynth Extension](https://marketplace.visualstudio.com/items?itemName=zerynth.zerynth3).

<figure>
  <a data-fancybox="gallery" href="../img/installer-02.png">
  <img src="../img/installer-02.png"width="600"/>
  </a>
</figure>
The installer will do its magic and in a couple of minutes will ask you to login to the Zerynth platform.

<figure>
  <a data-fancybox="gallery" href="../img/installer-03.png">
  <img src="../img/installer-03.png"width="600"/>
  </a>
</figure>

The login is done in your web browser and if everything is ok, you can go back to the installer and start VSCode!

<figure>
  <a data-fancybox="gallery" href="../img/installer-05.png">
  <img src="../img/installer-05.png"width="600"/>
  </a>
</figure>

### Run Visual Studio Code

You can start VSCode:

- in Windows, from the Start Menu or by typing `zcode` from Powershell
- in Mac and Linux, from `bash` or `zsh` terminals by typing `zcode`

For more information on the extension features, sections and technical details, please refer to [the Development Environmen section in the technical reference.](../../../reference/vscode/)


Everything is set and you are ready to run your first IoT project, refer to any of our hardware [getting started guides on the left tab.](../ZM1-DB/)