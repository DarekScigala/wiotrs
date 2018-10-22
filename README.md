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

     DEU      FRA      USA      
78.86133  2.62078  2.01496  ... etc



The data above show that 78.8% of final demand in Germany (DEU) in sector of Transport Equipment is satisifed by local supply - locally sourced capital and labour. 2.67% of value added in this sector comes from France etc...




fdvac(34) - example

$`Title`
[1] "Decomposition of Final Demand in respect to value added from source countries"

$Country
[1] "RUS"

$Year
[1] 2008

$FDVAC
     RUS      RoW      DEU    
91.81988  1.49900  1.07961  ... etc


The data above show that 91.8 % of total final demand in Russia in 2008 is staisfied by local economy. 1.5% comes from the ROW (REST of the WORLD - unclassified countries), Germany (1.08%) etc.


for details see : How global are global value chains? : a new approach to measure international fragmentation
Bart Los; Marcel P. Timmer; Gaaitzen J. de Vries

UPSTR - example(,12)

Country                            Sector Upstreamness
1      AUS Basic Metals and Fabricated Metal     3.319064
2      AUT Basic Metals and Fabricated Metal     3.003984
3      BEL Basic Metals and Fabricated Metal     3.123639
4      BGR Basic Metals and Fabricated Metal     3.147907

etc...




Upstreamness indicator evaluates the distance from the sector to the end usage , final demand. The smaller is the number (minimum is 1), the closer is the secot to the end customers. Usually value close to one is related to better situation/profitaability of the specific sector.

For details see: Upstreamness in the Global Value Chain: Manufacturing and Services, Kenji Suganuma