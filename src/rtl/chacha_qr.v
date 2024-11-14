//======================================================================
//
// chacha_qr.v
// -----------
// Verilog 2001 implementation of the stream cipher ChaCha.
// This is the combinational QR logic as a separade module to allow
// us to build versions of the cipher with 1, 2, 4 and even 8
// parallel qr functions.
//
//
// Copyright (c) 2013 Secworks Sweden AB
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

module chacha_qr( 
                 input wire [31 : 0]  a,
                 input wire [31 : 0]  b,
                 input wire [31 : 0]  c,
                 input wire [31 : 0]  d,

                 output wire [31 : 0] a_prim,
                 output wire [31 : 0] b_prim,
                 output wire [31 : 0] c_prim,
                 output wire [31 : 0] d_prim
                );

  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  
  
      wire [31 : 0] a0;
      wire[31 : 0] a1;
      wire [31 : 0] a2;
      wire [31 : 0] a3;

      wire [31 : 0] b0;
      wire [31 : 0] b1;
      wire [31 : 0] b2;
      wire [31 : 0] b3;

      wire [31 : 0] c0;
      wire [31 : 0] c1;
      wire [31 : 0] c2;
      wire [31 : 0] c3;
      


      wire [31 : 0] d0;
      wire [31 : 0] d1;
      wire [31 : 0] d2;
      wire [31 : 0] d3;
      
      
    
     quarter_round q1(a, b, d, 2'd0, a0, d1);
     quarter_round q2(c, d1, b, 2'd1, c0, b1);
     quarter_round q3(a0, b1, d1,2'd2, a1, d3);
     quarter_round q4(c0, d3, b1, 2'd3, c1, b3);

  assign a_prim = a1;
  assign b_prim = b3;
  assign c_prim = c1;
  assign d_prim = d3;
    
endmodule // chacha_qr
