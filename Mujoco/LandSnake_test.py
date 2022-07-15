import gym
from stable_baselines3 import PPO

environment_name = "landsnake-v0"

env = gym.make(environment_name)
env.reset()

models_dir = "models/PPO"
timestamp = "06-16-2022,14:57:51"
iteration = "500000"
model_path = f"{models_dir}/{timestamp}/{iteration}.zip"

model = PPO.load(model_path, env = env)

episodes = 10

for ep in range(episodes):
    obs = env.reset()
    done = False
    while not done:
        env.render()
        action, _ = model.predict(obs)
        obs, reward, done, info = env.step(action)

env.close()