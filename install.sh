echo "eko Installer - version 0.0.1"
wget https://github.com/ekolang/eko/archive/refs/tags/alpha-0.0.4.zip
if [ -d "alpha-0.0.4"  ]; then
	echo "Remove old install progress cache and files for clean install?"
	echo "[Y][N]"
	read answer
	if [ "$answer" == "Y" ]; then
		rm -r alpha-0.0.4
		mkdir alpha-0.0.4
	else
		echo "Continue without remove anything."
	fi
else
	mkdir alpha-0.0.4
fi
unzip alpha-0.0.4.zip -d alpha-0.0.4/
cd alpha-0.0.4/eko-alpha-0.0.4/src/runtime
dub
sudo mv libmarschiert.a /usr/local/lib
cd ..
cd axiom
dub
sudo mv libaxiom.a /usr/local/lib
cd ..
dub
if [ -f "eko" ]; then
	echo -e "\033[32mBuild Done. do you want to move it to usr/local/bin?"
	echo -e "\033[0m[Y][N]"
	read ans
	if [ "$ans" == "Y" ]; then
		sudo mv eko /usr/local/bin
		echo "progress finished. (2)BuildDone."
	else
		echo "progress finished. (1)BuildDone."
	fi
else
	echo "Faild To compile eko. (0)Build."
fi
