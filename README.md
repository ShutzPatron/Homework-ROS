# Homework-ROS
 Домашняя работа по ROS. Бригада: Шабуров, Смирнов, Гунба
В данном пакете реализованы 2 узла. Узел приема данных от пользователя линейная и угловая скорость, обработки и рассчёта положения робота, отправки с другой узел. И узел отрисовки траектории

Команды запуска:
$ cd ~/DIR_PATH/HW3
$ source ./devel/setup.bash
$ catkin_make
$ roscore
Далее открываем ещё 2 терминала 
$ cd ~/DIR_PATH/HW3
$ source ./devel/setup.bash
$ catkin_make
В каждом повтряем эти три команды
В одном из терминалов пишем команду
$ rosrun robot sub.py 
это узел отрисовки
в другом терминале пишем
$ rosrun robot move.py
