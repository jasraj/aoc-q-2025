.d2.data:read0 `$":data/day-02.txt";

.d2.p1:{
    parsed:"J"$"-" vs/: "," vs first .d2.data;
    ids:raze { x[1] + til 1 + (-). x } each reverse each parsed;

    :sum ids where .d2.repeatSeqSplitMiddle each ids;
 };

.d2.p2:{
    parsed:"J"$"-" vs/: "," vs first .d2.data;
    ids:raze { x[1] + til 1 + (-). x } each reverse each parsed;

    :sum ids where .d2.repeatSeqCombinations each ids;
 };


.d2.repeatSeqSplitMiddle:{[id]
    sId:string id;

    / Ignore odd length IDs
    if[1 = count[sId] mod 2;
        :0b;
    ];

    / Split the even length values in half, cast to long and then check if the 2 elements are equal.
    / If there are, then it's an invalid ID
    :(=) . "J"$(count[sId] div 2) cut sId;
 };

.d2.repeatSeqCombinations:{[id]
    sId:string id;

    / Split the value from 1 to the half the length of the string as a list of combinations
    combinations:"J"$(1 + til count[sId] div 2) cut\: sId;
    combinations:combinations where 1 < count each combinations;

    / Any splits that when distinct gives a single value is an invalid ID
    :any 1 = count each distinct each combinations;
 };

