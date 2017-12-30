--============================================================================
-- File: sorter.vhd
-- Author: Rune B. Nakim
--
-- Contents:
-- SORTER entity
-- BEHAVIORAL architecture
-- RTL architecture
--
-- Copyright 1999 Rune B. Nakim
--============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- Standard IEEE, use for VeriBest
--use ieee.std_logic_arith.all; -- Synopsys, corresponds to numeric_std
------------------------------------------------------------------------------
-- SORTER entity...
--
-- Sorts data to descending keys. Output data in reverse order.
--
-- Parameters:
-- KeySize, integer. The size in bits of the Key.
-- PointerSize, integer. The size in bits of the Pointer.
-- ListSize, integer. The number of elements that the sorter should be
-- able to sort.
--
--
-- Input signals:
-- CLK, 1 bit. Clock signal. Clock rate and other information
-- about the clock signal is not specified.
-- Reset_n, 1 bit. Resets the operation of the sorter.
-- Starts input operation. (Active low.)
-- EnableIn, 1 bit. Data is read only when this input is high.
-- KeyIn, n bits. This is the value to be used as the sort key.
-- PointerIn, m bits. This is a value 'attached' to the key,
-- usually a pointer to some data.
-- LastIn, 1 bit. This signal should be set high during the clock
-- cyle when the last element in a sequence is input.
-- EnableOut, 1 bit. This signal is set high when sorted data is
-- ready to be output.
-- EnableOut, 1 bit. Output operation is started on the first clock
-- cycle signal is high, after data is ready to be
-- output.
--
-- Output signals:
-- Outputting, 1 bit. Is high while valid data is at the output.
-- LastOut, 1 bit. This signal is set high during the clock cyle
-- when the last element in a sequence is output.
-- KeyOut, n bits. This is the value to be used as the sort key.
-- PointerOut, m bits. This is the value 'attached' to the key.
--

entity SORTER is
generic (KeySize : integer;
    PointerSize : integer;
    ListSize : integer);
port (
    CLK: in STD_LOGIC;
    Reset_n: in STD_LOGIC;
    -- Input mode of operation
    EnableIn: in STD_LOGIC;
    LastIn: in STD_LOGIC;
    KeyIn: in UNSIGNED (KeySize-1 downto 0);
    PointerIn: in UNSIGNED (PointerSize-1 downto 0);
    ReadyIn: out STD_LOGIC;
    -- Output mode of operation
    EnableOut: in STD_LOGIC;
    DoneOut: out STD_LOGIC;
    KeyOut: out UNSIGNED (KeySize-1 downto 0);
    PointerOut: out UNSIGNED (PointerSize-1 downto 0);
    ReadyOut: out STD_LOGIC;
    Outputting: out STD_LOGIC
);
end SORTER;
--
-- ...end of SORTER entity
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- RTL architecture of SORTER...
--
-- Register Transfer Level (RTL) description of the sorter.
--
architecture RTL of SORTER is
-- Inludes the SORTER_BOX entity as a component
component SORTER_BOX
generic (KeySize : integer;
PointerSize : integer);
port (
    CLK: in STD_LOGIC;
    Reset_n: in STD_LOGIC;
    ShiftIn: in STD_LOGIC;
    KeyIn: in UNSIGNED (KeySize-1 downto 0);
    PointerIn: in UNSIGNED (PointerSize-1 downto 0);
    KeyPrev: in UNSIGNED (KeySize-1 downto 0);
    PointerPrev: in UNSIGNED (PointerSize-1 downto 0);
    LEprev: in STD_LOGIC;
    DisabledPrev: in STD_LOGIC;
    ShiftOut: in STD_LOGIC;
    KeyOut: out UNSIGNED (KeySize-1 downto 0);
PointerOut: out UNSIGNED (PointerSize-1 downto 0);
LEout: out STD_LOGIC;
DisabledOut: out STD_LOGIC
);

