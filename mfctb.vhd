--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10/24/2016
-- Design Name:   
-- Module Name:   mfctb.vhd
-- Project Name:  MFC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  It is recommended
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mfctb IS
END mfctb;
 
ARCHITECTURE behavior OF mfctb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mfc
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         si : IN  std_logic;
         lh : IN  std_logic;
         f : OUT  std_logic_vector(3 downto 0);
         so : OUT  std_logic
        );
    END COMPONENT;
    

--Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');
   signal si : std_logic := '0';
   signal lh : std_logic := '0';

--Outputs
   signal f : std_logic_vector(3 downto 0);
   signal so : std_logic;
 
BEGIN
 
-- Instantiate the Unit Under Test (UUT)
   uut: mfc PORT MAP (
          a => a,
          b => b,
          sel => sel,
          si => si,
          lh => lh,
          f => f,
          so => so
        );

-- Stimulus process
   stim_proc: process
   begin		
-- hold reset state for 100 ns.
      wait for 100 ns;	


-- AND function		
		a <= "0110"; b <= "0101"; si <= '0'; sel <= "000"; lh <= '1';
      wait for 100 ns;

-- OR function		
		a <= "0101"; b <= "0011"; si <= '0'; sel <= "001"; lh <= '0';
      wait for 100 ns;

-- XOR function		
		a <= "1010"; b <= "1100"; si <= '1'; sel <= "010"; lh <= '0';
      wait for 100 ns;
		
-- ADD function
		a <= "0000"; b <= "1111"; si <= '0'; sel <= "011"; lh <= '0';
      wait for 100 ns;
		a <= "0101"; b <= "1010"; si <= '0'; sel <= "011"; lh <= '1';
      wait for 100 ns;
		a <= "1111"; b <= "0000"; si <= '1'; sel <= "011"; lh <= '0';
      wait for 100 ns;
		a <= "1010"; b <= "0101"; si <= '1'; sel <= "011"; lh <= '1';
      wait for 100 ns;

-- SUB function
		a <= "1111"; b <= "1111"; si <= '0'; sel <= "100"; lh <= '0';
      wait for 100 ns;
		a <= "1010"; b <= "0101"; si <= '0'; sel <= "100"; lh <= '1';
      wait for 100 ns;
		a <= "0101"; b <= "1010"; si <= '1'; sel <= "100"; lh <= '0';
      wait for 100 ns;
		a <= "0000"; b <= "0000"; si <= '1'; sel <= "100"; lh <= '1';
      wait for 100 ns;

-- Shift Right function		
		a <= "1100"; b <= "0000"; si <= '0'; sel <= "101"; lh <= '0';
      wait for 100 ns;	
		a <= "0110"; b <= "0101"; si <= '1'; sel <= "101"; lh <= '0';
      wait for 100 ns;
		a <= "0011"; b <= "1010"; si <= '1'; sel <= "101"; lh <= '1';
      wait for 100 ns;
		a <= "1010"; b <= "1111"; si <= '0'; sel <= "101"; lh <= '1';
      wait for 100 ns;

-- Shift Left function		
		a <= "0011"; b <= "0000"; si <= '0'; sel <= "110"; lh <= '0';
      wait for 100 ns;
		a <= "0110"; b <= "0101"; si <= '1'; sel <= "110"; lh <= '0';
      wait for 100 ns;
		a <= "1100"; b <= "1010"; si <= '1'; sel <= "110"; lh <= '1';
      wait for 100 ns;
		a <= "0101"; b <= "1111"; si <= '0'; sel <= "110"; lh <= '1';
      wait for 100 ns;

-- MUL function
		a <= "1010"; b <= "0001"; si <= '0'; sel <= "111"; lh <= '0';
      wait for 100 ns;
		a <= "0001"; b <= "1010"; si <= '0'; sel <= "111"; lh <= '1';
      wait for 100 ns;
		a <= "0101"; b <= "0001"; si <= '0'; sel <= "111"; lh <= '0';
      wait for 100 ns;
		a <= "0001"; b <= "0101"; si <= '0'; sel <= "111"; lh <= '1';
      wait for 100 ns;
		a <= "1010"; b <= "0101"; si <= '1'; sel <= "111"; lh <= '0';
      wait for 100 ns;
		a <= "0101"; b <= "1010"; si <= '1'; sel <= "111"; lh <= '1';
      wait for 100 ns;
		a <= "1111"; b <= "1111"; si <= '1'; sel <= "111"; lh <= '0';
      wait for 100 ns;
		a <= "1111"; b <= "1111"; si <= '1'; sel <= "111"; lh <= '1';
      wait for 100 ns;
		a <= "0000"; b <= "0000"; si <= '0'; sel <= "111"; lh <= '0';
      wait for 100 ns;
		a <= "0000"; b <= "0000"; si <= '0'; sel <= "111"; lh <= '1';
      wait for 100 ns;

		wait;
   end process;

END;
