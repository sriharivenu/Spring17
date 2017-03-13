
module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [32:0] A;
  input [32:0] B;
  output [32:0] SUM;
  input CI;
  output CO;

  wire   [32:1] carry;

  FAX1 U1_31 ( .A(A[31]), .B(B[31]), .C(carry[31]), .YC(carry[32]), .YS(
        SUM[31]) );
  FAX1 U1_30 ( .A(A[30]), .B(B[30]), .C(carry[30]), .YC(carry[31]), .YS(
        SUM[30]) );
  FAX1 U1_29 ( .A(A[29]), .B(B[29]), .C(carry[29]), .YC(carry[30]), .YS(
        SUM[29]) );
  FAX1 U1_28 ( .A(A[28]), .B(B[28]), .C(carry[28]), .YC(carry[29]), .YS(
        SUM[28]) );
  FAX1 U1_27 ( .A(A[27]), .B(B[27]), .C(carry[27]), .YC(carry[28]), .YS(
        SUM[27]) );
  FAX1 U1_26 ( .A(A[26]), .B(B[26]), .C(carry[26]), .YC(carry[27]), .YS(
        SUM[26]) );
  FAX1 U1_25 ( .A(A[25]), .B(B[25]), .C(carry[25]), .YC(carry[26]), .YS(
        SUM[25]) );
  FAX1 U1_24 ( .A(A[24]), .B(B[24]), .C(carry[24]), .YC(carry[25]), .YS(
        SUM[24]) );
  FAX1 U1_23 ( .A(A[23]), .B(B[23]), .C(carry[23]), .YC(carry[24]), .YS(
        SUM[23]) );
  FAX1 U1_22 ( .A(A[22]), .B(B[22]), .C(carry[22]), .YC(carry[23]), .YS(
        SUM[22]) );
  FAX1 U1_21 ( .A(A[21]), .B(B[21]), .C(carry[21]), .YC(carry[22]), .YS(
        SUM[21]) );
  FAX1 U1_20 ( .A(A[20]), .B(B[20]), .C(carry[20]), .YC(carry[21]), .YS(
        SUM[20]) );
  FAX1 U1_19 ( .A(A[19]), .B(B[19]), .C(carry[19]), .YC(carry[20]), .YS(
        SUM[19]) );
  FAX1 U1_18 ( .A(A[18]), .B(B[18]), .C(carry[18]), .YC(carry[19]), .YS(
        SUM[18]) );
  FAX1 U1_17 ( .A(A[17]), .B(B[17]), .C(carry[17]), .YC(carry[18]), .YS(
        SUM[17]) );
  FAX1 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .YC(carry[17]), .YS(
        SUM[16]) );
  FAX1 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .YC(carry[16]), .YS(
        SUM[15]) );
  FAX1 U1_14 ( .A(A[14]), .B(B[14]), .C(carry[14]), .YC(carry[15]), .YS(
        SUM[14]) );
  FAX1 U1_13 ( .A(A[13]), .B(B[13]), .C(carry[13]), .YC(carry[14]), .YS(
        SUM[13]) );
  FAX1 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .YC(carry[12]), .YS(
        SUM[11]) );
  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YC(carry[11]), .YS(
        SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(carry[1]), .YC(carry[2]), .YS(SUM[1]) );
  FAX1 U1_0 ( .A(A[0]), .B(B[0]), .C(CI), .YC(carry[1]), .YS(SUM[0]) );
  XOR2X1 U1 ( .A(B[32]), .B(carry[32]), .Y(SUM[32]) );
endmodule


