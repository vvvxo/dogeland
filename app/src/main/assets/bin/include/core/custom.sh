if [[ $SDK -ge 23 ]]; then
    echo "检测到Android7以下系统,此版本仅支持Android6+"
    echo "------"
    echo "请去Github搜DogeLand下载适用于Android5+的版本"
    sleep 1000
    sleep 9999
else
    echo "">/dev/null
fi
if [[ $SDK -ge 22 ]]; then
    echo "检测到Android5.1,此版本仅支持Android6+"
    echo "------"
    echo "请去Github搜DogeLand下载适用于Android5+的版本"
    sleep 1000
    sleep 9999
else
    echo "">/dev/null
fi
if [[ $SDK -ge 21 ]]; then
    echo "检测到Android5,此版本仅支持Android6+"
    echo "------"
    echo "请去Github搜DogeLand下载适用于Android5+的版本"
    sleep 1000
    sleep 9999
else
    echo "">/dev/null
fi