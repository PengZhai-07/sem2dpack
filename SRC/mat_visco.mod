  =  i   k820309    ð          2021.7.1    Î,īc                                                                                                          
       mat_visco.f90 MAT_VISCO              MATWRK_VISCO_TYPE MAT_ISVISCO MAT_VISCO_READ MAT_VISCO_INIT_ELEM_PROP MAT_VISCO_INIT_ELEM_WORK MAT_VISCO_STRESS MAT_VISCO_MEMPRO MAT_VISCO_MEMWRK                      @                              
                            @                              
       IO_ABORT                   @                               '                    #INPUT    #LIST B               D                                   0                     #MATPRO_INPUT_TYPE                                          y#MATPRO_INPUT_TYPE                                                                     @                              '0                    #KIND    #LIST                 D                                   
                          p          p 
           p 
                                        
             
                                                                     D                                           (             #PROP_INPUT_LINK_TYPE                                          y#PROP_INPUT_LINK_TYPE                                                                 @  @                              '                     #NAME 	   #DATA 
   #NEXT A                                             	                                                                                  	       	              C                                                                        
                          #CD_TYPE                  Ā  @                              '                    #C    #D                 D                                            
                                                
                                 0D0                D                                  @                    #DISTRIBUTION_TYPE                                          y#DISTRIBUTION_TYPE                                                                  Ā  @                              '@                    #KIND    #ORDER0    #GAUSSIAN    #SPLINE     #LINEAR %   #GRADIENT +   #PWCONR 2   #HETE1 8                D                                                                                                                             0                D                                  ø                    #ORDER0_DIST_TYPE                                          y#ORDER0_DIST_TYPE                                                                 Ā  @                              'ø                    #X_NZONES    #Z_NZONES    #X_BOUND    #Z_BOUND    #VAL                  D                                                              D                                                           D                                                          
            &                                                       D                                         P                 
            &                                                       D                                                          
            &                   &                                                       D                                  8                    #GAUSSIAN_DIST_TYPE                                          y#GAUSSIAN_DIST_TYPE                                                                 Ā  @                              '8                    #X_0    #Z_0    #LX    #LZ    #LEVEL_0    #AMPLI    #ORDER                 D                                            
                                                
                                 0D0                 D                                           
                                                
                                 0D0                 D                                           
                                                
                       ð?        1D0                 D                                           
                                                
                       ð?        1D0                 D                                            
                                                
                                 0D0                 D                                  (         
                                                
                       ð?        1D0                 D                                  0                                                                                         1                D                                                       #SPLINE_DIST_TYPE !                                         y#SPLINE_DIST_TYPE !                                                                Ā  @                         !     '                    #DIM "   #X #   #VAL $                D                             "                                                                                               1               D                             #                            
            &                                                                                 y
                                                          D                             $            P                
            &                                                                                 y
                                                           D                             %                           #LINEAR_DIST_TYPE &                                         y#LINEAR_DIST_TYPE &                                                                Ā  @                         &     '                     #DIM '   #SMOOTHING_LENGTH (   #X )   #VAL *                D                             '                                                                                               1                 D                             (              
                                                
                                 0D0               D                             )                            
            &                                                                                 y
                                                          D                             *            X                
            &                                                                                 y
                                                           D                             +     Ļ       (             #GRADIENT_DIST_TYPE ,                                         y#GRADIENT_DIST_TYPE ,                                                                Ā  @                         ,     'Ļ                    #GRAD -   #ANGLE .   #VALREF /   #X 0   #Y 1                 D                             -                
                 D                             .               
                 D                             /               
              D                             0                             
            &                                                       D                             1            `                 
            &                                                       D                             2     Ļ       0             #PWCONR_DIST_TYPE 3                                         y#PWCONR_DIST_TYPE 3                                                                Ā  @                         3     'Ļ                    #NUMZON 4   #REFPNT 5   #RADZON 6   #VALZON 7                 D                             4                                 D                             5                             
  p          p            p                                      D                             6                             
            &                                                       D                             7            `                 
            &                                                       D                             8            8             #HETE1_DIST_TYPE 9                                         y#HETE1_DIST_TYPE 9                                                                Ā  @                         9     '                    #NX :   #NZ ;   #X0 <   #Z0 =   #DX >   #DZ ?   #VAL @                 D                             :                                 D                             ;                                D                             <               
                 D                             =               
                 D                             >               
                 D                             ?                
               D                             @            (                 
            &                   &                                                                                     A                          #PROP_INPUT_LINK_TYPE                                          y#PROP_INPUT_LINK_TYPE                                                               D                              B                          #PROP_ELEM_LINK_TYPE C                                         y#PROP_ELEM_LINK_TYPE C                                                                @  @                         C     '                     #NAME D   #DATA E   #NEXT K                                             D                                                                                  	       	              C                                                                        E                          #PROP_ELEM_TYPE F                  Ā  @                         F     '                    #HOMO G   #HETE H                D                             G               
                                                
                                 0D0                D                             H     `                    #HETE_TYPE I                                         y#HETE_TYPE I                                                                @  @                         I     '`                    #V J                                           J                             
            &                   &                                                                                 y
                                                                                         K                          #PROP_ELEM_LINK_TYPE C                                         y#PROP_ELEM_LINK_TYPE C                                                                    @                          L     'Č                   #NBODY M   #MU N   #LAMBDA O   #THETA P   #EL Q   #ETOT_OLD R   #WBODY S                 D                              M                                 D                              N               
                 D                              O               
              D                              P                            
            &                   &                                                                                 y
                                                         D                              Q            x                
            &                   &                   &                   &                                                                                 y
                                                          D                              R                           
            &                   &                   &                                                                                 y
                                                          D                              S                           
            &                                                                                 y
                                                         @@                               T                      @                                U            %         @                                V                           #M W             
  @                               W                   #MATPRO_ELEM_TYPE    #         @                                   X                    #INPUT Y   #IIN Z                                      
D @                               Y     0               #MATPRO_INPUT_TYPE              
                                  Z           #         @                                   [                    #ELEM \   #ECOORD ]             
D @                               \                    #MATPRO_ELEM_TYPE              
  @                               ]                   
              &                   &                   &                                           #         @                                   ^                    #M _   #P `   #NGLL a             
D @                               _     Č              #MATWRK_VISCO_TYPE L             
  @                               `                   #MATPRO_ELEM_TYPE              
                                  a           #         @                                   b                    #S c   #ETOT e   #M f   #NGLL d   #DT g            D                                 c                    
 	        p        5  p        r d   p        5  p        r d   p          5  p        r d     5  p        r d     p            5  p        r d     5  p        r d     p                                   
                                  e                    
        p        5  p        r d   p        5  p        r d   p          5  p        r d     5  p        r d     p            5  p        r d     5  p        r d     p                                    
D                                 f     Č              #MATWRK_VISCO_TYPE L             
                                  d                     
                                  g     
                    fn#fn    Ā   Ē   b   uapp(MAT_VISCO    b  @   J  PROP_MAT    Ē  I   J  STDIO *   ë  e       MATPRO_ELEM_TYPE+PROP_MAT 6   P  Þ   %   MATPRO_ELEM_TYPE%INPUT+PROP_MAT=INPUT +   .  d       MATPRO_INPUT_TYPE+PROP_MAT 5     ø   %   MATPRO_INPUT_TYPE%KIND+PROP_MAT=KIND 5     ä   %   MATPRO_INPUT_TYPE%LIST+PROP_MAT=LIST .   n  n      PROP_INPUT_LINK_TYPE+PROP_MAT 3   Ü  Å   a   PROP_INPUT_LINK_TYPE%NAME+PROP_MAT 3   Ą  ]   a   PROP_INPUT_LINK_TYPE%DATA+PROP_MAT (   þ  ^      CD_TYPE+DISTRIBUTION_CD ,   \  §   %   CD_TYPE%C+DISTRIBUTION_CD=C ,     Þ   %   CD_TYPE%D+DISTRIBUTION_CD=D 7   á  ą      DISTRIBUTION_TYPE+DISTRIBUTION_GENERAL A   	  Ĩ   %   DISTRIBUTION_TYPE%KIND+DISTRIBUTION_GENERAL=KIND E   7
  Ü   %   DISTRIBUTION_TYPE%ORDER0+DISTRIBUTION_GENERAL=ORDER0 5           ORDER0_DIST_TYPE+DISTRIBUTION_ORDER0 G   Ē  H   %   ORDER0_DIST_TYPE%X_NZONES+DISTRIBUTION_ORDER0=X_NZONES G   ę  H   %   ORDER0_DIST_TYPE%Z_NZONES+DISTRIBUTION_ORDER0=Z_NZONES E   2     %   ORDER0_DIST_TYPE%X_BOUND+DISTRIBUTION_ORDER0=X_BOUND E   Æ     %   ORDER0_DIST_TYPE%Z_BOUND+DISTRIBUTION_ORDER0=Z_BOUND =   Z  Ž   %   ORDER0_DIST_TYPE%VAL+DISTRIBUTION_ORDER0=VAL I     ā   %   DISTRIBUTION_TYPE%GAUSSIAN+DISTRIBUTION_GENERAL=GAUSSIAN 9   æ        GAUSSIAN_DIST_TYPE+DISTRIBUTION_GAUSSIAN A   {  §   %   GAUSSIAN_DIST_TYPE%X_0+DISTRIBUTION_GAUSSIAN=X_0 A   "  §   %   GAUSSIAN_DIST_TYPE%Z_0+DISTRIBUTION_GAUSSIAN=Z_0 ?   É  §   %   GAUSSIAN_DIST_TYPE%LX+DISTRIBUTION_GAUSSIAN=LX ?   p  §   %   GAUSSIAN_DIST_TYPE%LZ+DISTRIBUTION_GAUSSIAN=LZ I     §   %   GAUSSIAN_DIST_TYPE%LEVEL_0+DISTRIBUTION_GAUSSIAN=LEVEL_0 E   ū  §   %   GAUSSIAN_DIST_TYPE%AMPLI+DISTRIBUTION_GAUSSIAN=AMPLI E   e  Ĩ   %   GAUSSIAN_DIST_TYPE%ORDER+DISTRIBUTION_GAUSSIAN=ORDER E   
  Ü   %   DISTRIBUTION_TYPE%SPLINE+DISTRIBUTION_GENERAL=SPLINE 5   æ  i      SPLINE_DIST_TYPE+DISTRIBUTION_SPLINE =   O  Ĩ   %   SPLINE_DIST_TYPE%DIM+DISTRIBUTION_SPLINE=DIM 9   ô  ô   %   SPLINE_DIST_TYPE%X+DISTRIBUTION_SPLINE=X =   č  ô   %   SPLINE_DIST_TYPE%VAL+DISTRIBUTION_SPLINE=VAL E   Ü  Ü   %   DISTRIBUTION_TYPE%LINEAR+DISTRIBUTION_GENERAL=LINEAR 5   ļ        LINEAR_DIST_TYPE+DISTRIBUTION_LINEAR =   7  Ĩ   %   LINEAR_DIST_TYPE%DIM+DISTRIBUTION_LINEAR=DIM W   Ü  §   %   LINEAR_DIST_TYPE%SMOOTHING_LENGTH+DISTRIBUTION_LINEAR=SMOOTHING_LENGTH 9     ô   %   LINEAR_DIST_TYPE%X+DISTRIBUTION_LINEAR=X =   w  ô   %   LINEAR_DIST_TYPE%VAL+DISTRIBUTION_LINEAR=VAL I   k  ā   %   DISTRIBUTION_TYPE%GRADIENT+DISTRIBUTION_GENERAL=GRADIENT 9   K        GRADIENT_DIST_TYPE+DISTRIBUTION_GRADIENT C   Ę  H   %   GRADIENT_DIST_TYPE%GRAD+DISTRIBUTION_GRADIENT=GRAD E     H   %   GRADIENT_DIST_TYPE%ANGLE+DISTRIBUTION_GRADIENT=ANGLE G   Z  H   %   GRADIENT_DIST_TYPE%VALREF+DISTRIBUTION_GRADIENT=VALREF =   Ē     %   GRADIENT_DIST_TYPE%X+DISTRIBUTION_GRADIENT=X =   6     %   GRADIENT_DIST_TYPE%Y+DISTRIBUTION_GRADIENT=Y E   Ę  Ü   %   DISTRIBUTION_TYPE%PWCONR+DISTRIBUTION_GENERAL=PWCONR 5   Ķ         PWCONR_DIST_TYPE+DISTRIBUTION_PWCONR C   &!  H   %   PWCONR_DIST_TYPE%NUMZON+DISTRIBUTION_PWCONR=NUMZON C   n!     %   PWCONR_DIST_TYPE%REFPNT+DISTRIBUTION_PWCONR=REFPNT C   
"     %   PWCONR_DIST_TYPE%RADZON+DISTRIBUTION_PWCONR=RADZON C   "     %   PWCONR_DIST_TYPE%VALZON+DISTRIBUTION_PWCONR=VALZON C   2#  Ú   %   DISTRIBUTION_TYPE%HETE1+DISTRIBUTION_GENERAL=HETE1 3   $        HETE1_DIST_TYPE+DISTRIBUTION_HETE1 9   $  H   %   HETE1_DIST_TYPE%NX+DISTRIBUTION_HETE1=NX 9   Ý$  H   %   HETE1_DIST_TYPE%NZ+DISTRIBUTION_HETE1=NZ 9   %%  H   %   HETE1_DIST_TYPE%X0+DISTRIBUTION_HETE1=X0 9   m%  H   %   HETE1_DIST_TYPE%Z0+DISTRIBUTION_HETE1=Z0 9   ĩ%  H   %   HETE1_DIST_TYPE%DX+DISTRIBUTION_HETE1=DX 9   ý%  H   %   HETE1_DIST_TYPE%DZ+DISTRIBUTION_HETE1=DZ ;   E&  Ž   %   HETE1_DIST_TYPE%VAL+DISTRIBUTION_HETE1=VAL 3   ņ&  ä   a   PROP_INPUT_LINK_TYPE%NEXT+PROP_MAT 4   Õ'  â   %   MATPRO_ELEM_TYPE%LIST+PROP_MAT=LIST -   ·(  n      PROP_ELEM_LINK_TYPE+PROP_MAT 2   %)  Å   a   PROP_ELEM_LINK_TYPE%NAME+PROP_MAT 2   ę)  d   a   PROP_ELEM_LINK_TYPE%DATA+PROP_MAT )   N*  d      PROP_ELEM_TYPE+PROP_ELEM 3   ē*  §   %   PROP_ELEM_TYPE%HOMO+PROP_ELEM=HOMO 3   Y+  Î   %   PROP_ELEM_TYPE%HETE+PROP_ELEM=HETE $   ',  W      HETE_TYPE+PROP_ELEM &   ~,    a   HETE_TYPE%V+PROP_ELEM 2   -  â   a   PROP_ELEM_LINK_TYPE%NEXT+PROP_MAT "   l.         MATWRK_VISCO_TYPE (   /  H   !   MATWRK_VISCO_TYPE%NBODY %   O/  H   !   MATWRK_VISCO_TYPE%MU )   /  H   !   MATWRK_VISCO_TYPE%LAMBDA (   ß/    !   MATWRK_VISCO_TYPE%THETA %   ë0  <  !   MATWRK_VISCO_TYPE%EL +   '2  $  !   MATWRK_VISCO_TYPE%ETOT_OLD (   K3  ô   !   MATWRK_VISCO_TYPE%WBODY !   ?4  @       MAT_VISCO_MEMPRO !   4  @       MAT_VISCO_MEMWRK    ŋ4  W       MAT_ISVISCO    5  ^   a   MAT_ISVISCO%M    t5  u       MAT_VISCO_READ %   é5  _   a   MAT_VISCO_READ%INPUT #   H6  @   a   MAT_VISCO_READ%IIN )   6  ^       MAT_VISCO_INIT_ELEM_PROP .   æ6  ^   a   MAT_VISCO_INIT_ELEM_PROP%ELEM 0   D7  ž   a   MAT_VISCO_INIT_ELEM_PROP%ECOORD )    8  `       MAT_VISCO_INIT_ELEM_WORK +   `8  _   a   MAT_VISCO_INIT_ELEM_WORK%M +   ŋ8  ^   a   MAT_VISCO_INIT_ELEM_WORK%P .   9  @   a   MAT_VISCO_INIT_ELEM_WORK%NGLL !   ]9  r       MAT_VISCO_STRESS #   Ï9  t  a   MAT_VISCO_STRESS%S &   C;  t  a   MAT_VISCO_STRESS%ETOT #   ·<  _   a   MAT_VISCO_STRESS%M &   =  @   a   MAT_VISCO_STRESS%NGLL $   V=  @   a   MAT_VISCO_STRESS%DT 