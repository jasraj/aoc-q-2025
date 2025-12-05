.d5.data:read0 `$":data/day-05.txt";


.d5.p1:{
    split:(0,first where 0 = count each .d5.data) cut .d5.data;

    ranges:"J"$"-" vs/:split 0;
    ingredients:"J"$1_ split 1;

    :count where any each ingredients within/:\: ranges;
 };

