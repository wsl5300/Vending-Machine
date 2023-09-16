library verilog;
use verilog.vl_types.all;
entity VendingMachine is
    generic(
        S0              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        S1              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        S2              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        S3              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        tea             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi0, Hi1, Hi0);
        coke            : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi1, Hi1, Hi1);
        coffee          : vl_logic_vector(0 to 5) := (Hi0, Hi1, Hi0, Hi1, Hi0, Hi0);
        milk            : vl_logic_vector(0 to 5) := (Hi0, Hi1, Hi1, Hi0, Hi0, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        coin            : in     vl_logic_vector(5 downto 0);
        drink_choose    : in     vl_logic_vector(5 downto 0);
        currentMoney    : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of S0 : constant is 1;
    attribute mti_svvh_generic_type of S1 : constant is 1;
    attribute mti_svvh_generic_type of S2 : constant is 1;
    attribute mti_svvh_generic_type of S3 : constant is 1;
    attribute mti_svvh_generic_type of tea : constant is 1;
    attribute mti_svvh_generic_type of coke : constant is 1;
    attribute mti_svvh_generic_type of coffee : constant is 1;
    attribute mti_svvh_generic_type of milk : constant is 1;
end VendingMachine;
