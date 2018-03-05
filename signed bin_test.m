clear all;
clc;
n = 4;
counter=0;
a = [-1.3 2.14 -2.5625 -2.0625];
filename = "Test_data.txt";
fid = fopen (filename, "w");
for kk =1:length(a)
    
    number = a(kk);
    if number >= 0
        number = floor(number*(2^n))/(2^n);
    else
        number = -number;
        number = floor(number*(2^n))/(2^n);
        number = -number;
    end
    number
    if number >= 0
        sign=0;
        integ = floor(number);
        fract = number-integ;
    else 
        sign = 1;
        fract = -(number-ceil(number));
        integ = (-number)-fract;
    end
    s=[];
    
    %collect bits for numbers after decimal in a string
    for x = 1:(n+1) 
        prod = fract * 2;
        if prod >= 1
            fract = prod - 1;
            bit = 1;
            s = strcat(s,num2str(bit));
        else
            fract = prod;
            bit = 0;
            s = strcat(s,num2str(bit));
        end   
    
    end
    sign_dumm=0;
    final_int = num2str(dec2bin(integ,2));
    signed_bin  = strcat(num2str(sign_dumm),final_int,s);
    
    if sign==0
        %keep the number same and send for round
    else
        %take 2's complement
        for i=1:length(signed_bin)
            if (signed_bin(i)=='1')
                signed_bin(i)='0';
            else
                signed_bin(i)='1';
            end
        end
    end
    x = length(signed_bin);
    temp=0;
    if sign==1
       if signed_bin(length(signed_bin))=='1'
                for i=1:length(signed_bin)
                    if signed_bin(i)=='1'
                       temp = temp + (2^(x-1)); 
                    end
                    x = x-1;
                end
                temp = temp + 1;
                
                signed_bin= num2str(dec2bin(temp,n+1));
       else 
            %keep it same no calculation needed for s(n+1)==0
       end
    end
    
    %rounding logic
    temp=0;
    x=length(signed_bin);
    if signed_bin(length(signed_bin))=='1'
            for i=1:length(signed_bin)
                if signed_bin(i)=='1'
                   temp = temp + (2^(x-1)); 
                end
                x = x-1;
            end
            temp = temp + 1;
            signed_bin = num2str(dec2bin(temp));
    else 
        %keep it same no calculation needed for s(n+1)==0
    end
    
    signed_bin = signed_bin(1:(length(signed_bin)-1));
    disp(signed_bin);
    counter+=1;
    fprintf (fid,"%d",counter);
    fputs (fid,":");
    fputs (fid,signed_bin);
    fputs (fid,";");
    fputs (fid,"\n");
end
fclose (fid);