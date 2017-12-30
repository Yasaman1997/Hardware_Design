----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2017 03:50:33 PM
-- Design Name: 
-- Module Name: data_set - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_set is
    Port (
     -- ready:in  std_logic;
      clk:in  std_logic;
      plate:in integer range 11111 to 99999 ;
      location:in integer;
      final_location: out integer;
      input_flag:in  std_logic;
      search_flag:in  std_logic;
      insert_flag:out  std_logic;
      search_flag:out  std_logic
      
      );
end data_set;

architecture Behavioral of data_set is

type parking_state is (A , B , C , ext );   --A:insert
                                             --B:search
                                             
signal cur_state , next_state : parking_state := A ;

type Plate_Array is array (99 downto 0 ) of integer ; 
signal Our_plate : Pl := (others => 100000) ;
signal our_location : Pl := (others  => 0) ; 

signal number_keeper : integer := 0 ;
signal mid : integer := 0;


variable new_mid : integer ; 
variable begin : integer := 0 ; 
variable end : integer := 100; 


begin
process ( clk , insert_flag , search_flag , our_plate , plate ,number_keeper ,location ) 


 begin
 
 case cur_state is
    when A =>
        if search_flag = '1' then 
                next_state <=B;
                elsif input_flag = '1' then 
                                next_state <= A; 
                                end if ;
                    search_flag <='0';
                    insert_flag<='0';           

when B => 

            if number_keeper = 0 then
                our_plate(0) <= plate ;  
               our_location(0) <= location ;
                insert_flag <= '1';
                number_keeper <= number_keeper + 1 ;
                next_state <= A;
            end if ;        
 
   if number_keeper = 1 then
                         if(our_plate<plate) then 
                            our_plate(1) <= plate ;  
                            our_location(1) <= location ;
                           insert_flag <= '1';
                          number_keeper <= number_keeper + 1 ;
                           elif(our_plate>plate) then 
                             our_plate(1) <= our_plate(0) ;  
                             our_location(1) <= our_location(0) ;
                             
                                 our_plate(0) <= plate ;  
                                 our_location(0) <= location ;
                                 
                               insert_flag <= '1';
                               number_keeper <= number_keeper + 1 ;
                               
                          next_state <= A;
                      end if ;  
                      
                       if begin<end then
                       
                                      new_mid := (start + last ) / 2 ;
                                       mid <= new_mid;
    if(OUR_plate(new_mid+1))>plate AND our_plate(new_mid)<plate  then
                   
                      if(number_keeper>100) then
                      
                                             next_state <= ext; 
                                             else
                                            
                            for i in number_keeper downto ( new_mid + 2 ) loop
                                    location(i) <= location( i -1 );
                                    our_plate(i) <= our_plate( i -1 );
                 
                                 

                            end loop ;
                            
                            
                            plate(new_mid+1) <= plate;
                            our_location(new_mid+1) <= location;
                            
                            number_keeper <= number_keeper+1;
                            insert_flag <='1';
                    
                    
                 end if ;
                 end if;

      
when C =>  insert_flag <='0';
           if begin<end then 
             new_mid:=(begin+end)/2;
            if our_plate(new_mid)>plate then
                last:=new_mid;
                search_flag<='0';
                else
                if our_plate<plate then
                beging:=new_mid;
                search_flag<='0';
                
                else
                
                search_flag <='1';
             
                                 if  our_location(new_mid)<=24 and (our_location(new_mid)) >=0     then
                                             final_location <=0;
                                        
                                our_location(new_mid)<=49 and (our_location(new_mid)) >=25     then
                                              final_location <=1;
                                              
                                                 our_location(new_mid)<= 74 and (our_location(new_mid)) >=50     then
                                                                          final_location <=2;
                                                                          
                                              
                                               our_location(new_mid)<=99 and (our_location(new_mid)) >=75    then
                                                             final_location <=3;
                           end if ;
                                                             
                             
                                               next_state <= A; 
                                               
                                               end if ; 
                                               end if ; 
                                               end if ; 
                                              
                    
when ext => 
                      next_state <= ext; 
                                                                    
                      search_flag <='0';
                      input_flag <='0';

end process;
end Behavioral;
