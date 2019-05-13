echo off
rem Задаем кодовую страницу
chcp 1251

rem файлы с расширением *.pfl – профайлы, содержат информацию о расположении окон, цветов и отборов
rem файлы с расширением *.v8i – информация о базах на данном компьютере
rem файлы cache.1CD, cache.1CL – кеширование конфигурации и информация о блокировке объектов
rem файлы *.bin драйвера из конфигурации прямо при запуске базы 1с, или например часть кода в конфигурации 1с, подвергнутая обфускации.

If Exist "%APPDATA%\1C\1Cv8" (
 rem удаляем vrs-cache\cache.1cd
 rem который есть только в %LOCALAPPDATA%
 FOR /D %%i in (%LOCALAPPDATA%\1C\1Cv8\*) do (
  FOR /D %%j in ("%%i\????????-????-????-????-????????????") do (
   FOR /D %%l in ("%%j\vrs-cache") do (
    FOR %%k in (%%l\cache.1cd) do (
rem    echo удаляем=%%k
     DEL /F /S /Q /A %%k
    )
   )
  )
 )


DEL /F /S /Q /A %LOCALAPPDATA%\1C\1Cv8\*.bin
DEL /F /S /Q /A %APPDATA%\1C\1Cv8\*.bin

)
