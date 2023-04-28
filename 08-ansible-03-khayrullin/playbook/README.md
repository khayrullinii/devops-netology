# Playbook для установки   ClickHouse и [Vector](https://vector.dev) и lighthouse centOS.

## Краткое описание
Playbook устанавливает на managed хосты  [ClickHouse](https://www.youtube.com/watch?v=fjTNS2zkeBs) с созданием базы данных и [Vector](https://www.youtube.com/watch?v=CgEhyffisLY) и [lighthouse](https://github.com/VKCOM/lighthouse)

rpm файлы для установки скачиваются с https://packages.clickhouse.com/rpm/stable и https://packages.timber.io/vector/, а lighthouse с git репозитория


## Запуск playbook

- Для запуска необходимо вписать в inventory/prod.yml ip адреса хостов, на которые нобходимо установить ClickHouse и Vector и lighthouse.
- После чего запускаем playbook командой: 

       ansible-playbook -i {путь до файла}/inventory/prod.yml {путь до файла}/site.yml
- Для установки одной из утилит воспользуйтесь тегами "clickhouse" или "vector" или "lighthouse"
- Для выбора версии утилиты, измените соответствующее значение в group_vars/clickhouse/vars.yml для clickhouse и vector
- Для изимения конфигурации веб сервера внесите изменения в шаблон lighthouse.conf.j2