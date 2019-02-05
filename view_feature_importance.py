#coding:utf-8

import numpy as np
import matplotlib.pyplot as plt

def main(i) :
    x = np.load('x' + str(i) + '_feature_importance.npy')
    print 'x' + str(i) + ' : ', x
    y = np.array([j + 4 for j in range(x.shape[0])])

    y_ticks = ['CN', 'JC', 'AAI', 'PA', 'RAI', 'SDC', 'overlap']

    if i == 2:
        y_ticks.append('alignment')

    if i == 3 :
        y_ticks.append('GO')

    if i == 4 :
        y_ticks.append('topic model')

    if i == 5 :
        y_ticks.append('alignment')
        y_ticks.append('topic model')

    if i == 6 :
        y_ticks.append('GO')
        y_ticks.append('topic model')

    if i == 7 :
        y_ticks.append('alignment')
        y_ticks.append('GO')

    if i == 8 :
        y_ticks.append('alignment')
        y_ticks.append('GO')
        y_ticks.append('topic model')

    print y_ticks
    plt.barh(y, x, align = 'center')
    plt.xlim(0, 0.18)
    plt.yticks(y, y_ticks, fontsize = 8)
    plt.show()

main(8)
'''
for i in range(1, 9):
    main(i)
'''

