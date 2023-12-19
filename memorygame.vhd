library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MemoryGame is
    Port (
        clk : in STD_LOGIC;
        btnc : in STD_LOGIC; -- "Done" button
        btnu : in STD_LOGIC; -- "Reset" button
        switches : in STD_LOGIC_VECTOR (15 downto 0); -- Input switches
        leds : out STD_LOGIC_VECTOR (15 downto 0) -- Output LEDs
    );
end MemoryGame;

architecture Behavioral of MemoryGame is
    type GameState is (Idle, RecordSwitches, DisplaySequence);
    signal currentState, nextState: GameState := Idle;
    type SwitchArray is array (0 to 15) of integer range -1 to 15;
    signal switchSequence : SwitchArray := (others => -1);
    signal sequenceIndex : integer range 0 to 15 := 0;
    signal switchPressOrder : integer range 0 to 15 := 0;
    signal lastSwitchState : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal clkCount : integer := 0;

begin
    -- Game state machine
    gameLogic: process(clk)
    begin
        if rising_edge(clk) then
            case currentState is
                when Idle =>
                    if btnu = '1' then  -- Reset
                        switchSequence <= (others => -1);
                        switchPressOrder <= 0;
                        nextState <= RecordSwitches;
                    end if;

                when RecordSwitches =>
                    if btnc = '1' then  -- "Done" button pressed
                        nextState <= DisplaySequence;
                        sequenceIndex <= 0;
                        clkCount <= 0;
                    elsif switches /= lastSwitchState then
                        for i in 0 to switches'length-1 loop
                            if switches(i) = '1' and lastSwitchState(i) = '0' then
                                switchSequence(switchPressOrder) <= i;
                                switchPressOrder <= switchPressOrder + 1;
                            end if;
                        end loop;
                        lastSwitchState <= switches;
                    end if;

                when DisplaySequence =>
                    if clkCount < 5000000 then  -- Display delay
                        clkCount <= clkCount + 1;
                    else
                        if sequenceIndex < switchPressOrder then
                            leds <= (others => '0');
                            leds(switchSequence(sequenceIndex)) <= '1';
                            sequenceIndex <= sequenceIndex + 1;
                            clkCount <= 0;
                        else
                            nextState <= Idle;
                        end if;
                    end if;

                when others =>
                    nextState <= Idle;
            end case;
            currentState <= nextState;
        end if;
    end process;
end Behavioral;
