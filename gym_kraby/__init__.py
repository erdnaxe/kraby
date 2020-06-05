from gym.envs.registration import register

register(
    id='HexapodBulletEnv-v0',
    entry_point='gym_kraby.envs:HexapodBulletEnv',
)

