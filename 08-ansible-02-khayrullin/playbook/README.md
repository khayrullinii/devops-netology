# Playbook для установки   ClickHouse и [Vector](https://vector.dev) centOS.

## Краткое описание
Playbook устанавливает на managed хосты  [ClickHouse](https://www.youtube.com/watch?v=fjTNS2zkeBs) с созданием базы данных и [Vector](https://www.youtube.com/watch?v=CgEhyffisLY)

rpm файлы для установки скачиваются с https://packages.clickhouse.com/rpm/stable и https://packages.timber.io/vector/


## Запуск playbook

- Для запуска необходимо вписать в inventory/prod.yml ip адреса хостов, на которые нобходимо установить ClickHouse и Vector.
- После чего запускаем playbook командой: 

       ansible-playbook -i {путь до файла}/inventory/prod.yml {путь до файла}/site.yml
- Для установки одной из утилит воспользуйтесь тегами "clickhouse" или "vector"
- Для выбора версии утилит, измените соответствующее значение в group_vars/clickhouse/vars.yml для clickhouse и vector