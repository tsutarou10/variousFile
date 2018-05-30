from sklearn.datasets import load_iris
import numpy as np

iris = load_iris()
x = iris.data[:, 2:]
print x
y = iris.target
mu = x.mean(axis = 0)
print mu

sigma = np.zeros((2,2))

for i in range(2):
    for j in range(2):
        for n in range(x.shape[0]):
            sigma[i][j] += (x[n][i] - mu[i]) * (x[n][j] - mu[j])
        sigma[i][j] /= (x.shape[0] + 1.0)

print sigma
