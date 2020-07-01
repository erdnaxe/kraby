#!/usr/bin/env python3
"""
Make the robot dance on a music

Inspired by https://python-sounddevice.readthedocs.io/en/0.3.15/examples.html
Require sounddevice python module to be installed.
"""
import argparse
import math
import numpy as np
import sounddevice as sd
from gym_kraby.utils.herkulex_socket import HerkulexSocket


def main(args):
    samplerate = sd.query_devices(args.device, 'input')['default_samplerate']
    low, high = 80, 100
    columns = 10
    delta_f = (high - low) / (columns - 1)
    fftsize = math.ceil(samplerate / delta_f)
    low_bin = math.floor(low / delta_f)

    # Connect and init motors
    print("Connecting...")
    h = HerkulexSocket(use_udp=True)
    h.reset()

    def callback(indata, frames, time, _):
        if any(indata):
            # Get magnitudes of 3 bands of low freq
            magnitude = np.abs(np.fft.rfft(indata[:, 0], n=fftsize))
            magnitude *= args.gain / fftsize

            # Control servomotors
            a = magnitude[low_bin:low_bin + columns] * 20 - 10
            m2, m3 = a[1:3]
            h.move([m3/10, m2, m2]*6, reset_neutral=True)

    with sd.InputStream(
        device=args.device,
        channels=1,
        callback=callback,
        blocksize=int(samplerate * args.block_duration / 1000),
        samplerate=samplerate,
    ):
        print("Press enter to quit...")
        while True:
            if input() in ('', 'q', 'Q'):
                h.disableTorque()
                exit(0)


if __name__ == "__main__":
    # Parse command arguments
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '-l', '--list-devices',
        action='store_true',
        help='show list of audio devices and exit',
    )
    parser.add_argument(
        '-b', '--block-duration',
        type=float,
        metavar='DURATION',
        default=50,
        help='block size (default %(default)s milliseconds)',
    )
    parser.add_argument(
        '-d', '--device',
        type=int,
        help='input device (numeric ID or substring)',
    )
    parser.add_argument(
        '-g', '--gain',
        type=float,
        default=10,
        help='initial gain factor (default %(default)s)',
    )
    args = parser.parse_args()

    # If ask to list audio devices
    if args.list_devices:
        print(sd.query_devices())
        parser.exit(0)

    try:
        main(args)
    except KeyboardInterrupt:
        parser.exit('Interrupted by user')
