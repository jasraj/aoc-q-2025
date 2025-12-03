.d1.data:read0 `$":data/day-01.txt";


.d1.p1:{
    parsed:((::;neg) "L" = first each .d1.data) @' "I"$1_/:.d1.data;
    :count where 0 = ({ (x+y) mod 100 }\)[50; parsed];
 };


