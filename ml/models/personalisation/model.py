"""Banner / row personalisation — contextual bandit (LinUCB) over content rows.

Selects which row layout to show for a given user context (device, time of day,
country) and updates row reward from CTR + completion rate of clicked title.
"""
import numpy as np


class LinUCB:
    def __init__(self, n_arms: int, n_features: int, alpha: float = 1.0):
        self.A = [np.eye(n_features) for _ in range(n_arms)]
        self.b = [np.zeros(n_features) for _ in range(n_arms)]
        self.alpha = alpha

    def select(self, context: np.ndarray) -> int:
        ucb = []
        for i in range(len(self.A)):
            A_inv = np.linalg.inv(self.A[i])
            theta = A_inv @ self.b[i]
            mean  = theta @ context
            var   = self.alpha * np.sqrt(context @ A_inv @ context)
            ucb.append(mean + var)
        return int(np.argmax(ucb))

    def update(self, arm: int, context: np.ndarray, reward: float) -> None:
        self.A[arm] += np.outer(context, context)
        self.b[arm] += reward * context
