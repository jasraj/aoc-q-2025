.d4.data:read0 `$":data/day-04.txt";

.d4.lookAround:(-1 0 1 cross -1 0 1) except enlist 0 0;
.d4.xLen:count first .d4.data;
.d4.yLen:count .d4.data;


.d4.p1:{
    :count where .d4.posCheck ./: til[.d4.yLen] cross til .d4.xLen;
 };


.d4.posCheck:{[y; x]
    item:.d4.data[y; x];

    if["." = item;
        :0b;
    ];

    / - No negative co-ordinates
    / - No co-ordinates greater than the length in each direction
    / - Don't include current position
    / - Remove any duplicates (for boundary cases)
    neighbours:0|(y;x) +/: .d4.lookAround;
    neighbours:flip .d4[`yLen`xLen] &' flip neighbours;
    neighbours:neighbours except enlist (y;x);
    neighbours:distinct neighbours;

    :4 > count where "@" = .d4.data ./: neighbours;
 };
