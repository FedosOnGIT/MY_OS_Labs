#!/bin/bash
mkdir /home/fedos/test && (echo "catalog was successfuly created" > ~/report | touch /home/fedos/test/Дата_И_Время_Создания)
ping www.net_nikogo.ru || (date ; echo "Написано же, что никого нет! Совсем тютю?") >> ~/report
