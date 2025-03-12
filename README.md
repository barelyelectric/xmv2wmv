# Batch scripts for converting XMV to WMV and MP4
-----------------------------------------------

### How to install ffmpeg in Windows (and add it to path) - https://phoenixnap.com/kb/ffmpeg-windows

---

## Process all .xmv files in the current directory:

xmv2wmv_all-files.bat

xmv2mp4_all-files.bat

---

## dragdrop-xmv2wmv.bat

Drag and drop .xmv files to convert to .wmv (direct video stream copy)


Extracts audio.

Copy .xmv video stream to .wmv container.

Converts audio to 192k wmav2.

If .xmv has no audio, process anyway.

---

## dragdrop-xmv2mp4.bat

Drag and drop .xmv files to convert to .mp4 (lossy video re-encode)


Extracts audio.

Compress video with x264 at crf18.

Compress audio to 192k AAC.

If .xmv has no audio, process anyway.
