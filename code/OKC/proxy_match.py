import pandas as pd
import numpy as np
from sklearn.svm import SVR
from sklearn.model_selection import cross_val_score


frmt = pd.read_feather("code/OKC/data/formatted_data.feather")
frmt.set_index('username', inplace=True)

cols = frmt.columns.tolist()
Xcols = list(filter(lambda x: x.startswith('d_') or x.startswith('f_'), cols))

X = frmt[Xcols].values
y = frmt.match_pct.values

mod = SVR(kernel='sigmoid')
mod.fit(X=X, y=y)

cvs = cross_val_score(mod, X=X, y=y, n_jobs=2)
np.mean(cvs)