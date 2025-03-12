@echo off
if "%~1"=="" exit /b
for %%F in (%*) do (
    set "inputFile=%%F"
    set "fileName=%%~nF"

    ffmpeg -i "%%F" -vn -c:a pcm_s16le "%%~nF.wav" 2>nul
    if exist "%%~nF.wav" (
        echo Audio extracted, proceeding with muxing...
        ffmpeg -i "%%F" -i "%%~nF.wav" -c:v copy -c:a wmav2 -b:a 192k -fflags +genpts -map 0:v:0 -map 1:a:0 "%%~nF.wmv"
        del "%%~nF.wav"
    ) else (
        echo No audio found, remuxing video only...
        ffmpeg -i "%%F" -c:v copy -an "%%~nF.wmv"
    )
)