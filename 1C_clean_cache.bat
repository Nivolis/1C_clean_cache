echo off
rem Задаем кодовую страницу
chcp 1251

rem файлы с расширением *.pfl – профайлы, содержат информацию о расположении окон, цветов и отборов
rem файлы с расширением *.v8i – информация о базах на данном компьютере
rem файлы cache.1CD, cache.1CL – кеширование конфигурации и информация о блокировке объектов
rem файлы *.bin драйвера из конфигурации прямо при запуске базы 1с, или например часть кода в конфигурации 1с, подвергнутая обфускации.


forfiles /P "%localappdata%\1c\1Cv8" /d -50 /M *vrs-cache /S /C "cmd /c RD /S /Q @path"
forfiles /P "%appdata%\1c\1Cv8" /d -50 /M *vrs-cache /S /C "cmd /c RD /S /Q @path"

forfiles /P "%localappdata%\1c\1Cv8" /d -50 /M *Config /S /C "cmd /c RD /S /Q @path"
forfiles /P "%localappdata%\1c\1Cv8" /d -50 /M *ConfigSave /S /C "cmd /c RD /S /Q @path"

forfiles /P "%localappdata%\1c\1Cv8" /d -50 /M *.bin /S /C "cmd /c DEL /F /S /Q /A @path"
forfiles /P "%appdata%\1c\1Cv8" /d -50 /M *.bin /S /C "cmd /c DEL /F /S /Q /A @path"
