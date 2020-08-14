**Table of content**:

[TOC]

* * *

# Preparing transfer to real world

The different learning experiments done last section were done with a environment time step of 50 ms,
which is the minimum period at which we can control and observe all servomotors.

As explained in [observation vector comparisons](training_one_leg.md#observation-vector-comparison),
**all the simulation observation is observable in the real world.**
No need to implement the direct mechanics to compute the position of the fingertip.

Each environment got it "real world" equivalent, that will not use PyBullet and will **not be able to compute a reward**.
