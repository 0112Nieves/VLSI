-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/29/2025 16:45:57"
                                                                        
-- Vhdl Self-Checking Test Bench (with test vectors) for design :       My_ckt_1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

LIBRARY STD;                                                            
USE STD.textio.ALL;                                                     

PACKAGE My_ckt_1_vhd_tb_types IS
-- input port types                                                       
-- output port names                                                     
CONSTANT Y_name : STRING (1 TO 1) := "Y";
-- n(outputs)                                                            
CONSTANT o_num : INTEGER := 1;
-- mismatches vector type                                                
TYPE mmvec IS ARRAY (0 to (o_num - 1)) OF INTEGER;
-- exp o/ first change track vector type                                     
TYPE trackvec IS ARRAY (1 to o_num) OF BIT;
-- sampler type                                                            
SUBTYPE sample_type IS STD_LOGIC;                                          
-- utility functions                                                     
FUNCTION std_logic_to_char (a: STD_LOGIC) RETURN CHARACTER;              
FUNCTION std_logic_vector_to_string (a: STD_LOGIC_VECTOR) RETURN STRING; 
PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC; justified: IN SIDE:= RIGHT; field:IN WIDTH:=0);                                               
PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC_VECTOR; justified: IN SIDE:= RIGHT; field:IN WIDTH:=0);                                        
PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC; real_value : IN STD_LOGIC);                                   
PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC_VECTOR; real_value : IN STD_LOGIC_VECTOR);                     

END My_ckt_1_vhd_tb_types;

