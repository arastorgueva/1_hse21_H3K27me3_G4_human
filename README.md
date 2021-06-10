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

- Пики гистоновой метки H3K27me3 относительно аннотированных генов:
ENCFF801AHF ![chip_seeker H3K27me3_K562 ENCFF801AHF hg19 filtered plotAnnoPie](https://user-images.githubusercontent.com/84495736/121536581-dd3ac780-ca0b-11eb-8256-0a6fde8d0b7e.png)
ENCFF881ONN ![chip_seeker H3K27me3_K562 ENCFF881ONN hg19 filtered plotAnnoPie](https://user-images.githubusercontent.com/84495736/121536716-fb082c80-ca0b-11eb-8d99-ef545dee7f40.png)


- обединила файлы для обоих стрендов и получила файл G4_seq_Li_KPDS_merged с перечислением участков ДНК, где располагается вторичная структура G4_seq_Li_KPDS. Число таких участков - 1285463
![image](https://user-images.githubusercontent.com/84495736/121494709-a64fbc00-c9e1-11eb-86ea-7b879b88be92.png)

- распределение длин пересечений гистоновой метки и G4_seq_Li_KPDS:
(число пересчений 178949)
![image](https://user-images.githubusercontent.com/84495736/121495766-8e2c6c80-c9e2-11eb-9df2-7b6cea286e48.png)

- Пайчарт: расположение участков G4_seq_Li_KPDS аннотированных генов![chip_seeker G4_seq_Li_KPDS_merged plotAnnoPie](https://user-images.githubusercontent.com/84495736/121537865-fb54f780-ca0c-11eb-884d-8de0b66132ec.png)


Ссылка на сессию в геномном браузере: http://genome.ucsc.edu/s/airastorgueva/hse21_H3K27me3_G4_human

- Пример пересечения гистоновой метки H3K27me3 и вторичной структуры G4_seq_Li_KPDS
В большом масштабе: координаты chr1:53,026,757-54,536,756:
![image](https://user-images.githubusercontent.com/84495736/121523456-e83b2b00-c9fe-11eb-81e1-6006db32a40a.png)

Более локально: координаты chr1:53,723,161-53,874,160 -- на этой иллюстрации видно, что в основном метилирование присутствует в межгенном пространстве (а так же в райне промотра изоморфов гена LRP8). При этом G-квадруплексы встречаются на всем участке примерно с одинаковой вероятностью (то есть в том числе и в ингронах гена). Исходя из этой иллюстрации, сложно говорить о связи метилирования H3K27me3 и G-квадруплексов, однако на пайчартах выше видно, что в целом оба явления чаще всего встречаются в межгенном пространстве и интронах
![image](https://user-images.githubusercontent.com/84495736/121526986-9a282680-ca02-11eb-9943-dd7790f3528d.png)

- Ассоциация полученных пересечений с генами

Число пиков, проассоциированных с генами: 9313
Число уникальных генов: 3768


GO-анализ:
![image](https://user-images.githubusercontent.com/84495736/121544034-124a1880-ca12-11eb-9c3f-8fe8f38fd29d.png)

