# Домашнее задание к занятию «Вычислительные мощности. Балансировщики нагрузки»  

### Выполнил Хайруллин Ильнур


## Задание 1

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.
 
2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.
 
3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.

4. (дополнительно)* Создать Application Load Balancer с использованием Instance group и проверкой состояния.

## Ответ:


1. Cоздал [бакет](https://github.com/khayrullinii/devops-netology/blob/master/14-cloud-02-balancer-khayrullin/bucket.tf) и разместил в нем файл

![1](img/1.png)

2.  Развернул 3 ВМ через  [instance group](https://github.com/khayrullinii/devops-netology/blob/master/14-cloud-02-balancer-khayrullin/instance.tf)

![2](img/2.png)

![3](img/3.png)

3. Подцепил к группе [network balancer](https://github.com/khayrullinii/devops-netology/blob/master/14-cloud-02-balancer-khayrullin/balancer.tf)

![4](img/4.png)

4. Создал [Application Load Balancer](https://github.com/khayrullinii/devops-netology/blob/master/14-cloud-02-balancer-khayrullin/app_balancer.tf) и подцепил к созданной ранее IG.

![5](img/5.png)