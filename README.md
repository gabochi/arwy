# arwy
bytebeat with puredata gem particles bash dynamic patching

![](https://github.com/gabochi/arwy/blob/main/Captura%20de%20pantalla_2023-07-24_20-41-32.png)

# reqs
+ puredata
+ gem
+ bash

# instructions

1. open arwy.pd in puredata
2. run the following code in your terminal, *remember you can always use `ctl+x` `ctl+e` to edit the command in the default editor*
```bash
echo '''
exp (t>>(-t>>11&1)|t%127|t>>4|-t*.999>>4)+32;
#exp ((t<<7)/((t/32.01&3)+1)>>9&(t|-t*.999)>>6)-1; 
#exp ((t<<7)/((t/64.01&3)+1)>>9&t>>5)-(-t>>12&1)-1; 
#exp (t/2+t%31*(-t>>11&1)&t*.999>>4&t>>4)+210; 
#exp ((t>>(-t*1.25>>12&1)*2)+t*2%3*(-t>>12&1)&t*.999>>5&-t>>5)+231; 
#exp ((((((t>>(-t>>12&1))+t%3*(-t>>12&1))>>3-((t*1.1>>13&7)==7)*1)%(1234544>>(t>>11&7)&31))-(t*.99>>10&7)|t>>4&110)-15&255)/2; 
#exp (((t>>2+(-t>>12&1)*3)/((t>>11&3)+1)%(5327>>(t>>11)*1.25%12&15)*255|t*.999>>9|t>>8)+2&255)/2; 
''' | sed 's/t/$v1/g' | pdsend 9090
```
3. to play another tune just comment/uncomment another exp line
4. generate visuals running this command in your terminal, *`3` is n of particle-groups you want to generate*
```bash
bash ranpar2.sh 3
```
