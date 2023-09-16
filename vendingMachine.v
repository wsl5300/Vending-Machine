module VendingMachine
( clk, rst, coin, drink_choose, currentMoney );

input clk, rst, coin, drink_choose ;
output currentMoney ;
 
parameter S0=4'b0000; 
parameter S1=4'b0001; 
parameter S2=4'b0010; 
parameter S3=4'b0100;

parameter tea = 6'd10; 
parameter coke = 6'd15; 
parameter coffee = 6'd20; 
parameter milk = 6'd25; 

reg [3:0] curr_s ;
reg [3:0] next_s ;
reg [7:0] currentMoney ;
wire [5:0] coin, drink_choose ;


//initial begin
//    curr_s <= S0;
//    currentMoney = 0 ;
//end

always @(posedge clk or posedge rst)
begin
    if(rst) begin
	curr_s <= S0;
	currentMoney = 8'd0 ;
    end
    else
	curr_s <= next_s;  
end

always @(*)
begin
	
  
	case(curr_s)

	S0:begin	
			if (  coin == 6'd0 && currentMoney < 8'd10 ) next_s <= S3 ; // 取消
			else
			begin
				currentMoney = currentMoney + coin  ;
				$write( "coin %d	total %d dollars	", coin, currentMoney ) ;
				if( currentMoney < 8'd10 )	next_s <= S0 ;	// 繼續投錢
				else  next_s <= S1 ;		// 顯示飲料
			end
	end
    	S1: begin
			if ( currentMoney >= 8'd10 && currentMoney < 8'd15 ) $display( "tea" ) ;

			if ( currentMoney >= 8'd15 && currentMoney < 8'd20 ) $display( "tea | coke" ) ;

			if ( currentMoney >= 8'd20 && currentMoney < 8'd25 ) $display( "tea | coke | coffee" ) ;

			if ( currentMoney >= 8'd25 ) $display( "tea | coke | coffee | milk" ) ;
			
			
			if ( coin == 6'd0 ) next_s <= S2;
			else next_s <= S0 ;
	end		
    	S2: begin
			if (  drink_choose != 0 ) begin
				if( drink_choose == 1 && currentMoney >= tea )
				begin
					$display( "tea out\n" ) ;
					currentMoney = currentMoney - tea ;
				end	
				
	
				else if( drink_choose == 2 && currentMoney >= coke )
				begin
					$display( "coke out\n" ) ;
					currentMoney = currentMoney - coke ;
				end
				

				else if( drink_choose == 3 && currentMoney >= coffee )
				begin
					$display( "coffee out\n" ) ;
					currentMoney = currentMoney - coffee ;
				end
				

				else if( drink_choose == 4 && currentMoney >= milk )
				begin
					$display( "milk out\n" ) ;
					currentMoney = currentMoney - milk ;
				end
				

				else begin
			
					$display( "You can't afford it!\n" ) ;
					next_s <= S2 ;
				end
				
			end
			else next_s <= S3 ;
			
	end
    	S3: begin		
			$display( "exchange %d dollars\n", currentMoney ) ;
			currentMoney = 0 ;
			next_s <= S0 ;
	end
    	
    	default:    		next_s <= S0;
	endcase
end       
endmodule