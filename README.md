# 1_hse21_H3K27me3_G4_human
- скачала с ENCODE архивы с данными Chip-seq экспериментов
- с помощью lifover привела их в 19 сборке генома человека
- скачала десктопное приложение github и сделала локальную копирию репозитория себе на компьютер
- пострила гистограммы длин Chip-seq пиков (где пики - наличие интересующей нас гистонной метки)

Число пиков в файлах Chip-seq экспериментов (до выброса неожидаемо длинный пиков):
-- ENCFF801AHF.hg19: 144752
![image](https://user-images.githubusercontent.com/84495736/121469434-261b5d80-c9c5-11eb-89a1-95d50552367f.png)
-- ENCFF801AHF.hg38: 145139
![image](https://user-images.githubusercontent.com/84495736/121469509-4ba86700-c9c5-11eb-8a96-415d5e9f145c.png)
-- ENCFF881ONN.hg19: 69150
![image](https://user-images.githubusercontent.com/84495736/121469567-62e75480-c9c5-11eb-8f7d-af556f0b4a68.png)
-- ENCFF881ONN.hg38: 69322
![image](https://user-images.githubusercontent.com/84495736/121469617-7b576f00-c9c5-11eb-93d6-bb661dbc472d.png)

В обоих файла hg19 были выброшены пики длиной более 5000 (конвенциональное значение, предложенное на семинаре).
Число пиков после фильтрации:

-- ENCFF801AHF.hg19: 143802
![image](https://user-images.githubusercontent.com/84495736/121472568-08042c00-c9ca-11eb-8dc1-64b9a0c5e343.png)
-- ENCFF881ONN.hg19: 69150 (не изменилось)
![image](https://user-images.githubusercontent.com/84495736/121472640-20744680-c9ca-11eb-941a-8e4f43731203.png)


- объединила два набора отфильтрованных ChIP-seq пиков и получила файл H3K27me3_K562.merge.hg19
- визуализация в геномном браузере:
![image](https://user-images.githubusercontent.com/84495736/121482742-16f0db80-c9d6-11eb-8e75-2acde6540f6e.png)

- обединила файлы для обоих стрендов и получила файл G4_seq_Li_KPDS_merged с перечислением участков ДНК, где располагается вторичная структура G4_seq_Li_KPDS. Число таких участков - 1285463
![image](https://user-images.githubusercontent.com/84495736/121490195-77374b80-c9dd-11eb-9880-7f0f573ffd67.png)
![image](https://user-images.githubusercontent.com/84495736/121490122-68509900-c9dd-11eb-932e-04f917a601aa.png)
