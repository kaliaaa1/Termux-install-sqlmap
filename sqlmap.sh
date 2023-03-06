#!/data/data/com.termux/files/usr/bin/bash
apt update && apt upgrade -y > /dev/null 2>&1

apt install git python openssl1.1-tool -y > /dev/null 2>&1

echo "export LD_LIBRARY_PATH=/data/data/com.termux/files/usr/lib/openssl-1.1" >> ~/.bashrc

if [ ! -d "../sqlmapzh" ]; then
    git clone --depth 1 https://github.com/kaliaaa1/sqlmapzh.git
    
    mv Termux-install-sqlmap/sqlmapzh ../sqlmapzh
fi 
if [ ! -s "/data/data/com.termux/files/usr/bin/sqlmap" ]; then
    chmod +x sqlmapzh/sqlmap.py

    ln -s /data/data/com.termux/files/home/sqlmapzh/sqlmap.py /data/data/com.termux/files/usr/bin/

    mv ../usr/bin/sqlmap.py ../usr/bin/sqlmap
fi 
sqlmap
