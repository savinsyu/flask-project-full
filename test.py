# Подключаем библиотеки


try:
    import os, pandas as pd, tqdm, numpy as np
    print('Все библиотеки установлены.')
except ModuleNotFoundError:
    print('Некоторые библиотеки не установлены.')