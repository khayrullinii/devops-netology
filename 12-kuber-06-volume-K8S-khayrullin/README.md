# Домашнее задание к занятию «Хранение в K8s. Часть 1»

### Выполнил Хайруллин Ильнур

## Основная часть

### Задание 1 


Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.
3. Обеспечить возможность чтения файла контейнером multitool.
4. Продемонстрировать, что multitool может читать файл, который периодоически обновляется.
5. Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.

------

### Задание 2


Создать DaemonSet приложения, которое может прочитать логи ноды.

1. Создать DaemonSet приложения, состоящего из multitool.
2. Обеспечить возможность чтения файла `/var/log/syslog` кластера MicroK8S.
3. Продемонстрировать возможность чтения файла изнутри пода.
4. Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.


### Ответ:

### Задание 1.

Создал [Deployment](https://github.com/khayrullinii/devops-netology/blob/master/12-kuber-06-volume-K8S-khayrullin/deployment.yaml) 

Скриншот с примонтированной папки в контенере multitool:

![1](img/1.png)

### Задание 2.

Создал [Demonset](https://github.com/khayrullinii/devops-netology/blob/master/12-kuber-06-volume-K8S-khayrullin/demonset.yaml) 

Cкриншот из пода c примонтированной директорией:

![2](img/2.png)

