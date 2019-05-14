echo off
rem Задаем кодовую страницу
chcp 1251

rem =====================================================================================================================================
rem файлы с расширением *.pfl – профайлы, содержат информацию о расположении окон, цветов и отборов
rem файлы с расширением *.v8i – информация о базах на данном компьютере
rem файлы cache.1CD, cache.1CL – кеширование конфигурации и информация о блокировке объектов
rem файлы *.bin драйвера из конфигурации прямо при запуске базы 1с, или например часть кода в конфигурации 1с, подвергнутая обфускации.
rem =====================================================================================================================================
rem вывод для отладки
rem forfiles /S /P "%localappdata%\1c" /D -50 /C "cmd /c echo @path изменен @fdate @ftime"
rem =====================================================================================================================================

rem удаляем директории
forfiles /P "%localappdata%\1c\1Cv8" /d -50 /M *vrs-cache /S /C "cmd /c if @isdir==TRUE RD /S /Q @path"
forfiles /P "%appdata%\1c\1Cv8" /d -50 /M *vrs-cache /S /C "cmd /c if @isdir==TRUE RD /S /Q @path"

rem удаляем директории
forfiles /P "%localappdata%\1c\1Cv8" /d -50 /M *Config /S /C "cmd /c if @isdir==TRUE RD /S /Q @path"
forfiles /P "%localappdata%\1c\1Cv8" /d -50 /M *ConfigSave /S /C "cmd /c if @isdir==TRUE RD /S /Q @path"

rem удаляем .bin файлы
forfiles /P "%localappdata%\1c\1Cv8" /d -50 /M *.bin /S /C "cmd /c if @isdir==FALSE DEL /F /S /Q /A @path"
forfiles /P "%appdata%\1c\1Cv8" /d -50 /M *.bin /S /C "cmd /c if @isdir==FALSE DEL /F /S /Q /A @path"

rem удаляем файлы
forfiles /P "%temp%" /d -50 /S /C "cmd /c if @isdir==FALSE DEL /F /S /Q /A @path"
