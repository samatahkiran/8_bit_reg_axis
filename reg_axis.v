`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 15:59:23
// Design Name: 
// Module Name: reg_axis
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_axis(

               input clk,
               input reset,
               
               input wire [7:0] s_tdata,
               input wire s_tvalid,
               output reg s_tready,
               input wire s_tlast,
               
               output reg [7:0] m_tdata,
               output reg m_tvalid,
               input wire m_tready,
               output reg m_tlast
               );
               
   reg [7:0] register_data;
   reg s_tvalid_1;
   reg m_tready_1;
   reg tlast_reg;
   
  
   
   always@(posedge clk) begin
       if(reset) begin
         register_data <= 1'b0;
          s_tvalid_1 <= 1'b0;
          tlast_reg <= 1'b0;
         // m_tready_1 <= 1'b0;
         end
         else if(s_tvalid && s_tready) begin
           register_data <= s_tdata;
           s_tvalid_1 <= s_tvalid;
           tlast_reg <= s_tlast;
         
           end
           else begin
             register_data <= 0;
             s_tvalid_1 <= 0;
             tlast_reg <= 0;
             end
             
      end
      
     always@(posedge clk) begin
          if(reset) begin
          m_tready_1 <= 8'b0;
          end
          m_tready_1<= m_tready;
          
          
          end
                    
    
//      assign s_tready = m_tready_1;
//      assign m_tdata =  register_data;
//      assign m_tvalid = s_tvalid_1;
//      assign m_tlast =  tlast_reg;
    
    always @ (posedge clk) begin
      if(reset) begin
        s_tready <= 0;
        m_tdata <= 0;
        m_tvalid <= 0;
        m_tlast <= 0;
        end
        else if(m_tready)begin   

        s_tready <= m_tready_1;
        m_tdata  <= register_data;
        m_tvalid <= s_tvalid_1;
        m_tlast  <= tlast_reg;
        
        end
        
      end  
        
     
endmodule





