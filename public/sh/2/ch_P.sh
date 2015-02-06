#/bin/bash
echo "Which P_disk"
read P_disk
cp -r src "$P_disk"P

#sed -i -e "1d" "$P_disk"r/test17.f90
#sed -i -e "1i !P_disk="$P_disk"r_Titan" "$P_disk"P/test17.f90

sed -i -e "271d" "$P_disk"P/test17.f90
sed -i -e "271i P_disk="$P_disk"d0" "$P_disk"P/test17.f90

#sed -i -e "3d" "$P_disk"P/test.sh
#sed -i -e "3i titlename='Fnet("${P_disk}"r)' " "$P_disk"P/test.sh

#sed -i -e "3d" "$P_disk"P/test2.sh
#sed -i -e "3i titlename='Fnet("${P_disk}"r)' " "$P_disk"P/test2.sh

#sed -i -e "31i convert -delay 100 *.png ${P_disk}r_anime.gif" "$P_disk"P/test.sh
#sed -i -e "32d" "$P_disk"P/test.sh

#sed -i -e "31i convert -delay 100 *.png ${P_disk}r2_anime.gif" "$P_disk"P/test2.sh
#sed -i -e "32d" "$P_disk"P/test2.sh

#chmod 700 "$P_disk"P/*.sh

echo "copy and convert finished"

cd  "$P_disk"P
gfortran test17.f90
wait
echo "conpile finished"
nohup ./a.out &
cd ../
echo "all finished"