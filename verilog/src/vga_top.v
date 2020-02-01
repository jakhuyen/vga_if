module vga_top (
  input clkIn,
  input rstIn,
  output [3:0] vgaROut,
  output [3:0] vgaGOut,
  output [3:0] vgaBOut,
  output vgaHsOut,
  output vgaVsOut);

  wire [3:0] vgaRW = 4'hF;
  wire [3:0] vgaGW = 4'h0;
  wire [3:0] vgaBW = 4'h0;

  wire fbClkW;
  wire vgaClkW;
  wire rstW = ~rstIn;

  pixel_clock inst
  (
  // Clock out ports  
  .clk_out1(vgaClkW),
  // Status and control signals               
  .reset(rstW), 
  .locked(),
 // Clock in ports
  .clk_in1(clkIn)
  );

  vga_if vga_controller
  (
    .clkIn(vgaClkW),
    .rstIn(rstW),
    .vgaRIn(vgaRW),
    .vgaGIn(vgaGW),
    .vgaBIn(vgaBW),
    .vgaROut(vgaROut),
    .vgaGOut(vgaGOut),
    .vgaBOut(vgaBOut),
    .vgaHsOut(vgaHsOut),
    .vgaVsOut(vgaVsOut)
  );

endmodule