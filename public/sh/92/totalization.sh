mkdir ./kadai
mkdir /home/masa/kadai/sadamaru
mkdir /home/masa/kadai/gunkanchan
mkdir /home/masa/kadai/fuukachan
mkdir /home/masa/kadai/shimaneko
mkdir /home/masa/kadai/invalid
wget http://www.ep.sci.hokudai.ac.jp/~inex/y2014/0425/practical/kadaidata/homeworktype1.tar.gz
tar zxvf homeworktype1.tar.gz
grep -x "FUUKACHAN" ./homeworktype1/vote*
cp ./homeworktype1/vote{002,004,010,011,015,018,031,033,042,043,055,063,073,078,080,087,097} /home/masa/kadai/fuukachan
grep -x "SADAMARU" ./homeworktype1/vote*
cp ./homeworktype1/vote{001,003,006,007,012,014,021,022,024,025,029,032,035,037,041,044,051,052,053,054,058,060,061,066,070,075,077,079,081,082,083,086,088,091,093,096,098} /home/masa/kadai/sadamaru
grep -x "SHIMANEKO" ./homeworktype1/vote*
cp ./homeworktype1/vote{009,027,046,067,085,090,094} /home/masa/kadai/shimaneko
grep -x "GUNKANCHAN" ./homeworktype1/vote*
cp ./homeworktype1/vote{005,008,013,016,017,020,026,028,034,038,039,045,047,049,050,056,057,059,062,064,065,068,072,076,074,089,095,099,100} /home/masa/kadai/gunkanchan
cp ./homeworktype1/vote{019,023,030,036,040,048,069,071,084,092} /home/masa/kadai/invalid
cd ./kadai/sadamaru
mv vote001 sadamaru001
mv vote003 sadamaru002
mv vote006 sadamaru003
mv vote007 sadamaru004
mv vote012 sadamaru005
mv vote014 sadamaru006
mv vote021 sadamaru007
mv vote022 sadamaru008
mv vote024 sadamaru009
mv vote025 sadamaru010
mv vote029 sadamaru011
mv vote032 sadamaru012
mv vote035 sadamaru013
mv vote037 sadamaru014
mv vote041 sadamaru015
mv vote044 sadamaru016
mv vote051 sadamaru017
mv vote052 sadamaru018
mv vote053 sadamaru019
mv vote054 sadamaru020
mv vote058 sadamaru021
mv vote060 sadamaru022
mv vote061 sadamaru023
mv vote066 sadamaru024
mv vote070 sadamaru025
mv vote075 sadamaru026
mv vote077 sadamaru027
mv vote079 sadamaru028
mv vote081 sadamaru029
mv vote082 sadamaru030
mv vote083 sadamaru031
mv vote086 sadamaru032
mv vote088 sadamaru033
mv vote091 sadamaru034
mv vote093 sadamaru035
mv vote096 sadamaru036
mv vote098 sadamaru037
cd
cd ./kadai/fuukachan
mv vote002 fuukachan001
mv vote004 fuukachan002
mv vote010 fuukachan003
mv vote011 fuukachan004
mv vote015 fuukachan005
mv vote018 fuukachan006
mv vote031 fuukachan007
mv vote033 fuukachan008
mv vote042 fuukachan009
mv vote043 fuukachan010
mv vote055 fuukachan011
mv vote063 fuukachan012
mv vote073 fuukachan013
mv vote078 fuukachan014
mv vote080 fuukachan015
mv vote087 fuukachan016
mv vote097 fuukachan017
cd
cd ./kadai/shimaneko
mv vote009 shimaneko001
mv vote027 shimaneko002
mv vote046 shimaneko003
mv vote067 shimaneko004
mv vote085 shimaneko005
mv vote090 shimaneko006
mv vote094 shimaneko007
cd
cd ./kadai/gunkanchan
mv vote005 gunkanchan001
mv vote008 gunkanchan002
mv vote013 gunkanchan003
mv vote016 gunkanchan004
mv vote017 gunkanchan005
mv vote020 gunkanchan006
mv vote026 gunkanchan007
mv vote028 gunkanchan008
mv vote034 gunkanchan009
mv vote038 gunkanchan010
mv vote039 gunkanchan011
mv vote045 gunkanchan012
mv vote047 gunkanchan013
mv vote049 gunkanchan014
mv vote050 gunkanchan015
mv vote056 gunkanchan016
mv vote057 gunkanchan017
mv vote059 gunkanchan018
mv vote062 gunkanchan019
mv vote064 gunkanchan020
mv vote065 gunkanchan021
mv vote068 gunkanchan022
mv vote072 gunkanchan023
mv vote074 gunkanchan024
mv vote076 gunkanchan025
mv vote089 gunkanchan026
mv vote095 gunkanchan027
mv vote099 gunkanchan028
mv vote100 gunkanchan029
cd
cd ./kadai/invalid
mv vote019 invalid001
mv vote023 invalid002
mv vote030 invalid003
mv vote036 invalid004
mv vote040 invalid005
mv vote048 invalid006
mv vote069 invalid007
mv vote071 invalid008
mv vote084 invalid009
mv vote092 invalid010
echo 'FUKKACHIN CHECKED' > invalid001
echo 'SHIMA NEKO CHECKED' > invalid002
echo 'KUMAMON CHECKED' > invalid003
echo 'SADAMARUSHIMANEKO CHECKED' > invalid004
echo 'ORESAMA CHECKED' > invalid005
echo 'SANO CHECKED' > invalid006
echo 'SerrrorHIMANEKKO CHECKED' > invalid007
echo 'GUNKANCHAN error CHECKED' > invalid008
echo 'SHIMANEKO FUUKACHAN GUNKANCHAN SADAMARU CHECKED' > invalid009
echo 'FUNASSI CHECKED' > invalid010
cd
echo -e "FUUKACHAN 17\nSADAMARU 37\nGUNKANCHAN 29\nSHIMANEKO 7\nINVALID 10" >result_file
cd