module ALU ( CLK, RST, A, B, CIN, OPCODE, OUT, COUT, VOUT );
  input [31:0] A;
  input [31:0] B;
  input [2:0] OPCODE;
  output [31:0] OUT;
  input CLK, RST, CIN;
  output COUT, VOUT;
  wire   N236, N237, N238, N239, N240, N241, N242, N243, N244, N245, N246,
         N247, N248, N249, N250, N251, N252, N253, N254, N255, N256, N257,
         N258, N259, N260, N261, N262, N263, N264, N265, N266, N267, N268,
         N341, N342, N343, N344, N345, N346, N347, N348, N349, N350, N351,
         N352, N353, N354, N355, N356, N357, N358, N359, N360, N361, N362,
         N363, N364, N365, N366, N367, N368, N369, N370, N371, N372, N373,
         \U3/U1/Z_0 , \U3/U1/Z_1 , \U3/U1/Z_2 , \U3/U1/Z_3 , \U3/U1/Z_4 ,
         \U3/U1/Z_5 , \U3/U1/Z_6 , \U3/U1/Z_7 , \U3/U1/Z_8 , \U3/U1/Z_9 ,
         \U3/U1/Z_10 , \U3/U1/Z_11 , \U3/U1/Z_12 , \U3/U1/Z_13 , \U3/U1/Z_14 ,
         \U3/U1/Z_15 , \U3/U1/Z_16 , \U3/U1/Z_17 , \U3/U1/Z_18 , \U3/U1/Z_19 ,
         \U3/U1/Z_20 , \U3/U1/Z_21 , \U3/U1/Z_22 , \U3/U1/Z_23 , \U3/U1/Z_24 ,
         \U3/U1/Z_25 , \U3/U1/Z_26 , \U3/U1/Z_27 , \U3/U1/Z_28 , \U3/U1/Z_29 ,
         \U3/U1/Z_30 , \U3/U1/Z_31 , n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614;

  DFFPOSX1 \OUT_reg[31]  ( .D(n318), .CLK(CLK), .Q(OUT[31]) );
  DFFPOSX1 \OUT_reg[30]  ( .D(n319), .CLK(CLK), .Q(OUT[30]) );
  DFFPOSX1 \OUT_reg[29]  ( .D(n320), .CLK(CLK), .Q(OUT[29]) );
  DFFPOSX1 \OUT_reg[28]  ( .D(n321), .CLK(CLK), .Q(OUT[28]) );
  DFFPOSX1 \OUT_reg[27]  ( .D(n322), .CLK(CLK), .Q(OUT[27]) );
  DFFPOSX1 \OUT_reg[26]  ( .D(n323), .CLK(CLK), .Q(OUT[26]) );
  DFFPOSX1 \OUT_reg[25]  ( .D(n324), .CLK(CLK), .Q(OUT[25]) );
  DFFPOSX1 \OUT_reg[24]  ( .D(n325), .CLK(CLK), .Q(OUT[24]) );
  DFFPOSX1 \OUT_reg[23]  ( .D(n326), .CLK(CLK), .Q(OUT[23]) );
  DFFPOSX1 \OUT_reg[22]  ( .D(n327), .CLK(CLK), .Q(OUT[22]) );
  DFFPOSX1 \OUT_reg[21]  ( .D(n328), .CLK(CLK), .Q(OUT[21]) );
  DFFPOSX1 \OUT_reg[20]  ( .D(n329), .CLK(CLK), .Q(OUT[20]) );
  DFFPOSX1 \OUT_reg[19]  ( .D(n330), .CLK(CLK), .Q(OUT[19]) );
  DFFPOSX1 \OUT_reg[18]  ( .D(n331), .CLK(CLK), .Q(OUT[18]) );
  DFFPOSX1 \OUT_reg[17]  ( .D(n332), .CLK(CLK), .Q(OUT[17]) );
  DFFPOSX1 \OUT_reg[16]  ( .D(n333), .CLK(CLK), .Q(OUT[16]) );
  DFFPOSX1 \OUT_reg[15]  ( .D(n334), .CLK(CLK), .Q(OUT[15]) );
  DFFPOSX1 \OUT_reg[14]  ( .D(n335), .CLK(CLK), .Q(OUT[14]) );
  DFFPOSX1 \OUT_reg[13]  ( .D(n336), .CLK(CLK), .Q(OUT[13]) );
  DFFPOSX1 \OUT_reg[12]  ( .D(n337), .CLK(CLK), .Q(OUT[12]) );
  DFFPOSX1 \OUT_reg[11]  ( .D(n338), .CLK(CLK), .Q(OUT[11]) );
  DFFPOSX1 \OUT_reg[10]  ( .D(n339), .CLK(CLK), .Q(OUT[10]) );
  DFFPOSX1 \OUT_reg[9]  ( .D(n340), .CLK(CLK), .Q(OUT[9]) );
  DFFPOSX1 \OUT_reg[8]  ( .D(n341), .CLK(CLK), .Q(OUT[8]) );
  DFFPOSX1 \OUT_reg[7]  ( .D(n343), .CLK(CLK), .Q(OUT[7]) );
  DFFPOSX1 \OUT_reg[6]  ( .D(n344), .CLK(CLK), .Q(OUT[6]) );
  DFFPOSX1 \OUT_reg[5]  ( .D(n345), .CLK(CLK), .Q(OUT[5]) );
  DFFPOSX1 \OUT_reg[4]  ( .D(n346), .CLK(CLK), .Q(OUT[4]) );
  DFFPOSX1 \OUT_reg[3]  ( .D(n347), .CLK(CLK), .Q(OUT[3]) );
  DFFPOSX1 \OUT_reg[2]  ( .D(n348), .CLK(CLK), .Q(OUT[2]) );
  DFFPOSX1 \OUT_reg[1]  ( .D(n349), .CLK(CLK), .Q(OUT[1]) );
  DFFPOSX1 \OUT_reg[0]  ( .D(n350), .CLK(CLK), .Q(OUT[0]) );
  DFFPOSX1 COUT_reg ( .D(n342), .CLK(CLK), .Q(COUT) );
  DFFPOSX1 VOUT_reg ( .D(n317), .CLK(CLK), .Q(VOUT) );
  ALU_DW01_add_0 r74 ( .A({1'b0, A}), .B({n614, \U3/U1/Z_31 , \U3/U1/Z_30 , 
        \U3/U1/Z_29 , \U3/U1/Z_28 , \U3/U1/Z_27 , \U3/U1/Z_26 , \U3/U1/Z_25 , 
        \U3/U1/Z_24 , \U3/U1/Z_23 , \U3/U1/Z_22 , \U3/U1/Z_21 , \U3/U1/Z_20 , 
        \U3/U1/Z_19 , \U3/U1/Z_18 , \U3/U1/Z_17 , \U3/U1/Z_16 , \U3/U1/Z_15 , 
        \U3/U1/Z_14 , \U3/U1/Z_13 , \U3/U1/Z_12 , \U3/U1/Z_11 , \U3/U1/Z_10 , 
        \U3/U1/Z_9 , \U3/U1/Z_8 , \U3/U1/Z_7 , \U3/U1/Z_6 , \U3/U1/Z_5 , 
        \U3/U1/Z_4 , \U3/U1/Z_3 , \U3/U1/Z_2 , \U3/U1/Z_1 , \U3/U1/Z_0 }), 
        .CI(CIN), .SUM({N268, N267, N266, N265, N264, N263, N262, N261, N260, 
        N259, N258, N257, N256, N255, N254, N253, N252, N251, N250, N249, N248, 
        N247, N246, N245, N244, N243, N242, N241, N240, N239, N238, N237, N236}) );
  OR2X1 U346 ( .A(n388), .B(n590), .Y(n432) );
  BUFX2 U347 ( .A(N372), .Y(n318) );
  BUFX2 U348 ( .A(N371), .Y(n319) );
  BUFX2 U349 ( .A(N370), .Y(n320) );
  BUFX2 U350 ( .A(N369), .Y(n321) );
  BUFX2 U351 ( .A(N368), .Y(n322) );
  BUFX2 U352 ( .A(N367), .Y(n323) );
  BUFX2 U353 ( .A(N366), .Y(n324) );
  BUFX2 U354 ( .A(N365), .Y(n325) );
  BUFX2 U355 ( .A(N364), .Y(n326) );
  BUFX2 U356 ( .A(N363), .Y(n327) );
  BUFX2 U357 ( .A(N362), .Y(n328) );
  BUFX2 U358 ( .A(N361), .Y(n329) );
  BUFX2 U359 ( .A(N360), .Y(n330) );
  BUFX2 U360 ( .A(N359), .Y(n331) );
  BUFX2 U361 ( .A(N358), .Y(n332) );
  BUFX2 U362 ( .A(N357), .Y(n333) );
  BUFX2 U363 ( .A(N356), .Y(n334) );
  BUFX2 U364 ( .A(N355), .Y(n335) );
  BUFX2 U365 ( .A(N354), .Y(n336) );
  BUFX2 U366 ( .A(N353), .Y(n337) );
  BUFX2 U367 ( .A(N352), .Y(n338) );
  BUFX2 U368 ( .A(N351), .Y(n339) );
  BUFX2 U369 ( .A(N350), .Y(n340) );
  BUFX2 U370 ( .A(N349), .Y(n341) );
  AND2X1 U371 ( .A(n360), .B(n351), .Y(N373) );
  INVX1 U372 ( .A(N373), .Y(n342) );
  AND2X1 U373 ( .A(n352), .B(n555), .Y(N348) );
  INVX1 U374 ( .A(N348), .Y(n343) );
  AND2X1 U375 ( .A(n353), .B(n559), .Y(N347) );
  INVX1 U376 ( .A(N347), .Y(n344) );
  AND2X1 U377 ( .A(n354), .B(n563), .Y(N346) );
  INVX1 U378 ( .A(N346), .Y(n345) );
  AND2X1 U379 ( .A(n355), .B(n567), .Y(N345) );
  INVX1 U380 ( .A(N345), .Y(n346) );
  AND2X1 U381 ( .A(n356), .B(n571), .Y(N344) );
  INVX1 U382 ( .A(N344), .Y(n347) );
  AND2X1 U383 ( .A(n357), .B(n575), .Y(N343) );
  INVX1 U384 ( .A(N343), .Y(n348) );
  AND2X1 U385 ( .A(n358), .B(n579), .Y(N342) );
  INVX1 U386 ( .A(N342), .Y(n349) );
  AND2X1 U387 ( .A(n359), .B(n583), .Y(N341) );
  INVX1 U388 ( .A(N341), .Y(n350) );
  BUFX2 U389 ( .A(n422), .Y(n351) );
  BUFX2 U390 ( .A(n554), .Y(n352) );
  BUFX2 U391 ( .A(n558), .Y(n353) );
  BUFX2 U392 ( .A(n562), .Y(n354) );
  BUFX2 U393 ( .A(n566), .Y(n355) );
  BUFX2 U394 ( .A(n570), .Y(n356) );
  BUFX2 U395 ( .A(n574), .Y(n357) );
  BUFX2 U396 ( .A(n578), .Y(n358) );
  BUFX2 U397 ( .A(n582), .Y(n359) );
  AND2X1 U398 ( .A(N268), .B(n390), .Y(n421) );
  INVX1 U399 ( .A(n421), .Y(n360) );
  AND2X1 U400 ( .A(N267), .B(n390), .Y(n425) );
  INVX1 U401 ( .A(n425), .Y(n361) );
  AND2X1 U402 ( .A(N266), .B(n390), .Y(n435) );
  INVX1 U403 ( .A(n435), .Y(n362) );
  AND2X1 U404 ( .A(N265), .B(n390), .Y(n440) );
  INVX1 U405 ( .A(n440), .Y(n363) );
  AND2X1 U406 ( .A(N264), .B(n390), .Y(n445) );
  INVX1 U407 ( .A(n445), .Y(n364) );
  AND2X1 U408 ( .A(N263), .B(n390), .Y(n450) );
  INVX1 U409 ( .A(n450), .Y(n365) );
  AND2X1 U410 ( .A(N262), .B(n390), .Y(n455) );
  INVX1 U411 ( .A(n455), .Y(n366) );
  AND2X1 U412 ( .A(N261), .B(n390), .Y(n460) );
  INVX1 U413 ( .A(n460), .Y(n367) );
  AND2X1 U414 ( .A(N260), .B(n390), .Y(n465) );
  INVX1 U415 ( .A(n465), .Y(n368) );
  AND2X1 U416 ( .A(N259), .B(n390), .Y(n470) );
  INVX1 U417 ( .A(n470), .Y(n369) );
  AND2X1 U418 ( .A(N258), .B(n390), .Y(n479) );
  INVX1 U419 ( .A(n479), .Y(n370) );
  AND2X1 U420 ( .A(N257), .B(n390), .Y(n484) );
  INVX1 U421 ( .A(n484), .Y(n371) );
  AND2X1 U422 ( .A(N256), .B(n390), .Y(n489) );
  INVX1 U423 ( .A(n489), .Y(n372) );
  AND2X1 U424 ( .A(N255), .B(n390), .Y(n494) );
  INVX1 U425 ( .A(n494), .Y(n373) );
  AND2X1 U426 ( .A(N254), .B(n390), .Y(n499) );
  INVX1 U427 ( .A(n499), .Y(n374) );
  AND2X1 U428 ( .A(N253), .B(n390), .Y(n504) );
  INVX1 U429 ( .A(n504), .Y(n375) );
  AND2X1 U430 ( .A(N252), .B(n390), .Y(n509) );
  INVX1 U431 ( .A(n509), .Y(n376) );
  AND2X1 U432 ( .A(N251), .B(n390), .Y(n514) );
  INVX1 U433 ( .A(n514), .Y(n377) );
  AND2X1 U434 ( .A(N250), .B(n390), .Y(n519) );
  INVX1 U435 ( .A(n519), .Y(n378) );
  AND2X1 U436 ( .A(N249), .B(n390), .Y(n524) );
  INVX1 U437 ( .A(n524), .Y(n379) );
  AND2X1 U438 ( .A(N248), .B(n390), .Y(n529) );
  INVX1 U439 ( .A(n529), .Y(n380) );
  AND2X1 U440 ( .A(N247), .B(n390), .Y(n534) );
  INVX1 U441 ( .A(n534), .Y(n381) );
  AND2X1 U442 ( .A(N246), .B(n390), .Y(n539) );
  INVX1 U443 ( .A(n539), .Y(n382) );
  AND2X1 U444 ( .A(N245), .B(n390), .Y(n544) );
  INVX1 U445 ( .A(n544), .Y(n383) );
  AND2X1 U446 ( .A(N244), .B(n390), .Y(n549) );
  INVX1 U447 ( .A(n549), .Y(n384) );
  OR2X1 U448 ( .A(RST), .B(n406), .Y(n587) );
  INVX1 U449 ( .A(n587), .Y(n385) );
  OR2X1 U450 ( .A(RST), .B(OPCODE[1]), .Y(n613) );
  INVX1 U451 ( .A(n613), .Y(n386) );
  BUFX2 U452 ( .A(n478), .Y(n387) );
  BUFX2 U453 ( .A(n434), .Y(n388) );
  INVX1 U454 ( .A(n391), .Y(n389) );
  INVX1 U455 ( .A(n389), .Y(n390) );
  BUFX2 U456 ( .A(n424), .Y(n391) );
  BUFX2 U457 ( .A(n420), .Y(n392) );
  INVX1 U458 ( .A(n395), .Y(n393) );
  INVX1 U459 ( .A(n393), .Y(n394) );
  BUFX2 U460 ( .A(n430), .Y(n395) );
  BUFX2 U461 ( .A(n411), .Y(n396) );
  BUFX2 U462 ( .A(n410), .Y(n397) );
  BUFX2 U463 ( .A(n605), .Y(n398) );
  OR2X1 U464 ( .A(B[23]), .B(B[22]), .Y(n610) );
  INVX1 U465 ( .A(n610), .Y(n399) );
  AND2X1 U466 ( .A(OPCODE[1]), .B(n585), .Y(n419) );
  INVX1 U467 ( .A(n419), .Y(n400) );
  BUFX2 U468 ( .A(n588), .Y(n401) );
  AND2X1 U469 ( .A(OUT[31]), .B(B[31]), .Y(n416) );
  INVX1 U470 ( .A(n416), .Y(n402) );
  BUFX2 U471 ( .A(n594), .Y(n403) );
  OR2X1 U472 ( .A(B[9]), .B(B[8]), .Y(n599) );
  INVX1 U473 ( .A(n599), .Y(n404) );
  AND2X1 U474 ( .A(n585), .B(n586), .Y(n474) );
  INVX1 U475 ( .A(n474), .Y(n405) );
  BUFX2 U476 ( .A(n418), .Y(n406) );
  INVX1 U477 ( .A(n432), .Y(n407) );
  INVX1 U478 ( .A(n408), .Y(n614) );
  OR2X1 U479 ( .A(RST), .B(n409), .Y(n317) );
  MUX2X1 U480 ( .B(n397), .A(n396), .S(n412), .Y(n409) );
  AOI21X1 U481 ( .A(n413), .B(n414), .C(n415), .Y(n411) );
  MUX2X1 U482 ( .B(n402), .A(n417), .S(A[31]), .Y(n415) );
  OR2X1 U483 ( .A(B[31]), .B(OUT[31]), .Y(n417) );
  INVX1 U484 ( .A(n406), .Y(n414) );
  NAND3X1 U485 ( .A(OPCODE[1]), .B(n400), .C(VOUT), .Y(n410) );
  MUX2X1 U486 ( .B(n408), .A(n392), .S(B[9]), .Y(\U3/U1/Z_9 ) );
  MUX2X1 U487 ( .B(n408), .A(n392), .S(B[8]), .Y(\U3/U1/Z_8 ) );
  MUX2X1 U488 ( .B(n408), .A(n392), .S(B[7]), .Y(\U3/U1/Z_7 ) );
  MUX2X1 U489 ( .B(n408), .A(n392), .S(B[6]), .Y(\U3/U1/Z_6 ) );
  MUX2X1 U490 ( .B(n408), .A(n392), .S(B[5]), .Y(\U3/U1/Z_5 ) );
  MUX2X1 U491 ( .B(n408), .A(n392), .S(B[4]), .Y(\U3/U1/Z_4 ) );
  MUX2X1 U492 ( .B(n408), .A(n392), .S(B[31]), .Y(\U3/U1/Z_31 ) );
  MUX2X1 U493 ( .B(n408), .A(n392), .S(B[30]), .Y(\U3/U1/Z_30 ) );
  MUX2X1 U494 ( .B(n408), .A(n392), .S(B[3]), .Y(\U3/U1/Z_3 ) );
  MUX2X1 U495 ( .B(n408), .A(n392), .S(B[29]), .Y(\U3/U1/Z_29 ) );
  MUX2X1 U496 ( .B(n408), .A(n392), .S(B[28]), .Y(\U3/U1/Z_28 ) );
  MUX2X1 U497 ( .B(n408), .A(n392), .S(B[27]), .Y(\U3/U1/Z_27 ) );
  MUX2X1 U498 ( .B(n408), .A(n392), .S(B[26]), .Y(\U3/U1/Z_26 ) );
  MUX2X1 U499 ( .B(n408), .A(n392), .S(B[25]), .Y(\U3/U1/Z_25 ) );
  MUX2X1 U500 ( .B(n408), .A(n392), .S(B[24]), .Y(\U3/U1/Z_24 ) );
  MUX2X1 U501 ( .B(n408), .A(n392), .S(B[23]), .Y(\U3/U1/Z_23 ) );
  MUX2X1 U502 ( .B(n408), .A(n392), .S(B[22]), .Y(\U3/U1/Z_22 ) );
  MUX2X1 U503 ( .B(n408), .A(n392), .S(B[21]), .Y(\U3/U1/Z_21 ) );
  MUX2X1 U504 ( .B(n408), .A(n392), .S(B[20]), .Y(\U3/U1/Z_20 ) );
  MUX2X1 U505 ( .B(n408), .A(n392), .S(B[2]), .Y(\U3/U1/Z_2 ) );
  MUX2X1 U506 ( .B(n408), .A(n392), .S(B[19]), .Y(\U3/U1/Z_19 ) );
  MUX2X1 U507 ( .B(n408), .A(n392), .S(B[18]), .Y(\U3/U1/Z_18 ) );
  MUX2X1 U508 ( .B(n408), .A(n392), .S(B[17]), .Y(\U3/U1/Z_17 ) );
  MUX2X1 U509 ( .B(n408), .A(n392), .S(B[16]), .Y(\U3/U1/Z_16 ) );
  MUX2X1 U510 ( .B(n408), .A(n392), .S(B[15]), .Y(\U3/U1/Z_15 ) );
  MUX2X1 U511 ( .B(n408), .A(n392), .S(B[14]), .Y(\U3/U1/Z_14 ) );
  MUX2X1 U512 ( .B(n408), .A(n392), .S(B[13]), .Y(\U3/U1/Z_13 ) );
  MUX2X1 U513 ( .B(n408), .A(n392), .S(B[12]), .Y(\U3/U1/Z_12 ) );
  MUX2X1 U514 ( .B(n408), .A(n392), .S(B[11]), .Y(\U3/U1/Z_11 ) );
  MUX2X1 U515 ( .B(n408), .A(n392), .S(B[10]), .Y(\U3/U1/Z_10 ) );
  MUX2X1 U516 ( .B(n408), .A(n392), .S(B[1]), .Y(\U3/U1/Z_1 ) );
  MUX2X1 U517 ( .B(n408), .A(n392), .S(B[0]), .Y(\U3/U1/Z_0 ) );
  NAND3X1 U518 ( .A(OPCODE[1]), .B(n423), .C(n474), .Y(n422) );
  NAND3X1 U519 ( .A(n361), .B(n426), .C(n427), .Y(N372) );
  MUX2X1 U520 ( .B(n428), .A(n429), .S(A[31]), .Y(n427) );
  OAI21X1 U521 ( .A(B[31]), .B(n394), .C(n431), .Y(n429) );
  OAI21X1 U522 ( .A(n407), .B(n433), .C(B[31]), .Y(n426) );
  MUX2X1 U523 ( .B(n394), .A(n388), .S(A[31]), .Y(n433) );
  NAND3X1 U524 ( .A(n362), .B(n436), .C(n437), .Y(N371) );
  MUX2X1 U525 ( .B(n428), .A(n438), .S(A[30]), .Y(n437) );
  OAI21X1 U526 ( .A(B[30]), .B(n394), .C(n431), .Y(n438) );
  OAI21X1 U527 ( .A(n407), .B(n439), .C(B[30]), .Y(n436) );
  MUX2X1 U528 ( .B(n394), .A(n388), .S(A[30]), .Y(n439) );
  NAND3X1 U529 ( .A(n363), .B(n441), .C(n442), .Y(N370) );
  MUX2X1 U530 ( .B(n428), .A(n443), .S(A[29]), .Y(n442) );
  OAI21X1 U531 ( .A(B[29]), .B(n394), .C(n431), .Y(n443) );
  OAI21X1 U532 ( .A(n407), .B(n444), .C(B[29]), .Y(n441) );
  MUX2X1 U533 ( .B(n394), .A(n388), .S(A[29]), .Y(n444) );
  NAND3X1 U534 ( .A(n364), .B(n446), .C(n447), .Y(N369) );
  MUX2X1 U535 ( .B(n428), .A(n448), .S(A[28]), .Y(n447) );
  OAI21X1 U536 ( .A(B[28]), .B(n394), .C(n431), .Y(n448) );
  OAI21X1 U537 ( .A(n407), .B(n449), .C(B[28]), .Y(n446) );
  MUX2X1 U538 ( .B(n394), .A(n388), .S(A[28]), .Y(n449) );
  NAND3X1 U539 ( .A(n365), .B(n451), .C(n452), .Y(N368) );
  MUX2X1 U540 ( .B(n428), .A(n453), .S(A[27]), .Y(n452) );
  OAI21X1 U541 ( .A(B[27]), .B(n394), .C(n431), .Y(n453) );
  OAI21X1 U542 ( .A(n407), .B(n454), .C(B[27]), .Y(n451) );
  MUX2X1 U543 ( .B(n394), .A(n388), .S(A[27]), .Y(n454) );
  NAND3X1 U544 ( .A(n366), .B(n456), .C(n457), .Y(N367) );
  MUX2X1 U545 ( .B(n428), .A(n458), .S(A[26]), .Y(n457) );
  OAI21X1 U546 ( .A(B[26]), .B(n394), .C(n431), .Y(n458) );
  OAI21X1 U547 ( .A(n407), .B(n459), .C(B[26]), .Y(n456) );
  MUX2X1 U548 ( .B(n394), .A(n388), .S(A[26]), .Y(n459) );
  NAND3X1 U549 ( .A(n367), .B(n461), .C(n462), .Y(N366) );
  MUX2X1 U550 ( .B(n428), .A(n463), .S(A[25]), .Y(n462) );
  OAI21X1 U551 ( .A(B[25]), .B(n394), .C(n431), .Y(n463) );
  OAI21X1 U552 ( .A(n407), .B(n464), .C(B[25]), .Y(n461) );
  MUX2X1 U553 ( .B(n394), .A(n388), .S(A[25]), .Y(n464) );
  NAND3X1 U554 ( .A(n368), .B(n466), .C(n467), .Y(N365) );
  MUX2X1 U555 ( .B(n428), .A(n468), .S(A[24]), .Y(n467) );
  OAI21X1 U556 ( .A(B[24]), .B(n394), .C(n431), .Y(n468) );
  OAI21X1 U557 ( .A(n407), .B(n469), .C(B[24]), .Y(n466) );
  MUX2X1 U558 ( .B(n394), .A(n388), .S(A[24]), .Y(n469) );
  NAND3X1 U559 ( .A(n369), .B(n432), .C(n471), .Y(N364) );
  MUX2X1 U560 ( .B(n472), .A(n473), .S(A[23]), .Y(n471) );
  OAI21X1 U561 ( .A(RST), .B(n405), .C(n475), .Y(n473) );
  INVX1 U562 ( .A(n476), .Y(n475) );
  MUX2X1 U563 ( .B(n394), .A(n388), .S(B[23]), .Y(n476) );
  OAI21X1 U564 ( .A(n477), .B(n394), .C(n387), .Y(n472) );
  INVX1 U565 ( .A(B[23]), .Y(n477) );
  NAND3X1 U566 ( .A(n370), .B(n480), .C(n481), .Y(N363) );
  MUX2X1 U567 ( .B(n428), .A(n482), .S(A[22]), .Y(n481) );
  OAI21X1 U568 ( .A(B[22]), .B(n394), .C(n431), .Y(n482) );
  OAI21X1 U569 ( .A(n407), .B(n483), .C(B[22]), .Y(n480) );
  MUX2X1 U570 ( .B(n394), .A(n388), .S(A[22]), .Y(n483) );
  NAND3X1 U571 ( .A(n371), .B(n485), .C(n486), .Y(N362) );
  MUX2X1 U572 ( .B(n428), .A(n487), .S(A[21]), .Y(n486) );
  OAI21X1 U573 ( .A(B[21]), .B(n394), .C(n431), .Y(n487) );
  OAI21X1 U574 ( .A(n407), .B(n488), .C(B[21]), .Y(n485) );
  MUX2X1 U575 ( .B(n394), .A(n388), .S(A[21]), .Y(n488) );
  NAND3X1 U576 ( .A(n372), .B(n490), .C(n491), .Y(N361) );
  MUX2X1 U577 ( .B(n428), .A(n492), .S(A[20]), .Y(n491) );
  OAI21X1 U578 ( .A(B[20]), .B(n394), .C(n431), .Y(n492) );
  OAI21X1 U579 ( .A(n407), .B(n493), .C(B[20]), .Y(n490) );
  MUX2X1 U580 ( .B(n394), .A(n388), .S(A[20]), .Y(n493) );
  NAND3X1 U581 ( .A(n373), .B(n495), .C(n496), .Y(N360) );
  MUX2X1 U582 ( .B(n428), .A(n497), .S(A[19]), .Y(n496) );
  OAI21X1 U583 ( .A(B[19]), .B(n394), .C(n431), .Y(n497) );
  OAI21X1 U584 ( .A(n407), .B(n498), .C(B[19]), .Y(n495) );
  MUX2X1 U585 ( .B(n394), .A(n388), .S(A[19]), .Y(n498) );
  NAND3X1 U586 ( .A(n374), .B(n500), .C(n501), .Y(N359) );
  MUX2X1 U587 ( .B(n428), .A(n502), .S(A[18]), .Y(n501) );
  OAI21X1 U588 ( .A(B[18]), .B(n394), .C(n431), .Y(n502) );
  OAI21X1 U589 ( .A(n407), .B(n503), .C(B[18]), .Y(n500) );
  MUX2X1 U590 ( .B(n394), .A(n388), .S(A[18]), .Y(n503) );
  NAND3X1 U591 ( .A(n375), .B(n505), .C(n506), .Y(N358) );
  MUX2X1 U592 ( .B(n428), .A(n507), .S(A[17]), .Y(n506) );
  OAI21X1 U593 ( .A(B[17]), .B(n394), .C(n431), .Y(n507) );
  OAI21X1 U594 ( .A(n407), .B(n508), .C(B[17]), .Y(n505) );
  MUX2X1 U595 ( .B(n394), .A(n388), .S(A[17]), .Y(n508) );
  NAND3X1 U596 ( .A(n376), .B(n510), .C(n511), .Y(N357) );
  MUX2X1 U597 ( .B(n428), .A(n512), .S(A[16]), .Y(n511) );
  OAI21X1 U598 ( .A(B[16]), .B(n394), .C(n431), .Y(n512) );
  OAI21X1 U599 ( .A(n407), .B(n513), .C(B[16]), .Y(n510) );
  MUX2X1 U600 ( .B(n394), .A(n388), .S(A[16]), .Y(n513) );
  NAND3X1 U601 ( .A(n377), .B(n515), .C(n516), .Y(N356) );
  MUX2X1 U602 ( .B(n428), .A(n517), .S(A[15]), .Y(n516) );
  OAI21X1 U603 ( .A(B[15]), .B(n394), .C(n431), .Y(n517) );
  OAI21X1 U604 ( .A(n407), .B(n518), .C(B[15]), .Y(n515) );
  MUX2X1 U605 ( .B(n394), .A(n388), .S(A[15]), .Y(n518) );
  NAND3X1 U606 ( .A(n378), .B(n520), .C(n521), .Y(N355) );
  MUX2X1 U607 ( .B(n428), .A(n522), .S(A[14]), .Y(n521) );
  OAI21X1 U608 ( .A(B[14]), .B(n394), .C(n431), .Y(n522) );
  OAI21X1 U609 ( .A(n407), .B(n523), .C(B[14]), .Y(n520) );
  MUX2X1 U610 ( .B(n394), .A(n388), .S(A[14]), .Y(n523) );
  NAND3X1 U611 ( .A(n379), .B(n525), .C(n526), .Y(N354) );
  MUX2X1 U612 ( .B(n428), .A(n527), .S(A[13]), .Y(n526) );
  OAI21X1 U613 ( .A(B[13]), .B(n394), .C(n431), .Y(n527) );
  OAI21X1 U614 ( .A(n407), .B(n528), .C(B[13]), .Y(n525) );
  MUX2X1 U615 ( .B(n394), .A(n388), .S(A[13]), .Y(n528) );
  NAND3X1 U616 ( .A(n380), .B(n530), .C(n531), .Y(N353) );
  MUX2X1 U617 ( .B(n428), .A(n532), .S(A[12]), .Y(n531) );
  OAI21X1 U618 ( .A(B[12]), .B(n394), .C(n431), .Y(n532) );
  OAI21X1 U619 ( .A(n407), .B(n533), .C(B[12]), .Y(n530) );
  MUX2X1 U620 ( .B(n394), .A(n388), .S(A[12]), .Y(n533) );
  NAND3X1 U621 ( .A(n381), .B(n535), .C(n536), .Y(N352) );
  MUX2X1 U622 ( .B(n428), .A(n537), .S(A[11]), .Y(n536) );
  OAI21X1 U623 ( .A(B[11]), .B(n394), .C(n431), .Y(n537) );
  OAI21X1 U624 ( .A(n407), .B(n538), .C(B[11]), .Y(n535) );
  MUX2X1 U625 ( .B(n394), .A(n388), .S(A[11]), .Y(n538) );
  NAND3X1 U626 ( .A(n382), .B(n540), .C(n541), .Y(N351) );
  MUX2X1 U627 ( .B(n428), .A(n542), .S(A[10]), .Y(n541) );
  OAI21X1 U628 ( .A(B[10]), .B(n394), .C(n431), .Y(n542) );
  OAI21X1 U629 ( .A(n407), .B(n543), .C(B[10]), .Y(n540) );
  MUX2X1 U630 ( .B(n394), .A(n388), .S(A[10]), .Y(n543) );
  NAND3X1 U631 ( .A(n383), .B(n545), .C(n546), .Y(N350) );
  MUX2X1 U632 ( .B(n428), .A(n547), .S(A[9]), .Y(n546) );
  OAI21X1 U633 ( .A(B[9]), .B(n394), .C(n431), .Y(n547) );
  OAI21X1 U634 ( .A(n407), .B(n548), .C(B[9]), .Y(n545) );
  MUX2X1 U635 ( .B(n394), .A(n388), .S(A[9]), .Y(n548) );
  NAND3X1 U636 ( .A(n384), .B(n550), .C(n551), .Y(N349) );
  MUX2X1 U637 ( .B(n428), .A(n552), .S(A[8]), .Y(n551) );
  OAI21X1 U638 ( .A(B[8]), .B(n394), .C(n431), .Y(n552) );
  OAI21X1 U639 ( .A(n407), .B(n553), .C(B[8]), .Y(n550) );
  MUX2X1 U640 ( .B(n394), .A(n388), .S(A[8]), .Y(n553) );
  MUX2X1 U641 ( .B(n428), .A(n556), .S(A[7]), .Y(n555) );
  OAI21X1 U642 ( .A(B[7]), .B(n394), .C(n431), .Y(n556) );
  AOI22X1 U643 ( .A(B[7]), .B(n557), .C(N243), .D(n390), .Y(n554) );
  OAI21X1 U644 ( .A(A[7]), .B(n394), .C(n432), .Y(n557) );
  MUX2X1 U645 ( .B(n428), .A(n560), .S(A[6]), .Y(n559) );
  OAI21X1 U646 ( .A(B[6]), .B(n394), .C(n431), .Y(n560) );
  AOI22X1 U647 ( .A(B[6]), .B(n561), .C(N242), .D(n390), .Y(n558) );
  OAI21X1 U648 ( .A(A[6]), .B(n394), .C(n432), .Y(n561) );
  MUX2X1 U649 ( .B(n428), .A(n564), .S(A[5]), .Y(n563) );
  OAI21X1 U650 ( .A(B[5]), .B(n394), .C(n431), .Y(n564) );
  AOI22X1 U651 ( .A(B[5]), .B(n565), .C(N241), .D(n390), .Y(n562) );
  OAI21X1 U652 ( .A(A[5]), .B(n394), .C(n432), .Y(n565) );
  MUX2X1 U653 ( .B(n428), .A(n568), .S(A[4]), .Y(n567) );
  OAI21X1 U654 ( .A(B[4]), .B(n394), .C(n431), .Y(n568) );
  AOI22X1 U655 ( .A(B[4]), .B(n569), .C(N240), .D(n390), .Y(n566) );
  OAI21X1 U656 ( .A(A[4]), .B(n394), .C(n432), .Y(n569) );
  MUX2X1 U657 ( .B(n428), .A(n572), .S(A[3]), .Y(n571) );
  OAI21X1 U658 ( .A(B[3]), .B(n394), .C(n431), .Y(n572) );
  AOI22X1 U659 ( .A(B[3]), .B(n573), .C(N239), .D(n390), .Y(n570) );
  OAI21X1 U660 ( .A(A[3]), .B(n394), .C(n432), .Y(n573) );
  MUX2X1 U661 ( .B(n428), .A(n576), .S(A[2]), .Y(n575) );
  OAI21X1 U662 ( .A(B[2]), .B(n394), .C(n431), .Y(n576) );
  AOI22X1 U663 ( .A(B[2]), .B(n577), .C(N238), .D(n390), .Y(n574) );
  OAI21X1 U664 ( .A(A[2]), .B(n394), .C(n432), .Y(n577) );
  MUX2X1 U665 ( .B(n428), .A(n580), .S(A[1]), .Y(n579) );
  OAI21X1 U666 ( .A(B[1]), .B(n394), .C(n431), .Y(n580) );
  AOI22X1 U667 ( .A(B[1]), .B(n581), .C(N237), .D(n390), .Y(n578) );
  OAI21X1 U668 ( .A(A[1]), .B(n394), .C(n432), .Y(n581) );
  MUX2X1 U669 ( .B(n428), .A(n584), .S(A[0]), .Y(n583) );
  OAI21X1 U670 ( .A(B[0]), .B(n394), .C(n431), .Y(n584) );
  OAI21X1 U671 ( .A(n474), .B(n419), .C(n423), .Y(n431) );
  INVX1 U672 ( .A(n387), .Y(n428) );
  NAND3X1 U673 ( .A(n412), .B(n413), .C(n385), .Y(n478) );
  INVX1 U674 ( .A(n401), .Y(n413) );
  AOI22X1 U675 ( .A(B[0]), .B(n589), .C(N236), .D(n390), .Y(n582) );
  AOI21X1 U676 ( .A(n408), .B(n392), .C(RST), .Y(n424) );
  NAND3X1 U677 ( .A(OPCODE[2]), .B(n590), .C(OPCODE[0]), .Y(n420) );
  OAI21X1 U678 ( .A(n406), .B(n401), .C(n412), .Y(n408) );
  NOR3X1 U679 ( .A(n590), .B(OPCODE[0]), .C(n585), .Y(n412) );
  NAND3X1 U680 ( .A(n591), .B(n592), .C(n593), .Y(n588) );
  NOR3X1 U681 ( .A(n403), .B(n595), .C(n596), .Y(n593) );
  OR2X1 U682 ( .A(B[31]), .B(B[3]), .Y(n596) );
  OR2X1 U683 ( .A(B[4]), .B(B[5]), .Y(n595) );
  NAND3X1 U684 ( .A(n597), .B(n598), .C(n404), .Y(n594) );
  INVX1 U685 ( .A(B[7]), .Y(n598) );
  INVX1 U686 ( .A(B[6]), .Y(n597) );
  NOR3X1 U687 ( .A(n600), .B(B[29]), .C(B[28]), .Y(n592) );
  OR2X1 U688 ( .A(B[2]), .B(B[30]), .Y(n600) );
  NOR3X1 U689 ( .A(n601), .B(B[25]), .C(B[24]), .Y(n591) );
  OR2X1 U690 ( .A(B[26]), .B(B[27]), .Y(n601) );
  NAND3X1 U691 ( .A(n602), .B(n603), .C(n604), .Y(n418) );
  NOR3X1 U692 ( .A(n398), .B(n606), .C(n607), .Y(n604) );
  OR2X1 U693 ( .A(B[17]), .B(B[18]), .Y(n607) );
  OR2X1 U694 ( .A(B[19]), .B(B[1]), .Y(n606) );
  NAND3X1 U695 ( .A(n608), .B(n609), .C(n399), .Y(n605) );
  INVX1 U696 ( .A(B[21]), .Y(n609) );
  INVX1 U697 ( .A(B[20]), .Y(n608) );
  NOR3X1 U698 ( .A(n611), .B(B[14]), .C(B[13]), .Y(n603) );
  OR2X1 U699 ( .A(B[15]), .B(B[16]), .Y(n611) );
  NOR3X1 U700 ( .A(n612), .B(B[10]), .C(B[0]), .Y(n602) );
  OR2X1 U701 ( .A(B[11]), .B(B[12]), .Y(n612) );
  OAI21X1 U702 ( .A(A[0]), .B(n394), .C(n432), .Y(n589) );
  INVX1 U703 ( .A(OPCODE[1]), .Y(n590) );
  NAND3X1 U704 ( .A(n585), .B(n423), .C(OPCODE[0]), .Y(n434) );
  INVX1 U705 ( .A(RST), .Y(n423) );
  INVX1 U706 ( .A(OPCODE[2]), .Y(n585) );
  NAND3X1 U707 ( .A(OPCODE[2]), .B(n586), .C(n386), .Y(n430) );
  INVX1 U708 ( .A(OPCODE[0]), .Y(n586) );
endmodule

