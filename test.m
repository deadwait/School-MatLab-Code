%calculated values
    I_rated = .5;
    P_out =120*I_rated*.8; 
    P_cu = 10;
    P_core = 15;
    P_loss = P_cu+P_core
    eff_mat = [0:1:120]
    V_seen = linspace (120,165.44,121)
    i=1
    
    while i < 121
        Eff = (P_out*((i-1)/100))/(P_out*((i-1)/100)+P_loss)
        eff_mat(i) = Eff
        i=i+1
    end