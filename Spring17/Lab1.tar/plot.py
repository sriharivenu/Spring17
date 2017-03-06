import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

brute = [1923951/1000000, 21223514/1000000, 1591197073/1000000, 170388606969/1000000] #add in the results you got here, just make sure you have 4 entries each separated by commas
#brute = brute/1000000;
shortN = [4, 6, 8, 10]
GS = [919704/1000000, 959211/1000000, 989234/1000000, 1115260/1000000, 7090175/1000000, 20583514/1000000, 37371669/1000000, 118338022/1000000] #same here, but with 8 entries separated by commas
#GS = GS/1000000;
longN = [4, 6, 8, 10, 160, 320, 640, 1280]

plot1, = plt.loglog(shortN, brute, 'r')
plot2, = plt.loglog(longN, GS, 'b')
plt.xlabel('Size of Input N')
plt.ylabel('Execution Time (ms)')
plt.title('Comparing Gale Shapely and Brute Force Execution Times')

blue_patch = mpatches.Patch(color='blue', label='Gale Shapely')
red_patch = mpatches.Patch(color='red', label='Brute Force')

plt.legend([plot1,plot2],['Brute Force', 'Gale Shapely'])

plt.show()