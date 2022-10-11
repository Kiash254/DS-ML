import pandas as pd
import numpy as np
print("pandas is used to arrange data ins a tabular form")

d={'Colomn a':[1,2,3,4,5],'Column b':[6,7,8,9,10],' Column c':[11,12,13,14,15]}
df=pd.DataFrame(d)
print(df)

data=max(90,80,70,60,50)
print( "The biggest data is ", data)
print("The smallest data is ", min(90,80,70,60,50))     


avg=[30,40,50,60,70,80,90]
get_mean=np.mean(avg)
print("The mean is ", get_mean)


health_data = pd.read_csv("data.csv", header=0, sep=",")

print(health_data)

# import sys
# import matplotlib
# matplotlib.use('Agg')

# import pandas as pd
# import matplotlib.pyplot as plt

# health_data = pd.read_csv("data.csv", header=0, sep=",")

# health_data.plot(x ='Average_Pulse', y='Calorie_Burnage', kind='line')
# plt.ylim(ymin=0)
# plt.xlim(xmin=0)

# plt.show()

# #Two lines to make our compiler able to draw:
# plt.savefig(sys.stdout.buffer)
# sys.stdout.flush()

full_health_data = pd.read_csv("data.csv", header=0, sep=",")

pd.set_option('display.max_columns',None)
pd.set_option('display.max_rows',None)

print (full_health_data.describe())

full_health_data = pd.read_csv("data.csv", header=0, sep=",")

std = np.std(full_health_data)

print(std)