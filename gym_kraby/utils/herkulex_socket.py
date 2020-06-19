import socket
import numpy as np
from time import sleep


class HerkulexSocket:
    calibration_values = [
        38, 256-46, 46,
        36, 256-46, 46,
        29, 256-46, 46,
        34, 256-46, 46,
        43, 256-46, 46,
        30, 256-46, 46,
    ]

    def __init__(self, max_velocity, max_torque, ip="10.42.0.1", port=2000):
        """Initialize Herkulex class

        Args:
            ip (str): Control socket IP.
            port (int): Control socket port.
        """
        self.max_velocity = max_velocity
        self.max_torque = max_torque
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.connect((ip, port))

    def send(self, cmd: int, data: [int], pid=0xFE, len_ack=0):
        """Format and send a command to one or all Herkulex servomotors

        Args:
            cmd (int): Command to send.
            data (int): Parameters of the command. 
            pid (int, optional): Target servo id. Defaults to all servomotors.
            len_ack (int, optional): Length of the returned acknowledgement data. Defaults to 0.

        Returns:
            bytearray: Returned acknowledgement data, else None.
        """
        # Compute packet size
        size = 0x07 + len(data)
        assert size <= 223, "data is too long"

        # Compute checksums
        c = 0
        for b in data:
            c ^= b
        checksum1 = (size ^ pid ^ cmd ^ c) & 0xFE
        checksum2 = ~checksum1 & 0xFE

        # Build and send packet
        packet = bytearray([0xFF, 0xFF, size, pid, cmd,
                            checksum1, checksum2] + data)
        self.socket.send(packet)

        return self.socket.recv(len_ack) if len_ack else None

    def reset(self):
        """Perform reset of all Herkulex servomotors
        """
        # Servomotors reboot, load EEPROM into RAM
        self.send(0x09, [])
        sleep(0.5)  # wait for reboot

        # Calibrate servomotors (in RAM)
        for i, v in enumerate(self.calibration_values):
            self.send(0x03, [47, 0x01, v], i)

        # For each servo, set blue LED and Turn/Velocity control mode
        self.move([0] * 18)

        # Prompt user if it's ready
        input("Press enter to set torque on...")

        # Set torque on (in RAM)
        self.send(0x03, [52, 0x01, 0x60])

    def move(self, velocities: [int]):
        """Send a S_JOG velocity control to all servo

        With S_JOG all servo operates simultaneously.

        Args:
            velocities ([int]): Target velocities
        """
        command = [60]  # 672 ms playtime
        for i in range(18):
            # TODO when in velocity control, no blocking
            #command += [velocities[i] & 0xFF, velocities[i] >> 8, 0b1010, i]
            command += [velocities[i] & 0xFF, velocities[i] >> 8, 0b1000, i]
        print(command)
        self.send(0x06, command)

    def get_observations(self, raw=False):
        """Return positions, speeds and torques of all servomotors

        Args:
            raw (bool, optional): Return uncalibrated positions. Defaults to False.

        Returns:
            array: Observations.
        """
        self.servo_obs = np.zeros(3*18, dtype="float32")

        for i in range(18):
            # Read 8 bytes from 58 to 65 in RAM, then normalize
            ret = self.send(0x04, [58, 8], i, len_ack=19)
            if raw:
                pos = (ret[11] + ((ret[12] & 0x3) << 8)) * 0.0036224 - 2
            else:
                pos = (ret[9] + ((ret[10] & 0x3) << 8)) * 0.0036224 - 2
            velocity = (ret[13] + ((ret[14] & 0x3) << 8)) * 0.5077 / self.max_velocity
            torque = (ret[15] + ((ret[16] & 0x3) << 8))  / self.max_torque
            self.servo_obs[i*3:i*3+3] = [pos, velocity, torque]

        return self.servo_obs

    def set_eeprom(self):
        """Initial configuration

        You should set servomotors id from 0 to 17 before
        and baudrate to 115 200 bauds/s.

        See page 22 of doc.
        """
        pass
