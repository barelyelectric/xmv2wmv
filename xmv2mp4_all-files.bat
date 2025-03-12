@echo off
for %%F in (*.xmv) do (
    echo Processing: %%F
    ffmpeg -i "%%F" -vn -c:a pcm_s16le "%%~nF.wav" 2>nul

    if exist "%%~nF.wav" (
        echo Audio extracted, re-encoding video...
        ffmpeg -i "%%F" -i "%%~nF.wav" -c:v libx264 -preset fast -crf 18 -c:a aac -b:a 192k -fflags +genpts -map 0:v:0 -map 1:a:0 "%%~nF.mp4"
        del "%%~nF.wav"
    ) else (
        echo No audio found, encoding video-only MP4...
        ffmpeg -i "%%F" -c:v libx264 -preset fast -crf 18 -an "%%~nF.mp4"
    )
)