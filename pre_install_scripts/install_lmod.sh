#!/usr/bin/env bash


#wget http://sourceforge.net/projects/lmod/files/lua-5.1.4.8.tar.gz
#tar -xvf lua-5.1.4.8.tar.gz
#cd lua-5.1.4.8
#./configure --with-static=yes --prefix=$HOME/lua && make && make install
#/usr/bin/ld: cannot find -ltinfo
#/usr/bin/ld: cannot find -lncurses

yum install -y lua-devel
wget https://luarocks.org/releases/luarocks-3.0.4.tar.gz
tar zxpf luarocks-3.0.4.tar.gz
cd luarocks-3.0.4
./configure; sudo make bootstrap
cd

sudo /usr/local/bin/luarocks install luaposix
sudo /usr/local/bin/luarocks install luafilesystem

wget https://sourceforge.net/projects/lmod/files/Lmod-7.8.tar.bz2
tar -xvf Lmod-7.8.tar.bz2
cd Lmod-7.8
./configure --prefix=$HOME/lmod
make install


## Installing LMOD with conda results in an error with module commands, because tclsh is in /opt/conda
## tcl should be - /usr/bin/tclsh (which tclsh)
## Prefix /home/ec2-user/anaconda3/envs/lmod/
## File /home/ec2-user/anaconda3/envs/lmod/lmod/lmod/libexec/myGlobals.lua