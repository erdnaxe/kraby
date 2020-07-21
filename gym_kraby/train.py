import tensorflow as tf
from stable_baselines.common.policies import MlpPolicy
from stable_baselines.common import set_global_seeds
from stable_baselines import PPO2, logger
from stable_baselines.common.vec_env import SubprocVecEnv
from stable_baselines.bench.monitor import Monitor
import gym
from gym.wrappers import TimeLimit
import argparse
import os

# Disable Tensorflow deprecation warnings
tf.compat.v1.logging.set_verbosity(tf.compat.v1.logging.ERROR)


def make_env(log_folder, env_name, rank, seed=0):
    """
    Init an environment

    :param rank: (int) index of the subprocess
    :param seed: (int) the inital seed for RNG
    """
    timestep_limit = 32

    def _init():
        env = gym.make(env_name)
        env = TimeLimit(env, timestep_limit)
        env = Monitor(env, log_folder + 'seed_' + str(seed + rank))
        env.seed(seed + rank)
        return env
    set_global_seeds(seed)
    return _init


def train(exp_name, env_name, n_envs, **kwargs):
    # Train 10 runs
    for n in range(1, 11):  # PPO2_n
        # Configure logger
        log_folder = 'training_logs/' + exp_name + '_' + str(n) + '/'
        logger.configure(log_folder, ['csv'])

        print("[+] Starting training", n)
        env = SubprocVecEnv([make_env(log_folder, env_name, i, (n-1)*32)
                             for i in range(n_envs)])

        model = PPO2(
            policy=MlpPolicy,
            env=env,
            verbose=True,

            # Make it deterministic
            seed=32*n,  # Fixed seed
            n_cpu_tf_sess=1,  # force deterministic results

            # Pass arguments
            **kwargs
        )
        model.learn(
            total_timesteps=int(250e3),
            log_interval=1,  # log each update
        )

        # Saving model
        os.makedirs("trained_models", exist_ok=True)
        model.save("trained_models/" + exp_name + "_" + str(n))

        env.close()
        del env
        del model


if __name__ == "__main__":
    # Some commandline settings
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--one-leg',
        action='store_true',
        help='simulate or command only one leg',
    )
    args = parser.parse_args()

    # Select corresponding environment
    model = 'OneLeg' if args.one_leg else 'Hexapod'
    env_name = 'gym_kraby:' + model + 'BulletEnv-v0'

    # Use `tensorboard --logdir notebooks/stablebaselines/tensorboard_log/exp_name` to inspect learning
    # See https://github.com/araffin/rl-baselines-zoo/blob/master/utils/hyperparams_opt.py#L148
    # batchsize = n_steps * n_envs / nminibatches
    train(
        exp_name="test",
        env_name=env_name,
        n_envs=32,
        gamma=0.90,  # Discount factor
        n_steps=128,  # batchsize = n_steps * n_envs
        ent_coef=0.01,  # Entropy coefficient for the loss calculation
        learning_rate=10e-4,
        lam=0.95,  # Factor for trade-off of bias vs variance for Generalized Advantage Estimator
        nminibatches=64,  # Number of training minibatches per update.
        noptepochs=30,  # Number of epoch when optimizing the surrogate
        cliprange=0.2,  # Clipping parameter, this clipping depends on the reward scaling
        tensorboard_log="./tensorboard_log/test/",  # Tensorboard integration
    )
