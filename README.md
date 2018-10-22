In order to run output decomposition (fdvad, fdvac), and calculate upstreamness indicator (upsts) run get_io(year, version) and construct(x) functions first. Two versions of data are available. A - years 1995 - 2011, 41 countries, 35 sectos. B - years 2000 - 2014, 44 countries and 56 sectors. 



FDVAD - example

$`Title`
[1] "Decomposition of Final Demand in respect to value added from source countries"

$Country
[1] "DEU"

$Year
[1] 1995

$Sector
[1] "Transport Equipment"



$fdvad() - example

     DEU      FRA      USA      ITA      RoW      GBR      AUT      JPN      NLD      BEL      ESP      RUS      POL      SWE 
78.86133  2.62078  2.01496  1.95562  1.89714  1.65246  1.41576  1.34204  1.14198  1.06206  0.75825  0.64770  0.46024  0.44216 
     CZE      CAN      KOR      CHN      DNK      BRA      FIN      TWN      TUR      MEX      HUN      AUS      SVK      IRL 
 0.37325  0.35373  0.30378  0.28741  0.28053  0.24884  0.20929  0.19623  0.19399  0.14603  0.14446  0.13119  0.12424  0.11769 
     LUX      PRT      IDN      IND      SVN      ROM      GRC      BGR      LTU      LVA      EST      MLT      CYP 
 0.10956  0.10743  0.09518  0.08642  0.08520  0.06256  0.02742  0.01912  0.00606  0.00547  0.00523  0.00481  0.00239 


The data above show that 78.8% of final demand in Germany (DEU) in sector of Transport Equipment is satisifed by local supply - locally sourced capital and labour. 2.67% of value added in this sector comes from France etc...




fdvac(34) - example

$`Title`
[1] "Decomposition of Final Demand in respect to value added from source countries"

$Country
[1] "RUS"

$Year
[1] 2008

$FDVAC
     RUS      RoW      DEU      JPN      CHN      USA      ITA      GBR      POL      KOR      FRA      TUR      NLD      FIN 
91.81988  1.49900  1.07961  0.74197  0.69455  0.44860  0.33188  0.32046  0.31276  0.29897  0.28331  0.17849  0.17523  0.15896 
     ESP      SWE      BEL      LTU      CZE      AUT      SVK      BRA      CAN      AUS      HUN      IND      DNK      TWN 
 0.15376  0.13392  0.12238  0.12139  0.11921  0.11916  0.09623  0.09450  0.07793  0.07426  0.05948  0.05442  0.05135  0.04492 
     BGR      IDN      MEX      ROM      EST      IRL      SVN      LVA      GRC      CYP      PRT      LUX      MLT 
 0.04483  0.04281  0.04062  0.03353  0.03006  0.02792  0.02718  0.02293  0.02174  0.01648  0.01357  0.01033  0.00142 

The data above show that 91.8 % of total final demand in Russia in 2008 is staisfied by local economy. 1.5% comes from the ROW (REST of the WORLD - unclassified countries), Germany (1.08%) etc.


for details see : How global are global value chains? : a new approach to measure international fragmentation
Bart Los; Marcel P. Timmer; Gaaitzen J. de Vries

UPSTR - example(,12)

Country                            Sector Upstreamness
1      AUS Basic Metals and Fabricated Metal     3.319064
2      AUT Basic Metals and Fabricated Metal     3.003984
3      BEL Basic Metals and Fabricated Metal     3.123639
4      BGR Basic Metals and Fabricated Metal     3.147907
5      BRA Basic Metals and Fabricated Metal     2.906420
6      CAN Basic Metals and Fabricated Metal     2.982180
7      CHN Basic Metals and Fabricated Metal     3.702900
8      CYP Basic Metals and Fabricated Metal     2.666113
9      CZE Basic Metals and Fabricated Metal     3.331471
10     DEU Basic Metals and Fabricated Metal     3.129881
11     DNK Basic Metals and Fabricated Metal     2.866054
12     ESP Basic Metals and Fabricated Metal     3.209618
13     EST Basic Metals and Fabricated Metal     3.041721
14     FIN Basic Metals and Fabricated Metal     3.341162
15     FRA Basic Metals and Fabricated Metal     3.017397
16     GBR Basic Metals and Fabricated Metal     2.828952
17     GRC Basic Metals and Fabricated Metal     2.622369
18     HUN Basic Metals and Fabricated Metal     2.852996
19     IDN Basic Metals and Fabricated Metal     3.075518
20     IND Basic Metals and Fabricated Metal     2.753058
21     IRL Basic Metals and Fabricated Metal     2.910222
22     ITA Basic Metals and Fabricated Metal     2.921745
23     JPN Basic Metals and Fabricated Metal     3.434736
24     KOR Basic Metals and Fabricated Metal     3.885305
25     LTU Basic Metals and Fabricated Metal     2.355693
26     LUX Basic Metals and Fabricated Metal     3.278461
27     LVA Basic Metals and Fabricated Metal     3.073596
28     MEX Basic Metals and Fabricated Metal     2.675222
29     MLT Basic Metals and Fabricated Metal     1.906740
30     NLD Basic Metals and Fabricated Metal     3.121485
31     POL Basic Metals and Fabricated Metal     2.951194
32     PRT Basic Metals and Fabricated Metal     2.933406
33     ROM Basic Metals and Fabricated Metal     2.965741
34     RUS Basic Metals and Fabricated Metal     3.458420
35     SVK Basic Metals and Fabricated Metal     3.076217
36     SVN Basic Metals and Fabricated Metal     2.997172
37     SWE Basic Metals and Fabricated Metal     3.176210
38     TUR Basic Metals and Fabricated Metal     2.756708
39     TWN Basic Metals and Fabricated Metal     3.629591
40     USA Basic Metals and Fabricated Metal     3.131388
41     RoW Basic Metals and Fabricated Metal     3.072087


Upstreamness indicator evaluates the distance from the sector to the end usage , final demand. The smaller is the number (minimum is 1), the closer is the secot to the end customers. Usually value close to one is related to better situation/profitaability of the specific sector.

For details see: Upstreamness in the Global Value Chain: Manufacturing and Services, Kenji Suganuma