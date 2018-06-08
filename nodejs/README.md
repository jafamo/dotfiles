#Install from repositories

```
git clone https://github.com/nodejs/node.git
cd node 
git checkout v0.12.7 # or the next stable branch
./configure --prefix=/opt/node && make -j 2 && sudo make install #Num of cores  -j 2

vim bashrc
export PATH=$PATH:/opt/node/bin


