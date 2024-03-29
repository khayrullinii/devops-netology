# Домашнее задание к занятию 1. «Типы и структура СУБД»

### Выполнил Хайруллин Ильнур


## Задание 1
Архитектор ПО решил проконсультироваться у вас, какой тип БД лучше выбрать для хранения определённых данных.

Он вам предоставил следующие типы сущностей, которые нужно будет хранить в БД:

- электронные чеки в json-виде,
- склады и автомобильные дороги для логистической компании,
- генеалогические деревья,
- кэш идентификаторов клиентов с ограниченным временем жизни для движка аутенфикации,
- отношения клиент-покупка для интернет-магазина.

Выберите подходящие типы СУБД для каждой сущности и объясните свой выбор.

## Ответ:

- нереляционные(Документоориентированные) - подходят для хранения несвязанных между собой чеков(документов)
- реляционная база данных, со связью склад - по какой дороге можно добраться
- нереляционные(графовые) - графы прекрасно походят для реализации древа и быстро находить связи между объектам
- нереляционные(ключ-значение) - базы данных хранящие данные в оперативной памяти, для быстрого отклика на запрос (если данные уже занесены в память)
- стандартная реляционная база данных со связью клиент-покупка

## Задание 2
Вы создали распределённое высоконагруженное приложение и хотите классифицировать его согласно CAP-теореме. Какой классификации по CAP-теореме соответствует ваша система, если (каждый пункт — это отдельная реализация вашей системы и для каждого пункта нужно привести классификацию):

- данные записываются на все узлы с задержкой до часа (асинхронная запись);
- при сетевых сбоях система может разделиться на 2 раздельных кластера;
- система может не прислать корректный ответ или сбросить соединение.

Согласно PACELC-теореме как бы вы классифицировали эти реализации?

### Ответ:

- AP - обеспечивается доступность и устойчивость к разделению, но согласованность не гарантируется (задержка до часу) (согласно PACELC - так же PA)
- AC - обеспечивается доступность и целостность данных, но при разделении могут возникнуть проблемы. (согласно PACELC - так же EC или EL, мало информации для точного описания)
- CP - всегда обеспечивается целостность данных и устойчивость к разделению, но доступность будет на втором плане (согласно PACELC - так же PC)


## Задание 3
Могут ли в одной системе сочетаться принципы BASE и ACID? Почему?

## Ответ:
Хоть и бизнес очень хочет высоконадежные и высокопроизводительные бд, принципы BASE и ACID не могут полностью сочетаться в одной системе, так как они противоречат друг другу. ACID позволяет проектировать высоконадёжные системы за счет соблюдения атомарности, согласованности, изоляции и стойкости.
А BASE позволяет проектировать высокопроизводительные системы, опираясь на базовую доступность, неустойчивое состояние и только конечную согласованность.

## Задание 4 
Вам дали задачу написать системное решение, основой которого бы послужили:

- фиксация некоторых значений с временем жизни,
- реакция на истечение таймаута.

Вы слышали о key-value-хранилище, которое имеет механизм Pub/Sub. Что это за система? Какие минусы выбора этой системы?

## Ответ:

- Этим системным решением может статать Redis (c использованием ttl для фиксации на время некоторых значений).
- В этой системе есть издатель и подписчик. Издатель "публикует сообщение" (какие-то данные) после чего всем подписчикам рассылается "сообщение" (эти же данные). 
- Минусы: механизм pub/sub не гарантирует доставки сообщений и не гарантирует консистентности