end component;
-- Type definitions
subtype KeyType is UNSIGNED (0 to KeySize-1);
subtype PointerType is UNSIGNED (0 to PointerSize-1);
-- Internal signal (copy of out-port)
signal DoneOutInternal : STD_LOGIC;
-- STATE MACHINE
type StateType is (INIT, READY_IN, READ, FORWARD, READY_OUT, WRITE);
signal CurrentState, NextState : StateType;
-- STRUCTURAL DESCRIPTION OF THE SORTER_BOX COMPONENTS
-- Global control signals
signal ShiftIn: STD_LOGIC;
signal ShiftOut: STD_LOGIC;
-- Type definitions for the structural description
type KeyArray is
array (integer range <>) of UNSIGNED (KeySize-1 downto 0);
type PointerArray is
array (integer range <>) of UNSIGNED (PointerSize-1 downto 0);
type LEArray is
array (integer range <>) of STD_LOGIC;
type DisabledArray is
array (integer range <>) of STD_LOGIC;
-- Interconnection signals for the structural description
signal Key: KeyArray(ListSize-2 downto 0);
signal Pointer: PointerArray(ListSize-2 downto 0);
signal LE: LEArray(ListSize-2 downto 0);
signal LEout: STD_LOGIC;
signal LEfirst: STD_LOGIC;
signal Disabled: DisabledArray(ListSize-2 downto 0);
signal DisabledOut: STD_LOGIC;
signal DisabledFirst: STD_LOGIC;
begin
----------------------------------------------------------------------------
-- STRUCTURAL DESCRIPTION OF THE SORTER BLOCKS
--
LEfirst <= '0';
DisabledFirst <= '0' when (ShiftIn='1') else
'1';
-- Generate the ListSize # of SORTER_BOX components
cells : for i in 0 to ListSize-1 generate
-- Three cases are handled: The first, the last, and the rest
-- The first
leftmost : if i = 0 generate

leftmost_cell : SORTER_BOX generic map (KeySize, PointerSize)
port map (CLK, Reset_n,
ShiftIn,
KeyIn, PointerIn,
KeyIn, PointerIn,
LEfirst, DisabledFirst,
ShiftOut,
Key(i), Pointer(i),
LE(i), Disabled(i));
end generate leftmost;
-- All but the first and the last
middle : if i > 0 and i < ListSize-1 generate
middle_cell : SORTER_BOX generic map (KeySize, PointerSize)
port map (CLK, Reset_n,
ShiftIn,
KeyIn, PointerIn,
Key(i-1), Pointer(i-1),
LE(i-1), Disabled(i-1),
ShiftOut,
Key(i), Pointer(i),
LE(i), Disabled(i));
end generate middle;
-- The last
rightmost : if i = ListSize-1 generate
rightmost_cell : SORTER_BOX generic map (KeySize, PointerSize)

port map (CLK, Reset_n,
    ShiftIn,
    KeyIn, PointerIn,
    Key(i-1), Pointer(i-1),
    LE(i-1), Disabled(i-1),
    ShiftOut,
    KeyOut, PointerOut,
    LEout, DisabledOut);
    end generate rightmost;
    end generate cells;
-- End of STRUCTURAL DESCRIPTION OF THE SORTER BLOCKS --
----------------------------------------------------------------------------
-- DoneOut
-- Because out-ports cannot be read, the signal DoneOutInternal is used
-- internally in this code, and DoneOut is set to equal DoneOutInternal.
--
DoneOut <= DoneOutInternal;
----------------------------------------------------------------------------
-- STATE MACHINE (combinatorial)
--
SMcomb: process (CurrentState,
    EnableOut,
    LastIn,
    DisabledOut,
    Disabled)
 begin

-- Set the default values of all signals written by this SM
ReadyIn <= '0';
ReadyOut <= '0';
Outputting <= '0';
ShiftIn <= '0';
ShiftOut <= '0';
DoneOutInternal <= '0';
-- The state machine
case CurrentState is
when INIT =>
NextState <= READY_IN;
----------------------------------------
when READY_IN =>
ReadyIn <= '1';
NextState <= READ;
----------------------------------------
when READ =>
ReadyIn <= '1';
ShiftIn <= '1';
-- Kanskje DisabledOut istedenfor Disabled(ListSize-2)
if LastIn='1' and Disabled(ListSize-2)='1' then
NextState <= FORWARD;
elsif LastIn='1' and EnableOut='1' and Disabled(ListSize-2)='0' then
NextState <= WRITE;
elsif LastIn='1' and EnableOut='0' and Disabled(ListSize-2)='0' then
NextState <= READY_OUT;
else
NextState <= CurrentState;
end if;
----------------------------------------
when FORWARD =>
if (DisabledOut='1') then
ShiftOut <= '1';
end if;
if EnableOut='1' and Disabled(ListSize-2)='0' then
NextState <= WRITE;
elsif EnableOut='0' and Disabled(ListSize-2)='0' then
NextState <= READY_OUT;
else
NextState <= CurrentState;
end if;
when READY_OUT =>
ReadyOut <= '1';

