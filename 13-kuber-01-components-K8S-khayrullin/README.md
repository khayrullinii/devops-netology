# Домашнее задание к занятию  «Компоненты Kubernetes»

### Выполнил Хайруллин Ильнур

## Основная часть

### Задание 1. Необходимо определить требуемые ресурсы
Известно, что проекту нужны база данных, система кеширования, а само приложение состоит из бекенда и фронтенда. Опишите, какие ресурсы нужны, если известно:

1. Необходимо упаковать приложение в чарт для деплоя в разные окружения. 
2. База данных должна быть отказоустойчивой. Потребляет 4 ГБ ОЗУ в работе, 1 ядро. 3 копии. 
3. Кеш должен быть отказоустойчивый. Потребляет 4 ГБ ОЗУ в работе, 1 ядро. 3 копии. 
4. Фронтенд обрабатывает внешние запросы быстро, отдавая статику. Потребляет не более 50 МБ ОЗУ на каждый экземпляр, 0.2 ядра. 5 копий. 
5. Бекенд потребляет 600 МБ ОЗУ и по 1 ядру на копию. 10 копий.


### Ответ:

### Задание 1.

Всего ресурсов (без учета ресурсов на компоненты K8S кластера): 30,250 GB и 17 ядер

Разместим все на 3 нодах для отказоустойчивости (обязательно все три копии базы и кеша храним на разных нодах)

Исходя из требований выделяемые ресурсы на ноду, будут следующими, 18GB ОЗУ и 8 ядер, из которых:

    0.09 vCPU и 2,72GB ОЗУ на операционку и компоненты K8S кластера
    6.4 vCPU и 9,9GB ОЗУ на сервисы приложение (1 база, 1 кеш, 2 фронта, 3 бека)
    100Mb ОЗУ для порога выселения
    
    1,5 vCPU и 5,28GB ОЗУ остается на каждой ноде, для возможности переезда базы и кеша на две ноды соответственно
    



