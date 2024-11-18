entity and_gate is
    port(
        a, b : in bit;
        z    : out bit
    );
end entity;
-- arquitetura main de and_gate
architecture main of and_gate is
    begin
        z <= a and b;
end architecture;