NextState <= WRITE;
----------------------------------------
when WRITE =>
ReadyOut <= '1';
if EnableOut='1' then
ShiftOut <= '1';
Outputting <= '1';
end if;
if (Disabled(ListSize-2)='1') then
DoneOutInternal <= '1';
end if;
if Disabled(ListSize-2)='1' then
NextState <= READY_IN;
else
NextState <= CurrentState;
end if;
----------------------------------------
end case;
end process; -- End of STATE MACHINE Output (combinatorial)
--
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- STATE MACHINE (sequential)
--
SMseq: process (CLK, Reset_n)
begin
if (Reset_n = '0') then -- Asynch. Reset_n which sends the FSM
CurrentState <= INIT; -- to the INIT state.
elsif (CLK'event and CLK='1') then -- On rising clock edges, go to
CurrentState <= NextState; -- the next state chosen by
end if; -- the SMcomb process.
end process;
----------------------------------------------------------------------------
end RTL;
--
-- ...end of RTL architecture of SORTER
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- BEHAVIORAL architecture of SORTER
--
-- Behavioral description of the sorter.
-- Insertion sort implemented using loops and multiple wait statements.
--
architecture BEHAVIORAL of SORTER is
type SorterElement is record

Key : unsigned (0 to KeySize-1);
Pointer: unsigned (0 to PointerSize-1);
end record;
type SorterList is array (ListSize downto 1) of SorterElement;
begin
Sort: process
variable fan : SorterList;
variable NumberOfElements : integer;
variable new_pos : integer;
variable more_cards : boolean;
variable found_pos : boolean;
variable new_key : unsigned (0 to KeySize-1);
variable new_pointer : unsigned (0 to PointerSize-1);
begin
    ReadyIn <= '0';
    ReadyOut <= '0';
    Outputting <= '0';
    DoneOut <= '0';
    NumberOfElements := 0;
    more_cards := true;
if Reset_n/='1' then
    wait until Reset_n='1';
end if;
-- wait until CLK'event and CLK='1';
ReadyIn <= '1';
    while more_cards loop
        wait until CLK'event and CLK='1' and EnableIn='1';
if NumberOfElements < ListSize then
    NumberOfElements := NumberOfElements + 1;
end if;
-- Take next card.
new_key := KeyIn;
new_pointer := PointerIn;
if LastIn = '1' then
more_cards := false;
end if;
-- Find position to insert new card.
new_pos := 0;
found_pos := false;
while not found_pos loop
new_pos := new_pos + 1;
if new_pos = NumberOfElements then
found_pos := true;

elsif new_pos >= ListSize then
found_pos := true;
elsif fan(new_pos).Key < new_key then
found_pos := true;
end if;
end loop;
-- Shift all cards from insert position to end.
for idx in ListSize-1 downto new_pos + 1 loop
fan(idx) := fan(idx - 1);
end loop;
-- Insert new card.
if (new_pos < ListSize) then
fan(new_pos) := (new_key,new_pointer);
end if;
end loop;
ReadyIn <= '0';
if (NumberOfElements < ListSize) then
for idax in 1 to (ListSize-NumberOfElements) loop
wait until CLK'event and CLK='1';
end loop;
end if;
ReadyOut <= '1';
for index in NumberOfElements downto 1 loop
Outputting <= '0';
if (EnableOut='0') then
wait until EnableOut='1';
end if;
Outputting <= '1';
if (index = 1) then
DoneOut <= '1';
end if;
KeyOut <= fan(index).Key;
PointerOut <= fan(index).Pointer;
wait until CLK = '1' and CLK'event;
end loop;
end process;
end BEHAVIORAL;
--
--