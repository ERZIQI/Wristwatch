library IEEE;
use IEEE.numeric_bit.all;

--  the clock module, implements the timekeeping and alarm functions

entity clock is
port(
		clk, inch, incm, incha, incma, set_alarm, alarm_off : in bit;
		hours, ahours, minutes, aminutes, seconds           : inout unsigned(7 downto 0);
		am_pm, aam_pm, ring, alarm_set						: inout bit);
end clock;

architecture clock1 of clock is
 component CTR_59 is
	port(
		clk, inc, reset	: in bit; 
		dout			: out unsigned(7 downto 0);
		t59				: out bit);
 end component;
 
 component CTR_12 is
	port(
		clk, inc	: in bit; 
		dout		: out unsigned(7 downto 0); 
		am_pm		: inout bit);
 end component;
 
 signal s59, m59, inchr, incmin, c99, inch_valid, incm_valid	: bit;
 signal alarm_ring_time								: integer range 0 to 50;
 signal div100										: integer range 0 to 99;
 
 begin
	sec1	: 			ctr_59 port map(clk, c99, '0', seconds, s59); -- the instance of the ctr_59 module to calculate seconds
	min1	: 			ctr_59 port map(clk, incmin, '0', minutes, m59); -- the instance of the ctr_59 module to calculate minutes 
	hrs1	: 			ctr_12 port map(clk, inchr, hours, am_pm); -- the instance of the ctr_59 module to calculate hours
		
	incmin 	<= (s59 and c99); 		-- the condition to incrimante minutes
	inchr 	<= (m59 and s59 and c99); -- the condition to incrimante the hours
	
	alarm_min	: 		ctr_59 port map(clk, incma, '0', aminutes, open); 	-- set the minutes for the alarm
	alarm_hr	: 		ctr_12 port map(clk, incha, ahours, aam_pm); 		-- set the hours for the alarm
	
	c99 <= '1' when div100 = 99 else '0'; -- activate the bit for the inc of seconds
	
	process(clk)
		begin
			if clk'event and clk = '1' then
				if c99 = '1' then 
					div100 <= 0;   -- divide by 100 counter
				else 
					div100 <= div100 + 1;
				end if; -- counter to acheive 1 seconds
			
				if set_alarm = '1' then
					alarm_set <= not alarm_set;
				end if; -- toggel to / from alarm set mode
			
				if (((minutes = aminutes) and (hours = ahours) and (am_pm = aam_pm)) and seconds = 0 and alarm_set = '1') then
					ring <= '1'; 
				end if; -- activate the sound of the alarm
			
				if ring = '1' and c99 = '1' then
					alarm_ring_time <= alarm_ring_time + 1;
				end if; -- counting for 50 seconds
			
				if alarm_ring_time = 50 or alarm_off = '1' then
					ring <= '0'; alarm_ring_time <= 0; 
				end if; -- if not desactivated mannualy it will be desactivated after 50s
			end if;
	end process;
end clock1;