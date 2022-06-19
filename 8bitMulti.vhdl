declare BUS A_IN(7 : 0), B_IN(7 : 0), STB_IN;
declare BUS Y_OUT(14 : 0), STB_OUT, RDY;
declare REGISTER P(15 : 0), B(7 : 0), I(1 : 0);

RESET : P(15 : 11) <- 0, I <- 0,
P(7 : 0) <- A_IN, B <- B_IN,
RDY <- 1,
IF STB_IN = 0 THEN
    goto RESET fi;
    LOOP : IF P(0) = 0 THEN
        goto CONT fi;
        P(8 : 4) <- P(8 : 4) + B;
        CONT : P(7 : 0) <- P(8 : 1), P(8) <- 0,
        I <- I + 1;
        IF I <> 0 THEN
            goto LOOP fi;
            DONE : Y_OUT <- P(7 : 0), STB_OUT <- 1,
            goto RESET;