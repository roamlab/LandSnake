import gym
import os
from stable_baselines3 import PPO
from stable_baselines3.common.vec_env import DummyVecEnv
from stable_baselines3.common.monitor import Monitor
from datetime import datetime

GAMMA = 0.9995

environment_name = "landsnake-v0"
date_time = datetime.now().strftime("%m-%d-%Y,%H:%M:%S")
models_dir = f"models/PPO/{date_time}"
logdir = "logs"

if not os.path.exists(logdir):
    os.makedirs(logdir)

if not os.path.exists(models_dir):
    os.makedirs(models_dir)

info = open(f"{models_dir}/info.txt","w")
info.write(f"GAMMA = {GAMMA}")
info.close()

env = gym.make(environment_name)
env = Monitor(env)
model = PPO("MlpPolicy", env, verbose = 1, gamma = GAMMA, tensorboard_log=logdir, gae_lambda=0.99)

TIMESTEPS = 10000
for i in range(600):

    model.learn(total_timesteps = TIMESTEPS, reset_num_timesteps=False, tb_log_name=f"PPO_{date_time}")
    model.save(f"{models_dir}/{TIMESTEPS*i}.zip")

env.close()
