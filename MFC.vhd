library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---------------------------------------------------
-- A = 4-bit input
-- B = 4-bit input
-- LH = 1-bit input (I have no idea what this means yet)
-- SI = carry or borrow in
-- SO = carry or borrow out (default assignment = 0)
-- F = 4-bit output (or 8, in case of multiplication)
-- SEL = 3-bit select function
-- -- 000 -> F = A and B
-- -- 001 -> F = A or B
-- -- 010 -> F = A xor B
-- -- 011 -> F = A + B + SI; SO = carry-out digit
-- -- 100 -> F = A - B - SI; SO = borrow-out digit
-- -- 101 -> F = A shifted right; SO = A(0); F(3) =  A(0) if LH = 1 else SI
-- -- 110 -> F = A shifted left; SO = A(3); F(0) = A(3) if LH = 1 else SI
-- -- 111 -> F = A*B. Will be least significant if LH = 0, else will be most significant
-- & = concatenation operator
---------------------------------------------------

entity MFC is
    port (A, B: in std_logic_vector(3 downto 0);
    SEL: in std_logic_vector(2 downto 0);
    SI: in std_logic;
    LH: in std_logic;
    F: out std_logic_vector(3 downto 0);
    SO: out std_logic);
end MFC;

architecture Behavioral of MFC is
    signal tsum, tdif: std_logic_vector(4 downto 0);
    signal prod: std_logic_vector(7 downto 0);
    signal hsel: std_logic_vector(3 downto 0);

begin
    -- Expand A and B by 1 bit, expand SI by 4, assign sum
    tsum <= ('0' & A) + ('0' & B) + ("0000" & SI);

    -- Expand A and B by 1 bit, expand SI by 4, assign difference
    tdif <= ('0' & A) - ('0' & B) - ("0000" & SI);

    -- Assign product
    prod <= A * B;

    -- Assign hsel (LH concatenated SEL)
    hsel <= LH & SEL;

    -- Assign F
    F <= A and B                when hsel(2 downto 0) = "000"  else
         A or B                 when hsel(2 downto 0) = "001"  else
         A xor B                when hsel(2 downto 0) = "010"  else
         tsum(3 downto 0)       when hsel(2 downto 0) = "011"  else
         tdif(3 downto 0)       when hsel(2 downto 0) = "100"  else
         (A(0) & A(3 downto 1)) when hsel             = "1101" else
         (SI & A(3 downto 1))   when hsel             = "0101" else
         (A(2 downto 0) & A(3)) when hsel             = "1110" else
         (A(2 downto 0) & SI)   when hsel             = "0110" else
         prod(3 downto 0)       when hsel             = "0111" else
         prod(7 downto 4)       when hsel             = "1111" else
         "0000";

    -- Assign SO
    SO <= tsum(4) when hsel(2 downto 0) = "011" else
          tdif(4) when hsel(2 downto 0) = "100" else
          A(0)    when hsel(2 downto 0) = "101" else
          A(3)    when hsel(2 downto 0) = "110" else
          '0';
end Behavioral;
