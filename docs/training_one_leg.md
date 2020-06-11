# Training one hexapod leg

## With pytorch-a2c-ppo-acktr-gail

This section details how to use
[pytorch-a2c-ppo-acktr-gail](https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail)
PPO implementation.

The defaults hyperparameters given in the
[README](https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail/blob/master/README.md)
will work even if they may not be optimized to the environment and your computer. 

### Running one training

As the README recommands, train using the following command,

```bash
python main.py --env-name gym_kraby:OneLegBulletEnv-v0 --algo ppo --use-gae \
               --log-interval 1 --num-steps 2048 --num-processes 1 --lr 3e-4 \
               --entropy-coef 0 --value-loss-coef 0.5 --ppo-epoch 10 \
               --num-mini-batch 32 --gamma 0.99 --gae-lambda 0.95 \
               --num-env-steps 1000000 --use-linear-lr-decay --no-cuda \
               --seed 0 --use-proper-time-limits
```

### Running simultaneous training

[generate_tmux_yaml.py](https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail/blob/master/generate_tmux_yaml.py)
generates a tmuxp Yaml configuration file to launch simultaneous experiments.
This is a modified version for `gym_kraby:OneLegBulletEnv-v0`:

```Python
import yaml

ppo_mujoco_template = "python main.py --env-name {0} --algo ppo --use-gae --log-interval 1 --num-steps 2048 --num-processes 1 --lr 3e-4 --entropy-coef 0 --value-loss-coef 0.5 --ppo-epoch 10 --num-mini-batch 32 --gamma 0.99 --gae-lambda 0.95 --num-env-steps 1000000 --use-linear-lr-decay --no-cuda --log-dir /tmp/gym/{1}/{1}-{2} --seed {2} --use-proper-time-limits"
template = ppo_mujoco_template
env_name = "gym_kraby:OneLegBulletEnv-v0"
config = {"session_name": "run-all", "windows": []}

for i in range(16):
    panes_list = []
    panes_list.append(
        template.format(env_name,
                        env_name.split('-')[0].lower(), i))

    config["windows"].append({
        "window_name": "seed-{}".format(i),
        "panes": panes_list
    })

yaml.dump(config, open("run_all.yaml", "w"), default_flow_style=False)
```

After launching this script you can run the experiments,

```bash
tmuxp load run_all.yaml
```

### Enjoying results

Because Kraby environments use PyBullet rendering, you need to edit `enjoy.py`
and `a2c_ppo_acktr/envs.py`:

```diff
diff --git a/a2c_ppo_acktr/envs.py b/a2c_ppo_acktr/envs.py
index 2514630..62b5abf 100755
--- a/a2c_ppo_acktr/envs.py
+++ b/a2c_ppo_acktr/envs.py
@@ -35,7 +35,8 @@ def make_env(env_id, seed, rank, log_dir, allow_early_resets):
             _, domain, task = env_id.split('.')
             env = dm_control2gym.make(domain_name=domain, task_name=task)
         else:
-            env = gym.make(env_id)
+            env = gym.make(env_id, render=True)
 
         is_atari = hasattr(gym.envs, 'atari') and isinstance(
             env.unwrapped, gym.envs.atari.atari_env.AtariEnv)
diff --git a/enjoy.py b/enjoy.py
index f67f055..da50bde 100644
--- a/enjoy.py
+++ b/enjoy.py
@@ -64,7 +64,7 @@ masks = torch.zeros(1, 1)
 obs = env.reset()
 
 if render_func is not None:
-    render_func('human')
+    pass #render_func('human')
 
 if args.env_name.find('Bullet') > -1:
     import pybullet as p
@@ -92,4 +92,4 @@ while True:
             p.resetDebugVisualizerCamera(distance, yaw, -20, humanPos)
 
     if render_func is not None:
-        render_func('human')
+        pass #render_func('human')
```

You may also use
[visualize.ipynb](https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail/blob/master/visualize.ipynb)
to plot the average episode reward by the step (with standard deviation of this average).

![Training results](img/training_one_leg_pytorch-a2c-ppo-acktr-gail.png)