PACKAGE BODY My_ckt_1_vhd_tb_types IS
        FUNCTION std_logic_to_char (a: STD_LOGIC)  
                RETURN CHARACTER IS                
        BEGIN                                      
        CASE a IS                                  
         WHEN 'U' =>                               
          RETURN 'U';                              
         WHEN 'X' =>                               
          RETURN 'X';                              
         WHEN '0' =>                               
          RETURN '0';                              
         WHEN '1' =>                               
          RETURN '1';                              
         WHEN 'Z' =>                               
          RETURN 'Z';                              
         WHEN 'W' =>                               
          RETURN 'W';                              
         WHEN 'L' =>                               
          RETURN 'L';                              
         WHEN 'H' =>                               
          RETURN 'H';                              
         WHEN '-' =>                               
          RETURN 'D';                              
        END CASE;                                  
        END;                                       

        FUNCTION std_logic_vector_to_string (a: STD_LOGIC_VECTOR)       
                RETURN STRING IS                                        
        VARIABLE result : STRING(1 TO a'LENGTH);                        
        VARIABLE j : NATURAL := 1;                                      
        BEGIN                                                           
                FOR i IN a'RANGE LOOP                                   
                        result(j) := std_logic_to_char(a(i));           
                        j := j + 1;                                     
                END LOOP;                                               
                RETURN result;                                          
        END;                                                            

        PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC; justified: IN SIDE:=RIGHT; field:IN WIDTH:=0) IS 
        BEGIN                                                           
                write(L,std_logic_to_char(VALUE),JUSTIFIED,field);      
        END;                                                            
                                                                        
        PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC_VECTOR; justified: IN SIDE:= RIGHT; field:IN WIDTH:=0) IS                           
        BEGIN                                                               
                write(L,std_logic_vector_to_string(VALUE),JUSTIFIED,field); 
        END;                                                                

        PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC; real_value : IN STD_LOGIC) IS                               
        VARIABLE txt : LINE;                                              
        BEGIN                                                             
        write(txt,string'("ERROR! Vector Mismatch for output port "));  
        write(txt,output_port_name);                                      
        write(txt,string'(" :: @time = "));                             
        write(txt,NOW);                                                   
		writeline(output,txt);                                            
        write(txt,string'("     Expected value = "));                   
        write(txt,expected_value);                                        
		writeline(output,txt);                                            
        write(txt,string'("     Real value = "));                       
        write(txt,real_value);                                            
        writeline(output,txt);                                            
        END;                                                              

        PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC_VECTOR; real_value : IN STD_LOGIC_VECTOR) IS                 
        VARIABLE txt : LINE;                                              
        BEGIN                                                             
        write(txt,string'("ERROR! Vector Mismatch for output port "));  
        write(txt,output_port_name);                                      
        write(txt,string'(" :: @time = "));                             
        write(txt,NOW);                                                   
		writeline(output,txt);                                            
        write(txt,string'("     Expected value = "));                   
        write(txt,expected_value);                                        
		writeline(output,txt);                                            
        write(txt,string'("     Real value = "));                       
        write(txt,real_value);                                            
        writeline(output,txt);                                            
        END;                                                              

END My_ckt_1_vhd_tb_types;

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

USE WORK.My_ckt_1_vhd_tb_types.ALL;                                         

ENTITY My_ckt_1_vhd_sample_tst IS
PORT (
	A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	sampler : OUT sample_type
	);
END My_ckt_1_vhd_sample_tst;

ARCHITECTURE sample_arch OF My_ckt_1_vhd_sample_tst IS
SIGNAL tbo_int_sample_clk : sample_type := '-';
SIGNAL current_time : TIME := 0 ps;
BEGIN
t_prcs_sample : PROCESS ( A , B , S )
BEGIN
	IF (NOW > 0 ps) THEN
		IF (NOW > 0 ps) AND (NOW /= current_time) THEN
			IF (tbo_int_sample_clk = '-') THEN
				tbo_int_sample_clk <= '0';
			ELSE
				tbo_int_sample_clk <= NOT tbo_int_sample_clk ;
			END IF;
		END IF;
		current_time <= NOW;
	END IF;
END PROCESS t_prcs_sample;
sampler <= tbo_int_sample_clk;
END sample_arch;

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

LIBRARY STD;                                                            
USE STD.textio.ALL;                                                     

USE WORK.My_ckt_1_vhd_tb_types.ALL;                                         

ENTITY My_ckt_1_vhd_check_tst IS 
GENERIC (
	debug_tbench : BIT := '0'
);
PORT ( 
	Y : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	sampler : IN sample_type
);
END My_ckt_1_vhd_check_tst;
ARCHITECTURE ovec_arch OF My_ckt_1_vhd_check_tst IS
SIGNAL Y_expected,Y_expected_prev,Y_prev : STD_LOGIC_VECTOR(15 DOWNTO 0);

SIGNAL trigger : BIT := '0';
SIGNAL trigger_e : BIT := '0';
SIGNAL trigger_r : BIT := '0';
SIGNAL trigger_i : BIT := '0';
SIGNAL num_mismatches : mmvec := (OTHERS => 0);

BEGIN

-- Update history buffers  expected /o
t_prcs_update_o_expected_hist : PROCESS (trigger) 
BEGIN
	Y_expected_prev <= Y_expected;
END PROCESS t_prcs_update_o_expected_hist;


-- Update history buffers  real /o
t_prcs_update_o_real_hist : PROCESS (trigger) 
BEGIN
	Y_prev <= Y;
END PROCESS t_prcs_update_o_real_hist;


-- expected Y[15]
t_prcs_Y_15: PROCESS
BEGIN
	Y_expected(15) <= '0';
WAIT;
END PROCESS t_prcs_Y_15;
-- expected Y[14]
t_prcs_Y_14: PROCESS
BEGIN
	Y_expected(14) <= '0';
WAIT;
END PROCESS t_prcs_Y_14;
-- expected Y[13]
t_prcs_Y_13: PROCESS
BEGIN
	Y_expected(13) <= '0';
WAIT;
END PROCESS t_prcs_Y_13;
-- expected Y[12]
t_prcs_Y_12: PROCESS
BEGIN
	Y_expected(12) <= '0';
WAIT;
END PROCESS t_prcs_Y_12;
-- expected Y[11]
t_prcs_Y_11: PROCESS
BEGIN
	Y_expected(11) <= '0';
WAIT;
END PROCESS t_prcs_Y_11;
-- expected Y[10]
t_prcs_Y_10: PROCESS
BEGIN
	Y_expected(10) <= '0';
	WAIT FOR 300000 ps;
	Y_expected(10) <= '1';
	WAIT FOR 100000 ps;
	Y_expected(10) <= '0';
WAIT;
END PROCESS t_prcs_Y_10;
-- expected Y[9]
t_prcs_Y_9: PROCESS
BEGIN
	Y_expected(9) <= '0';
WAIT;
END PROCESS t_prcs_Y_9;
-- expected Y[8]
t_prcs_Y_8: PROCESS
BEGIN
	Y_expected(8) <= '0';
	WAIT FOR 300000 ps;
	Y_expected(8) <= '1';
	WAIT FOR 100000 ps;
	Y_expected(8) <= '0';
WAIT;
END PROCESS t_prcs_Y_8;
-- expected Y[7]
t_prcs_Y_7: PROCESS
BEGIN
	Y_expected(7) <= '1';
	WAIT FOR 200000 ps;
	Y_expected(7) <= '0';
WAIT;
END PROCESS t_prcs_Y_7;
-- expected Y[6]
t_prcs_Y_6: PROCESS
BEGIN
	Y_expected(6) <= '0';
	WAIT FOR 300000 ps;
	Y_expected(6) <= '1';
	WAIT FOR 100000 ps;
	Y_expected(6) <= '0';
WAIT;
END PROCESS t_prcs_Y_6;
-- expected Y[5]
t_prcs_Y_5: PROCESS
BEGIN
	Y_expected(5) <= '0';
	WAIT FOR 100000 ps;
	Y_expected(5) <= '1';
	WAIT FOR 100000 ps;
	Y_expected(5) <= '0';
	WAIT FOR 300000 ps;
	Y_expected(5) <= '1';
	WAIT FOR 300000 ps;
	Y_expected(5) <= '0';
WAIT;
END PROCESS t_prcs_Y_5;
-- expected Y[4]
t_prcs_Y_4: PROCESS
BEGIN
	Y_expected(4) <= '0';
	WAIT FOR 200000 ps;
	FOR i IN 1 TO 2
	LOOP
		Y_expected(4) <= '1';
		WAIT FOR 100000 ps;
		Y_expected(4) <= '0';
		WAIT FOR 300000 ps;
	END LOOP;
WAIT;
END PROCESS t_prcs_Y_4;
-- expected Y[3]
t_prcs_Y_3: PROCESS
BEGIN
	Y_expected(3) <= '1';
	WAIT FOR 100000 ps;
	Y_expected(3) <= '0';
	WAIT FOR 300000 ps;
	Y_expected(3) <= '1';
	WAIT FOR 100000 ps;
	Y_expected(3) <= '0';
	WAIT FOR 100000 ps;
	Y_expected(3) <= '1';
	WAIT FOR 200000 ps;
	Y_expected(3) <= '0';
WAIT;
END PROCESS t_prcs_Y_3;
-- expected Y[2]
t_prcs_Y_2: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		Y_expected(2) <= '1';
		WAIT FOR 200000 ps;
		Y_expected(2) <= '0';
		WAIT FOR 100000 ps;
	END LOOP;
	Y_expected(2) <= '1';
	WAIT FOR 200000 ps;
	Y_expected(2) <= '0';
WAIT;
END PROCESS t_prcs_Y_2;
-- expected Y[1]
t_prcs_Y_1: PROCESS
BEGIN
	Y_expected(1) <= '0';
	WAIT FOR 300000 ps;
	Y_expected(1) <= '1';
	WAIT FOR 300000 ps;
	Y_expected(1) <= '0';
WAIT;
END PROCESS t_prcs_Y_1;
-- expected Y[0]
t_prcs_Y_0: PROCESS
BEGIN
	Y_expected(0) <= '1';
	WAIT FOR 200000 ps;
	FOR i IN 1 TO 2
	LOOP
		Y_expected(0) <= '0';
		WAIT FOR 200000 ps;
		Y_expected(0) <= '1';
		WAIT FOR 100000 ps;
	END LOOP;
	Y_expected(0) <= '0';
WAIT;
END PROCESS t_prcs_Y_0;

-- Set trigger on real/expected o/ pattern changes                        

t_prcs_trigger_e : PROCESS(Y_expected)
BEGIN
	trigger_e <= NOT trigger_e;
END PROCESS t_prcs_trigger_e;

t_prcs_trigger_r : PROCESS(Y)
BEGIN
	trigger_r <= NOT trigger_r;
END PROCESS t_prcs_trigger_r;


t_prcs_selfcheck : PROCESS
VARIABLE i : INTEGER := 1;
VARIABLE txt : LINE;

VARIABLE last_Y_exp : STD_LOGIC_VECTOR(15 DOWNTO 0) := "UUUUUUUUUUUUUUUU";

VARIABLE on_first_change : trackvec := "1";
BEGIN

WAIT UNTIL (sampler'LAST_VALUE = '1'OR sampler'LAST_VALUE = '0')
	AND sampler'EVENT;
IF (debug_tbench = '1') THEN
	write(txt,string'("Scanning pattern "));
	write(txt,i);
	writeline(output,txt);
	write(txt,string'("| expected "));write(txt,Y_name);write(txt,string'(" = "));write(txt,Y_expected_prev);
	writeline(output,txt);
	write(txt,string'("| real "));write(txt,Y_name);write(txt,string'(" = "));write(txt,Y_prev);
	writeline(output,txt);
	i := i + 1;
END IF;
IF ( Y_expected_prev /= "XXXXXXXXXXXXXXXX" ) AND (Y_expected_prev /= "UUUUUUUUUUUUUUUU" ) AND (Y_prev /= Y_expected_prev) AND (
	(Y_expected_prev /= last_Y_exp) OR
	(on_first_change(1) = '1')
		) THEN
	throw_error("Y",Y_expected_prev,Y_prev);
	num_mismatches(0) <= num_mismatches(0) + 1;
	on_first_change(1) := '0';
	last_Y_exp := Y_expected_prev;
END IF;
    trigger_i <= NOT trigger_i;
END PROCESS t_prcs_selfcheck;


t_prcs_trigger_res : PROCESS(trigger_e,trigger_i,trigger_r)
BEGIN
	trigger <= trigger_i XOR trigger_e XOR trigger_r;
END PROCESS t_prcs_trigger_res;

t_prcs_endsim : PROCESS
VARIABLE txt : LINE;
VARIABLE total_mismatches : INTEGER := 0;
BEGIN
WAIT FOR 1000000 ps;
total_mismatches := num_mismatches(0);
IF (total_mismatches = 0) THEN                                              
        write(txt,string'("Simulation passed !"));                        
        writeline(output,txt);                                              
ELSE                                                                        
        write(txt,total_mismatches);                                        
        write(txt,string'(" mismatched vectors : Simulation failed !"));  
        writeline(output,txt);                                              
END IF;                                                                     
WAIT;
END PROCESS t_prcs_endsim;

END ovec_arch;

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

LIBRARY STD;                                                            
USE STD.textio.ALL;                                                     

USE WORK.My_ckt_1_vhd_tb_types.ALL;                                         

ENTITY My_ckt_1_vhd_vec_tst IS
END My_ckt_1_vhd_vec_tst;
ARCHITECTURE My_ckt_1_arch OF My_ckt_1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL S : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Y : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL sampler : sample_type;

COMPONENT My_ckt_1
	PORT (
	A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
COMPONENT My_ckt_1_vhd_check_tst
PORT ( 
	Y : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	sampler : IN sample_type
);
END COMPONENT;
COMPONENT My_ckt_1_vhd_sample_tst
PORT (
	A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	sampler : OUT sample_type
	);
END COMPONENT;
BEGIN
	i1 : My_ckt_1
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	S => S,
	Y => Y
	);
-- A[7]
t_prcs_A_7: PROCESS
BEGIN
	A(7) <= '0';
	WAIT FOR 600000 ps;
	A(7) <= '1';
	WAIT FOR 200000 ps;
	A(7) <= '0';
WAIT;
END PROCESS t_prcs_A_7;
-- A[6]
t_prcs_A_6: PROCESS
BEGIN
	A(6) <= '0';
	WAIT FOR 300000 ps;
	A(6) <= '1';
	WAIT FOR 100000 ps;
	A(6) <= '0';
	WAIT FOR 200000 ps;
	A(6) <= '1';
	WAIT FOR 100000 ps;
	A(6) <= '0';
WAIT;
END PROCESS t_prcs_A_6;
-- A[5]
t_prcs_A_5: PROCESS
BEGIN
	A(5) <= '0';
	WAIT FOR 600000 ps;
	A(5) <= '1';
	WAIT FOR 100000 ps;
	A(5) <= '0';
WAIT;
END PROCESS t_prcs_A_5;
-- A[4]
t_prcs_A_4: PROCESS
BEGIN
	A(4) <= '0';
	WAIT FOR 200000 ps;
	A(4) <= '1';
	WAIT FOR 200000 ps;
	A(4) <= '0';
	WAIT FOR 100000 ps;
	A(4) <= '1';
	WAIT FOR 300000 ps;
	A(4) <= '0';
WAIT;
END PROCESS t_prcs_A_4;
-- A[3]
t_prcs_A_3: PROCESS
BEGIN
	A(3) <= '1';
	WAIT FOR 100000 ps;
	A(3) <= '0';
	WAIT FOR 200000 ps;
	A(3) <= '1';
	WAIT FOR 300000 ps;
	A(3) <= '0';
WAIT;
END PROCESS t_prcs_A_3;
-- A[2]
t_prcs_A_2: PROCESS
BEGIN
	A(2) <= '0';
	WAIT FOR 700000 ps;
	A(2) <= '1';
	WAIT FOR 100000 ps;
	A(2) <= '0';
WAIT;
END PROCESS t_prcs_A_2;
-- A[1]
t_prcs_A_1: PROCESS
BEGIN
	A(1) <= '0';
	WAIT FOR 300000 ps;
	A(1) <= '1';
	WAIT FOR 200000 ps;
	A(1) <= '0';
	WAIT FOR 200000 ps;
	A(1) <= '1';
	WAIT FOR 100000 ps;
	A(1) <= '0';
WAIT;
END PROCESS t_prcs_A_1;
-- A[0]
t_prcs_A_0: PROCESS
BEGIN
	A(0) <= '0';
	WAIT FOR 100000 ps;
	A(0) <= '1';
	WAIT FOR 100000 ps;
	A(0) <= '0';
WAIT;
END PROCESS t_prcs_A_0;
-- B[7]
t_prcs_B_7: PROCESS
BEGIN
	B(7) <= '1';
	WAIT FOR 200000 ps;
	B(7) <= '0';
WAIT;
END PROCESS t_prcs_B_7;
-- B[6]
t_prcs_B_6: PROCESS
BEGIN
	B(6) <= '0';
	WAIT FOR 600000 ps;
	B(6) <= '1';
	WAIT FOR 200000 ps;
	B(6) <= '0';
WAIT;
END PROCESS t_prcs_B_6;
-- B[5]
t_prcs_B_5: PROCESS
BEGIN
	B(5) <= '0';
	WAIT FOR 100000 ps;
	B(5) <= '1';
	WAIT FOR 100000 ps;
	B(5) <= '0';
	WAIT FOR 500000 ps;
	B(5) <= '1';
	WAIT FOR 100000 ps;
	B(5) <= '0';
WAIT;
END PROCESS t_prcs_B_5;
-- B[4]
t_prcs_B_4: PROCESS
BEGIN
	B(4) <= '0';
	WAIT FOR 600000 ps;
	B(4) <= '1';
	WAIT FOR 100000 ps;
	B(4) <= '0';
WAIT;
END PROCESS t_prcs_B_4;
-- B[3]
t_prcs_B_3: PROCESS
BEGIN
	B(3) <= '0';
	WAIT FOR 300000 ps;
	B(3) <= '1';
	WAIT FOR 100000 ps;
	B(3) <= '0';
	WAIT FOR 100000 ps;
	B(3) <= '1';
	WAIT FOR 300000 ps;
	B(3) <= '0';
WAIT;
END PROCESS t_prcs_B_3;
-- B[2]
t_prcs_B_2: PROCESS
BEGIN
	B(2) <= '1';
	WAIT FOR 200000 ps;
	B(2) <= '0';
	WAIT FOR 100000 ps;
	B(2) <= '1';
	WAIT FOR 200000 ps;
	B(2) <= '0';
WAIT;
END PROCESS t_prcs_B_2;
-- B[1]
t_prcs_B_1: PROCESS
BEGIN
	B(1) <= '0';
	WAIT FOR 300000 ps;
	B(1) <= '1';
	WAIT FOR 100000 ps;
	B(1) <= '0';
	WAIT FOR 100000 ps;
	B(1) <= '1';
	WAIT FOR 200000 ps;
	B(1) <= '0';
WAIT;
END PROCESS t_prcs_B_1;
-- B[0]
t_prcs_B_0: PROCESS
BEGIN
	B(0) <= '1';
	WAIT FOR 500000 ps;
	B(0) <= '0';
	WAIT FOR 200000 ps;
	B(0) <= '1';
	WAIT FOR 100000 ps;
	B(0) <= '0';
WAIT;
END PROCESS t_prcs_B_0;
-- S[1]
t_prcs_S_1: PROCESS
BEGIN
	S(1) <= '0';
	WAIT FOR 400000 ps;
	S(1) <= '1';
	WAIT FOR 400000 ps;
	S(1) <= '0';
WAIT;
END PROCESS t_prcs_S_1;
-- S[0]
t_prcs_S_0: PROCESS
BEGIN
	S(0) <= '0';
	WAIT FOR 200000 ps;
	S(0) <= '1';
	WAIT FOR 200000 ps;
	S(0) <= '0';
	WAIT FOR 200000 ps;
	S(0) <= '1';
	WAIT FOR 200000 ps;
	S(0) <= '0';
WAIT;
END PROCESS t_prcs_S_0;
tb_sample : My_ckt_1_vhd_sample_tst
PORT MAP (
	A => A,
	B => B,
	S => S,
	sampler => sampler
	);

tb_out : My_ckt_1_vhd_check_tst
PORT MAP (
	Y => Y,
	sampler => sampler
	);
END My_ckt_1_arch;
