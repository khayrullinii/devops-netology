# Домашнее задание к занятию 1. «Введение в виртуализацию. Типы и функции гипервизоров. Обзор рынка вендоров и областей применения»

### Выполнил Хайруллин Ильнур


## Задание 1
Опишите кратко, в чём основное отличие полной (аппаратной) виртуализации, паравиртуализации и виртуализации на основе ОС.

## Ответ:
- Полная (аппаратная) виртуализаци - гостевая ос может напрямую взаимодействовать с процессором. 
- Паравиртуализация - требуется ос на хосту(на сервере) для взаимодействия с аппаратными ресурсами гостевым ОС
- Виртуализация на основе ОС - позволяет запускать только ВМ со схожими типами ядер хостовой ОС (Роль гипервизора выполняет хостовая ОС)

## Задание 2 
Выберите один из вариантов использования организации физических серверов в зависимости от условий использования.

Организация серверов:

- физические сервера,
- паравиртуализация,
- виртуализация уровня ОС.

Условия использования:

- высоконагруженная база данных, чувствительная к отказу;
- различные web-приложения;
- Windows-системы для использования бухгалтерским отделом;
- системы, выполняющие высокопроизводительные расчёты на GPU.

Опишите, почему вы выбрали к каждому целевому использованию такую организацию.

## Ответ:

1. физические сервера - высоконагруженная база данных, чувствительная к отказу и системы, выполняющие высокопроизводительные расчёты на GPU (Для высокопроизводительных процессов можно не расходовать аппартаные ресурсы на гипервизор)
2. паравиртуализация - Windows-системы для использования бухгалтерским отделом (Для создания рабочих мест подойдет паравиртуализация, так как высокая производительность и быстрота взаимодействия с аппаратными ресурсами не требуется)
3. виртуализация уровня ОС - различные web-приложения (для отдельных приложений прекрасно подходят контейнеры, с помощью которых можно гибко распределить ресурсы внутри ос)

## Задание 3
Выберите подходящую систему управления виртуализацией для предложенного сценария. Детально опишите ваш выбор.

Сценарии:

1. 100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований. Преимущественно Windows based-инфраструктура, требуется реализация программных балансировщиков нагрузки, репликации данных и автоматизированного механизма создания резервных копий.
2. Требуется наиболее производительное бесплатное open source-решение для виртуализации небольшой (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.
3. Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows-инфраструктуры.
4. Необходимо рабочее окружение для тестирования программного продукта на нескольких дистрибутивах Linux.

## Ответ:

1. Один из облачных провайдеров, потому что нет особых требований по производительности. Облачные провайдеры предоставляют удобные инструменты для реализации запрошенных сервисов. (Из аппаратных подойдет VMware, так как реализации облака с высоким требованием к инфраструктуре)
2. Xen - кроссплатформенный open-source продукт с поддержкой аппаратной виртуализацией.
3. Hyper-V - так как требуется максимально совместимое с windows решение
4. KVM - open-source, можно развернуть локально на компе, работает со многими дистрибутивами Linux.
## Задание 4
Опишите возможные проблемы и недостатки гетерогенной среды виртуализации (использования нескольких систем управления виртуализацией одновременно) и что необходимо сделать для минимизации этих рисков и проблем. Если бы у вас был выбор, создавали бы вы гетерогенную среду или нет? Мотивируйте ваш ответ примерами.

## Ответ:
Проблемы и недостатки:
- Теряется гибкость в распределении ресурсов внутри системы
- Необходимость в высококвалифицированных кадрах для каждой среды виртуализации
- возможные проблемы с восстановлением сервиса при переходе из одной среды в другую

Создал бы аппаратную среду с вложенной вирт. уровня ОС. Например, если надо создать несколько веб приложений, которые не требуют высокой отказоустойчивости и производительности. Достаточно будет развернуть одну вм и поднять веб приложения в контейнерах. Тем самым гибко распределив аппаратные ресурсы.
