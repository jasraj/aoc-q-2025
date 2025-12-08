.d6.data:read0 `$":data/day-06.txt";


.d6.p1:{
    parsedVals:"J"$" " vs/: -1_ .d6.data;
    parsedVals:parsedVals except\: 0Ni;

    / Map '+' to sum and '*' to prd to make it easier to apply to the list of inputs
    parsedOps:" " vs last .d6.data;
    parsedOps@:where 0 < count each parsedOps;
    parsedOps:(prd; sum) "+" = first each parsedOps;

    :sum parsedOps @' flip parsedVals;
 };

.d6.p2:{
    parsedVals:"H"$/:/:-1 _ .d6.data;
    parsedVals:"J"$raze each string flip parsedVals;
    parsedVals:(0,where null parsedVals) cut parsedVals;
    parsedVals:parsedVals except\: 0Ni;

    / Map '+' to sum and '*' to prd to make it easier to apply to the list of inputs
    / Same as part 1
    parsedOps:" " vs last .d6.data;
    parsedOps@:where 0 < count each parsedOps;
    parsedOps:(prd; sum) "+" = first each parsedOps;

    :sum parsedOps @' parsedVals;
 };
