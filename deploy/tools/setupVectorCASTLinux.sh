#!/bin/bash

#Setup Script for running VectorCAST on 64bit Linux Computers

export VECTORCAST_DIR=/var/opt/vcast/latest
export VECTOR_LICENSE_FILE=27000@192.168.1.22


sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y lsb
sudo apt-get install -y libfontconfig:i386
sudo apt-get install -y libxext6:i386
sudo apt-get install -y libxrender1:i386
sudo apt-get install -y libglib2.0-0:i386

#$VECTORCAST_DIR/vcastqt &
