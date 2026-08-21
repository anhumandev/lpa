wget https://github.com/ekolang/eko/archive/refs/tags/alpha-0.0.4.zip
mkdir alpha-0.0.4
unzip alpha-0.0.4.zip -d alpha-0.0.4/
cd alpha-0.0.4/eko-alpha-0.0.4/src/runtime
dub
sudo mv libmarschiert.a /usr/local/lib
cd ..
dub
