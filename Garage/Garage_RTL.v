module Garage_RTL (
  input      wire Up_max,Dn_max,Activate,
  input      wire CLK,RST,
  output     reg Up_M,Dn_M
                   );
  localparam reg [2:0] idle  = 3'b000,
                   Mv_up = 3'b001,
                   Mv_dn = 3'b010,
                   opend = 3'b011,
                   closed= 3'b100;
   reg       [2:0] next_state,current_state;
   
    always @(posedge CLK or negedge RST)
        begin
          if (!RST)
             current_state <= idle;
          else
             current_state <= next_state;
        end
        
    always @(*)
      begin
         Up_M = 0;
         Dn_M = 0;
         case(current_state)
            idle: 
                   begin
                     if (Activate&&Up_max&&~Dn_max)
					    begin
						  next_state = Mv_dn ;
					    end
					else if (Activate&&~Up_max&&Dn_max)
					     begin
						  next_state = Mv_up ;
					     end
					else
					      next_state = idle ;
			       end
			Mv_up:
			       begin
				     if (!Up_max)
					    next_state =  opend ;
					 else if (Up_max)
					    next_state = idle; 
					 else
					   next_state = Mv_up ;
				   end
					
			Mv_dn:
			       begin
				     if (!Dn_max)
					    next_state =  closed ;
					 else if (Dn_max)
					    next_state = idle ; 
					 else
					   next_state = Mv_dn ;
				   end	
			opend:
                   begin
                     Up_M = 1;
                     Dn_M = 0;
                   end					 
					 
			closed:
                   begin
                     Up_M = 0;
                     Dn_M = 1;
                   end	
			default:
			       begin
			         next_state = idle ;
					 Up_M = 0;
                     Dn_M = 0;
			       end
		  endcase
		
	   end				 
endmodule
	