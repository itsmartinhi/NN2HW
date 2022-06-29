LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY NEURONALESNETZ IS
    PORT (

    );
END NEURONALESNETZ;

ARCHITECTURE RTL OF NEURONALESNETZ IS

    -- components

    COMPONENT CONTROLLER IS
        PORT (
            in_input_indx : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
            in_neuron_indx : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            c_dec_neuron : OUT STD_LOGIC;
            c_dec_input : OUT STD_LOGIC;
            c_add_to_neuron : OUT STD_LOGIC;
            c_mult : OUT STD_LOGIC;
            c_argmax : OUT STD_LOGIC;
            out_neuron_indx : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        );
    END COMPONENT;

    COMPONENT INPUTDECREMENTER IS
        PORT (
            c_inp_dec : IN STD_LOGIC;
            out_inp_indx : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        );
    END COMPONENT;

    COMPONENT NeuronDecrementer IS
        PORT (
            c_neuron_dec : IN STD_LOGIC;
            out_neuron_indx : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        );
    END COMPONENT;

    COMPONENT MULTBLOCK IS
        PORT (
            c_mult : IN STD_LOGIC;
            in_weights : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            in_inputs : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
            out_val : OUT STD_LOGIC_VECTOR (12 DOWNTO 0);
        );
    END COMPONENT;

    COMPONENT NeuronReg IS
        PORT (
            in_nreg_val : IN STD_LOGIC_VECTOR (12 DOWNTO 0);
            c_nreg : IN STD_LOGIC;
            out_nreg_val : OUT STD_LOGIC_VECTOR (20 DOWNTO 0);
        );
    END COMPONENT;

    COMPONENT ArgmaxBlock IS
        PORT (
            in_argmax_val : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
            in_argmax_indx : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            c_argmax : IN STD_LOGIC;
            out_argmax_indx : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        );
    END COMPONENT;

    FOR ALL : CONTROLLER USE ENTITY WORK.CONTROLLER(RTL);
    FOR ALL : INPUTDECREMENTER USE ENTITY WORK.INPUTDECREMENTER(RTL);
    FOR ALL : NeuronDecrementer USE ENTITY WORK.NeuronDecrementer(RTL);
    FOR ALL : NeuronReg USE ENTITY WORK.NeuronReg(RTL);
    FOR ALL : ArgmaxBlock USE ENTITY WORK.ArgmaxBlock(RTL);

    -- internal signals
    -- controller
    SIGNAL c_dec_neuron, c_dec_input, c_add_to_neuron, c_mult, c_argmax STD_LOGIC;
    SIGNAL out_neuron_indx : STD_LOGIC_VECTOR (3 DOWNTO 0);

    -- INPUTDECREMENTER
    SIGNAL out_inp_indx : STD_LOGIC_VECTOR (7 DOWNTO 0);

    -- NeuronDecrementer 
    SIGNAL out_neuron_indx : STD_LOGIC_VECTOR (3 DOWNTO 0);

    -- MULTBLOCK
    SIGNAL out_val : STD_LOGIC_VECTOR (12 DOWNTO 0);

    -- NeuronReg
    SIGNAL out_nreg_val : STD_LOGIC_VECTOR (20 DOWNTO 0);

    -- ArgmaxBlock
    SIGNAL out_argmax_indx : STD_LOGIC_VECTOR (3 DOWNTO 0);

    -- port mapping
BEGIN
    U_CONTROLLER : CONTROLLER PORT MAP(
        c_dec_neuron => c_dec_neuron,
        c_dec_input => c_dec_input,
        c_add_to_neuron => c_add_to_neuron,
        c_mult => c_mult,
        c_argmax => c_argmax
    );
    U_INPUTDECREMENTER : INPUTDECREMENTER PORT MAP(
        c_inp_dec => c_dec_neuron,
        out_inp_indx => out_inp_indx
    );
    U_NeuronDecrementer : NeuronDecrementer PORT MAP(
        c_neuron_dec => c_dec_input,
        out_neuron_indx => out_neuron_indx,
    ),
    U_MULTBLOCK : MULTBLOCK PORT MAP(
        c_mult => c_mult,
        in_weights => -- here from rom,
        in_inputs => ---herer from ram
        out_val => out_val,
    );
    U_NeuronReg : NeuronReg PORT MAP(
        c_nreg => c_add_to_neuron,
        in_nreg_val => out_val
        out_nreg_val => out_nreg_val
    );
    U_ArgmaxBlock : ArgmaxBlock PORT MAP(
        in_argmax_val => out_nreg_val,
        in_argmaax_indx => out_neuron_indx,
        c_argmaax => c_argmax
        out_argmax_indx => out_argmax_indx
    );

    -- singal zum speicher und vom speicher

END RTL;