import socket


class HerkulexSocket:
    def __init__(self, ip="10.42.0.1", port=2000):
        """Initialize Herkulex class

        Args:
            ip (str): Control socket IP.
            port (int): Control socket port.
        """
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

        # Calibrate servomotors (in RAM)
        calibration_values = [
            38, 256-46, 46,
            36, 256-46, 46,
            29, 256-46, 46,
            34, 256-46, 46,
            43, 256-46, 46,
            30, 256-46, 46,
        ]
        for i, v in enumerate(calibration_values):
            self.send(0x03, [47, 0x01, v], i+1)

        # TODO use I_JOG/S_JOG to switch to Turn/Velocity control mode

        # Prompt user if it's ready
        input("Press enter to set torque on...")

        # Set torque on (in RAM)
        self.send(0x03, [52, 0x01, 0x60])

    def get_observations(self, raw=False):
        """Return positions, speeds and torques of all servomotors

        Args:
            raw (bool, optional): Return uncalibrated positions. Defaults to False.

        Returns:
            array: Observations.
        """
        # Get positions
        positions = [0] * 18
        pos_ram_addr = 60 if raw else 58
        for i in range(18):
            ret = self.send(0x04, [pos_ram_addr, 0x02], i+1, len_ack=13)
            raw_pos = ret[9] + ((ret[10] & 0x3) << 8)
            positions[i] = raw_pos * 18.621  # to radian

        # Get speeds
        speeds = [0] * 18
        for i in range(18):
            ret = self.send(0x04, [62, 0x02], i+1, len_ack=13)
            raw_speed = ret[9] + ((ret[10] & 0x3) << 8)
            speeds[i] = raw_speed * 1.9696  # to rad/s

        return positions, speeds
