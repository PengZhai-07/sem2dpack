  oA  y   k820309    ð          2021.7.1    Ĩīc                                                                                                          
       bc_dynflt_rsf.f90 BC_DYNFLT_RSF              RSF_TYPE RSF_READ RSF_INIT RSF_MU RSF_SOLVER RSF_QS_SOLVER RSF_TIMESTEP                      @                              
                            @                              
       IO_ABORT                   @                              '                    #C    #D                 D                                             
                                                
                                 0D0                D                                   @                    #DISTRIBUTION_TYPE                                          y#DISTRIBUTION_TYPE                                                                  Ā  @                              '@                    #KIND    #ORDER0    #GAUSSIAN    #SPLINE    #LINEAR    #GRADIENT #   #PWCONR *   #HETE1 0                D                                                                                                                             0                D                                  ø                    #ORDER0_DIST_TYPE 	                                         y#ORDER0_DIST_TYPE 	                                                                Ā  @                         	     'ø                    #X_NZONES 
   #Z_NZONES    #X_BOUND    #Z_BOUND    #VAL                  D                             
                                 D                                                           D                                                          
            &                                                       D                                         P                 
            &                                                       D                                                          
            &                   &                                                       D                                  8                    #GAUSSIAN_DIST_TYPE                                          y#GAUSSIAN_DIST_TYPE                                                                 Ā  @                              '8                    #X_0    #Z_0    #LX    #LZ    #LEVEL_0    #AMPLI    #ORDER                 D                                            
                                                
                                 0D0                 D                                           
                                                
                                 0D0                 D                                           
                                                
                       ð?        1D0                 D                                           
                                                
                       ð?        1D0                 D                                            
                                                
                                 0D0                 D                                  (         
                                                
                       ð?        1D0                 D                                  0                                                                                         1                D                                                      #SPLINE_DIST_TYPE                                          y#SPLINE_DIST_TYPE                                                                 Ā  @                              '                    #DIM    #X    #VAL                 D                                                                                                                            1               D                                                         
            &                                                                                 y
                                                          D                                         P                
            &                                                                                 y
                                                           D                                                        #LINEAR_DIST_TYPE                                          y#LINEAR_DIST_TYPE                                                                 Ā  @                              '                     #DIM    #SMOOTHING_LENGTH     #X !   #VAL "                D                                                                                                                            1                 D                                            
                                                
                                 0D0               D                             !                            
            &                                                                                 y
                                                          D                             "            X                
            &                                                                                 y
                                                           D                             #     Ļ       (             #GRADIENT_DIST_TYPE $                                         y#GRADIENT_DIST_TYPE $                                                                Ā  @                         $     'Ļ                    #GRAD %   #ANGLE &   #VALREF '   #X (   #Y )                 D                             %                
                 D                             &               
                 D                             '               
              D                             (                             
            &                                                       D                             )            `                 
            &                                                       D                             *     Ļ       0             #PWCONR_DIST_TYPE +                                         y#PWCONR_DIST_TYPE +                                                                Ā  @                         +     'Ļ                    #NUMZON ,   #REFPNT -   #RADZON .   #VALZON /                 D                             ,                                 D                             -                             
  p          p            p                                      D                             .                             
            &                                                       D                             /            `                 
            &                                                       D                             0            8             #HETE1_DIST_TYPE 1                                         y#HETE1_DIST_TYPE 1                                                                Ā  @                         1     '                    #NX 2   #NZ 3   #X0 4   #Z0 5   #DX 6   #DZ 7   #VAL 8                 D                             2                                 D                             3                                D                             4               
                 D                             5               
                 D                             6               
                 D                             7                
               D                             8            (                 
            &                   &                                                         @  @                         9     'p                    #DC :   #MUS ;   #A <   #B =   #VSTAR >   #THETA ?   #VC @                                               :                           #CD_TYPE                                                ;                          #CD_TYPE                                                <                           #CD_TYPE                                                =            0              #CD_TYPE                                                >            @              #CD_TYPE                                                ?            P              #CD_TYPE                                                @            `              #CD_TYPE                      @                          A     '                   #KIND B   #DC C   #MUS D   #A E   #B F   #VSTAR G   #THETA H   #VC I   #TC J   #COEFT K   #DT L   #INPUT M                 D                              B                              D                              C                            
            &                                                                                 y
                                                        D                              D            P                
            &                                                                                 y
                                                          D                              E                            
            &                                                                                 y
                                                          D                              F            ā                
            &                                                                                 y
                                                          D                              G            (               
            &                                                                                 y
                                                        D                              H            p               
            &                                                                                 y
                                                          D                              I            ļ               
            &                                                                                 y
                                                          D                              J                          	  
            &                                                                                 y
                                                          D                              K            H             
  
            &                                                                                 y
                                                             D                              L              
                 D                              M     p                    #RSF_INPUT_TYPE 9   #         @                                   N                    #RSF O   #IIN P                                D @                               O                   #RSF_TYPE A             
  @                               P           #         @                                   Q                    #RSF R   #COORD S   #DT T             
D @                               R                   #RSF_TYPE A             
 @                               S                   
 
             &                   &                                                     
                                  T     
      (        `                                U                                    
    #V V   #F W   p          H r X     7
S
O
 p        j            j                                      H r X     7
S
O
 p        j            j                                                           0  
 @                               V                   
              &                                                     
                                  W                  #RSF_TYPE A   #         @                                   Y                    #V Z   #TAU_STICK [   #SIGMA \   #F ]   #Z ^          0  
D@                               Z                   
               &                                                     
  @                               [                   
              &                                                     
  @                               \                   
              &                                                     
D @                               ]                   #RSF_TYPE A             
  @                               ^                   
              &                                           #         @                                   _                    #V `   #TAU a   #SIGMA b   #F c             
D @                               `                   
               &                                                     
  @                               a                   
              &                                                     
  @                               b                   
              &                                                     
D @                               c                   #RSF_TYPE A   #         @                                   d                   #RSF_TIMESTEP%TIMESCHEME_TYPE e   #TIME s   #F t   #V u   #SIGMA v   #HCELL w                                          @                           e     'č                    #KIND f   #DT g   #COURANT h   #TIME i   #TOTAL j   #ALPHA k   #BETA l   #GAMMA m   #OMEGA_MAX n   #A o   #B p   #NT q   #NSTAGES r                                              f                                                                       g               
                                               h               
                                               i                
                                               j     (          
                                               k     0          
                                               l     8          
                                               m     @          
                                               n     H       	   
                                             o            P              
   
            &                                                                                     p                             
            &                                                                                       q     ā                                                         r     ä                       
D                                 s     č               #RSF_TIMESTEP%TIMESCHEME_TYPE e             
                                  t                  #RSF_TYPE A             
 @                               u                   
 )             &                                                     
                                  v                   
 *             &                                                     
                                  w     
                    @                           X     SIZE        (      fn#fn #   Č   X   b   uapp(BC_DYNFLT_RSF        @   J  DISTRIBUTION_CD    `  I   J  STDIO (   Đ  ^       CD_TYPE+DISTRIBUTION_CD ,     §   %   CD_TYPE%C+DISTRIBUTION_CD=C ,   Ū  Þ   %   CD_TYPE%D+DISTRIBUTION_CD=D 7     ą      DISTRIBUTION_TYPE+DISTRIBUTION_GENERAL A   =  Ĩ   %   DISTRIBUTION_TYPE%KIND+DISTRIBUTION_GENERAL=KIND E   â  Ü   %   DISTRIBUTION_TYPE%ORDER0+DISTRIBUTION_GENERAL=ORDER0 5   ū        ORDER0_DIST_TYPE+DISTRIBUTION_ORDER0 G   M  H   %   ORDER0_DIST_TYPE%X_NZONES+DISTRIBUTION_ORDER0=X_NZONES G     H   %   ORDER0_DIST_TYPE%Z_NZONES+DISTRIBUTION_ORDER0=Z_NZONES E   Ý     %   ORDER0_DIST_TYPE%X_BOUND+DISTRIBUTION_ORDER0=X_BOUND E   q     %   ORDER0_DIST_TYPE%Z_BOUND+DISTRIBUTION_ORDER0=Z_BOUND =     Ž   %   ORDER0_DIST_TYPE%VAL+DISTRIBUTION_ORDER0=VAL I   ą  ā   %   DISTRIBUTION_TYPE%GAUSSIAN+DISTRIBUTION_GENERAL=GAUSSIAN 9   	        GAUSSIAN_DIST_TYPE+DISTRIBUTION_GAUSSIAN A   &
  §   %   GAUSSIAN_DIST_TYPE%X_0+DISTRIBUTION_GAUSSIAN=X_0 A   Í
  §   %   GAUSSIAN_DIST_TYPE%Z_0+DISTRIBUTION_GAUSSIAN=Z_0 ?   t  §   %   GAUSSIAN_DIST_TYPE%LX+DISTRIBUTION_GAUSSIAN=LX ?     §   %   GAUSSIAN_DIST_TYPE%LZ+DISTRIBUTION_GAUSSIAN=LZ I   Â  §   %   GAUSSIAN_DIST_TYPE%LEVEL_0+DISTRIBUTION_GAUSSIAN=LEVEL_0 E   i  §   %   GAUSSIAN_DIST_TYPE%AMPLI+DISTRIBUTION_GAUSSIAN=AMPLI E     Ĩ   %   GAUSSIAN_DIST_TYPE%ORDER+DISTRIBUTION_GAUSSIAN=ORDER E   ĩ  Ü   %   DISTRIBUTION_TYPE%SPLINE+DISTRIBUTION_GENERAL=SPLINE 5     i      SPLINE_DIST_TYPE+DISTRIBUTION_SPLINE =   ú  Ĩ   %   SPLINE_DIST_TYPE%DIM+DISTRIBUTION_SPLINE=DIM 9     ô   %   SPLINE_DIST_TYPE%X+DISTRIBUTION_SPLINE=X =     ô   %   SPLINE_DIST_TYPE%VAL+DISTRIBUTION_SPLINE=VAL E     Ü   %   DISTRIBUTION_TYPE%LINEAR+DISTRIBUTION_GENERAL=LINEAR 5   c        LINEAR_DIST_TYPE+DISTRIBUTION_LINEAR =   â  Ĩ   %   LINEAR_DIST_TYPE%DIM+DISTRIBUTION_LINEAR=DIM W     §   %   LINEAR_DIST_TYPE%SMOOTHING_LENGTH+DISTRIBUTION_LINEAR=SMOOTHING_LENGTH 9   .  ô   %   LINEAR_DIST_TYPE%X+DISTRIBUTION_LINEAR=X =   "  ô   %   LINEAR_DIST_TYPE%VAL+DISTRIBUTION_LINEAR=VAL I     ā   %   DISTRIBUTION_TYPE%GRADIENT+DISTRIBUTION_GENERAL=GRADIENT 9   ö        GRADIENT_DIST_TYPE+DISTRIBUTION_GRADIENT C   u  H   %   GRADIENT_DIST_TYPE%GRAD+DISTRIBUTION_GRADIENT=GRAD E   ―  H   %   GRADIENT_DIST_TYPE%ANGLE+DISTRIBUTION_GRADIENT=ANGLE G     H   %   GRADIENT_DIST_TYPE%VALREF+DISTRIBUTION_GRADIENT=VALREF =   M     %   GRADIENT_DIST_TYPE%X+DISTRIBUTION_GRADIENT=X =   á     %   GRADIENT_DIST_TYPE%Y+DISTRIBUTION_GRADIENT=Y E   u  Ü   %   DISTRIBUTION_TYPE%PWCONR+DISTRIBUTION_GENERAL=PWCONR 5   Q        PWCONR_DIST_TYPE+DISTRIBUTION_PWCONR C   Ņ  H   %   PWCONR_DIST_TYPE%NUMZON+DISTRIBUTION_PWCONR=NUMZON C        %   PWCONR_DIST_TYPE%REFPNT+DISTRIBUTION_PWCONR=REFPNT C   ĩ     %   PWCONR_DIST_TYPE%RADZON+DISTRIBUTION_PWCONR=RADZON C   I     %   PWCONR_DIST_TYPE%VALZON+DISTRIBUTION_PWCONR=VALZON C   Ý  Ú   %   DISTRIBUTION_TYPE%HETE1+DISTRIBUTION_GENERAL=HETE1 3   ·        HETE1_DIST_TYPE+DISTRIBUTION_HETE1 9   @  H   %   HETE1_DIST_TYPE%NX+DISTRIBUTION_HETE1=NX 9     H   %   HETE1_DIST_TYPE%NZ+DISTRIBUTION_HETE1=NZ 9   Ð  H   %   HETE1_DIST_TYPE%X0+DISTRIBUTION_HETE1=X0 9      H   %   HETE1_DIST_TYPE%Z0+DISTRIBUTION_HETE1=Z0 9   `   H   %   HETE1_DIST_TYPE%DX+DISTRIBUTION_HETE1=DX 9   Ļ   H   %   HETE1_DIST_TYPE%DZ+DISTRIBUTION_HETE1=DZ ;   ð   Ž   %   HETE1_DIST_TYPE%VAL+DISTRIBUTION_HETE1=VAL    !         RSF_INPUT_TYPE "   )"  ]   a   RSF_INPUT_TYPE%DC #   "  ]   a   RSF_INPUT_TYPE%MUS !   ã"  ]   a   RSF_INPUT_TYPE%A !   @#  ]   a   RSF_INPUT_TYPE%B %   #  ]   a   RSF_INPUT_TYPE%VSTAR %   ú#  ]   a   RSF_INPUT_TYPE%THETA "   W$  ]   a   RSF_INPUT_TYPE%VC    ī$  ―       RSF_TYPE    q%  H   !   RSF_TYPE%KIND    đ%  ô   !   RSF_TYPE%DC    ­&  ô   !   RSF_TYPE%MUS    Ą'  ô   !   RSF_TYPE%A    (  ô   !   RSF_TYPE%B    )  ô   !   RSF_TYPE%VSTAR    }*  ô   !   RSF_TYPE%THETA    q+  ô   !   RSF_TYPE%VC    e,  ô   !   RSF_TYPE%TC    Y-  ô   !   RSF_TYPE%COEFT    M.  H   !   RSF_TYPE%DT    .  d   !   RSF_TYPE%INPUT    ų.  m       RSF_READ    f/  V   a   RSF_READ%RSF    ž/  @   a   RSF_READ%IIN    ü/  d       RSF_INIT    `0  V   a   RSF_INIT%RSF    ķ0  Ī   a   RSF_INIT%COORD    Z1  @   a   RSF_INIT%DT    1  r      RSF_MU    3     a   RSF_MU%V    3  V   a   RSF_MU%F    î3  w       RSF_SOLVER    e4     a   RSF_SOLVER%V %   ņ4     a   RSF_SOLVER%TAU_STICK !   }5     a   RSF_SOLVER%SIGMA    	6  V   a   RSF_SOLVER%F    _6     a   RSF_SOLVER%Z    ë6  j       RSF_QS_SOLVER     U7     a   RSF_QS_SOLVER%V "   á7     a   RSF_QS_SOLVER%TAU $   m8     a   RSF_QS_SOLVER%SIGMA     ų8  V   a   RSF_QS_SOLVER%F    O9  ­       RSF_TIMESTEP 7   ü9  Ö      RSF_TIMESTEP%TIMESCHEME_TYPE+TIME_EVOL <   Ō:  P   a   RSF_TIMESTEP%TIMESCHEME_TYPE%KIND+TIME_EVOL :   ";  H   a   RSF_TIMESTEP%TIMESCHEME_TYPE%DT+TIME_EVOL ?   j;  H   a   RSF_TIMESTEP%TIMESCHEME_TYPE%COURANT+TIME_EVOL <   ē;  H   a   RSF_TIMESTEP%TIMESCHEME_TYPE%TIME+TIME_EVOL =   ú;  H   a   RSF_TIMESTEP%TIMESCHEME_TYPE%TOTAL+TIME_EVOL =   B<  H   a   RSF_TIMESTEP%TIMESCHEME_TYPE%ALPHA+TIME_EVOL <   <  H   a   RSF_TIMESTEP%TIMESCHEME_TYPE%BETA+TIME_EVOL =   Ō<  H   a   RSF_TIMESTEP%TIMESCHEME_TYPE%GAMMA+TIME_EVOL A   =  H   a   RSF_TIMESTEP%TIMESCHEME_TYPE%OMEGA_MAX+TIME_EVOL 9   b=     a   RSF_TIMESTEP%TIMESCHEME_TYPE%A+TIME_EVOL 9   ö=     a   RSF_TIMESTEP%TIMESCHEME_TYPE%B+TIME_EVOL :   >  H   a   RSF_TIMESTEP%TIMESCHEME_TYPE%NT+TIME_EVOL ?   Ō>  H   a   RSF_TIMESTEP%TIMESCHEME_TYPE%NSTAGES+TIME_EVOL "   ?  j   a   RSF_TIMESTEP%TIME    ?  V   a   RSF_TIMESTEP%F    Ú?     a   RSF_TIMESTEP%V #   f@     a   RSF_TIMESTEP%SIGMA #   ō@  @   a   RSF_TIMESTEP%HCELL    2A  =      RSF_MU%SIZE 