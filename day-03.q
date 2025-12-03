.d3.data:read0 `$":data/day-03.txt";

.d3.p1:{
    :sum .d3.findMaxJoltage each .d3.data;
 };


.d3.findMaxJoltage:{[bank]
    / Append bank element to all elements after the specific one, convert to integer and find the max
    :max raze "I"$bank ,/:'1_ ((1_)\) bank;
 };
