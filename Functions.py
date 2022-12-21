import numpy as np

class Functions():
    
    def VDist(self, V1, V2):
        dx = (V2[0]-V1[0])**2
        dy = (V2[1]-V1[1])**2
        dz = (V2[2]-V1[2])**2
        return np.sqrt(dx + dy + dz)
        
