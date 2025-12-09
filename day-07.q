.d7.data:read0 `$":data/day-07.txt";

.d7.p1:{
    result:(.d7.tachyonSplit/)[.d7.data; til count .d7.data];

    / Check where the splitters were and check the cell above if it had a inbound beam
    didSplit:where each next "^" = result;
    :count where "|" = raze result @' didSplit;
 };


.d7.tachyonSplit:{[data; row]
    if[any "S" = data row;
        :data;
    ];

    inboundT:data[row - 1] in "S|";
    splitter:"^" = data row;

    newRow:data row;
    newRow:@[newRow; where inboundT & not splitter; :; "|"];

    if[any inboundT & splitter;
        newRow:@[newRow; raze -1 1 +/: where inboundT & splitter; :; "|"];
    ];

    newData:data;
    newData[row]:newRow;

    :newData;
 };
