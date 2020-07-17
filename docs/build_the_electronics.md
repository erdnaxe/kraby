**Table of content**:

[TOC]

* * *

# PCB

PCB were designed using Eagle 9, which demo version is sufficient.
PCB design files are available here :
<https://github.com/erdnaxe/kraby/tree/master/printed_circuit_boards>.

-   `printed_circuit_boards/nanopi_shield` is a shield that connects on NanoPi
    Neo4 expansion header and provides headers for UART, I2C and 5v power.
-   `printed_circuit_boards/power_board` is a power distribution board
    and connects all servomotors to one UART bus.

![Boards](img/boards.png)

!!! Warning "Only one serial port"

    These PCB connect all servomotors serial ports together.
    This may bottleneck your communication speed later, so if your board have more serial ports you may remix those files.

* * *

## Battery

### Battery requirements

Herkulex DRS-0101 requires a DC voltage from 7 to 12 V,
and draws approximately 500 mA (at 7 V) at maximum torque.
So the battery needs to be able to deliver **at least
9 A peak current** at a DC voltage **from 7 to 12 V**.

We choose 7 SubC NiMH cells at 3000 mAh each in series
but you may go with a Lithium battery
that will have a better capacity over mass, thus being more dangerous.
With the NiMH cells, we measured around 2 hours of autonomy using the robot.

!!! Danger "Battery protection and connection"

    For the battery, **you should use a fuse** and a switch in series
    and then connect onto the large battery connector of the power board.

### Powering the embedded computer

The embedded computer requires a 5 V DC voltage and can draw up to 3 A
peak current.
We choose _Texas Instrument LM2596_ Buck regulator as breakout boards exist and are simple to
use.

* * *

## How to wire it up

![Connection diagram](img/how_to_connect.jpg)
