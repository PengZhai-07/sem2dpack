  4r  µ   k820309    ð          2021.7.1    Ï,´c                                                                                                          
       mesh_gen.f90 MESH_GEN              MESH_TYPE MESH_READ MESH_BUILD MESH_H                      @                              
                            @                              
                            @                              
                            @                              
                @          @                              
       FEM_GRID_TYPE               @  @                              '¸                   #NPOIN    #NGNOD    #NELEM 	   #COORD 
   #KNODS    #TAG    #REF    #BNDS    #FLAT    #EDGECONN_ELEM    #EDGECONN_EDGE    #VERTEXCONN                 $                                                                        Ý                                                      0                 $                                                                       Ý                                                      0                 $                              	                                         Ý                                                      0               $                              
                            
            &                   &                                                                   Ý              y
                                                          $                                          p                            &                   &                                                                   Ý              y                                                          $                                          Ð                            &                                                                   Ý              y                                                          $                                                                     &                                                                   Ý              y                                                         $                                          `      H           #BND_GRID_TYPE              &                                                                   Ý              y#BND_GRID_TYPE                                                                  @  @                              'H                   #NELEM    #NPOIN    #NGNOD    #TAG    #IBOOL    #ELEM    #EDGE    #NODE                 $                                                                        Ý                                                      0                 $                                                                       Ý                                                      0                 $                                                                       Ý                                                      0                 $                                                                       Ý                                                      0               $                                                                      &                   &                                                                   Ý              y                                                          $                                          p                            &                                                                   Ý              y                                                          $                                          ¸                            &                                                                   Ý              y                                                          $                                                                      &                                                                   Ý              y                                                            $                                   ¨      	                             Ý                                                                        $                                          °             
              &                   &                                                                   Ý              y                                                          $                                                                     &                   &                                                                   Ý              y                                                          $                                          p                  #VERTEXCONN_TYPE              &                                                                   Ý              y#VERTEXCONN_TYPE                                                                  @  @                              '                    #ELEM    #NODE              $                                                                       &                                                                   Ý              y                                                          $                                          H                            &                                                                   Ý              y                                                             À  @                              '                    #XMIN     #XMAX !   #ZMIN "   #NLAYER #   #NGNOD $   #NZ %   #NX &   #EZFLT '   #FZTAG (   #FZNZ )   #LAYER *                 D                                               
                 D                              !               
                 D                              "               
                 D                              #                                D                              $                                D                              %                                 D                              &     $                           D                              '     (                           D                              (     ,       	                    D                              )     0       
                 D                              *            8       X           #LAYER_TYPE +             &                                                                   Ý              y#LAYER_TYPE +                                                                @  @                         +     'X                   #NEZ ,   #TAG -   #TOP .   #ZTOPIN /   #QC_SPLINE f                                              ,                                          Ý                                                      0                                               -                                         Ý                                                      0                                             .                            
            &                   &                                                                   Ý              y
                                                                                           /            h              #CD_TYPE 0                  À  @                         0     '                    #C 1   #D 2                D                             1               
                           Ý                     
                                 0D0                D                             2     @                    #DISTRIBUTION_TYPE 3                           Ý              y#DISTRIBUTION_TYPE 3                                                                 À  @                         3     '@                    #KIND 4   #ORDER0 5   #GAUSSIAN <   #SPLINE E   #LINEAR J   #GRADIENT P   #PWCONR W   #HETE1 ]                D                             4                                          Ý                                                      0                D                             5     ø                    #ORDER0_DIST_TYPE 6                           Ý              y#ORDER0_DIST_TYPE 6                                                                À  @                         6     'ø                    #X_NZONES 7   #Z_NZONES 8   #X_BOUND 9   #Z_BOUND :   #VAL ;                 D                             7                                 D                             8                              D                             9                             
            &                                                       D                             :            P                 
            &                                                       D                             ;                             
            &                   &                                                       D                             <     8                    #GAUSSIAN_DIST_TYPE =                           Ý              y#GAUSSIAN_DIST_TYPE =                                                                À  @                         =     '8                    #X_0 >   #Z_0 ?   #LX @   #LZ A   #LEVEL_0 B   #AMPLI C   #ORDER D                D                             >               
                           Ý                     
                                 0D0                 D                             ?              
                           Ý                     
                                 0D0                 D                             @              
                           Ý                     
                       ð?        1D0                 D                             A              
                           Ý                     
                       ð?        1D0                 D                             B               
                           Ý                     
                                 0D0                 D                             C     (         
                           Ý                     
                       ð?        1D0                 D                             D     0                                    Ý                                                     1                D                             E                         #SPLINE_DIST_TYPE F                           Ý              y#SPLINE_DIST_TYPE F                                                                À  @                         F     '                    #DIM G   #X H   #VAL I                D                             G                                          Ý                                                     1               D                             H                            
            &                                                                   Ý              y
                                                          D                             I            P                
            &                                                                   Ý              y
                                                           D                             J                           #LINEAR_DIST_TYPE K                           Ý              y#LINEAR_DIST_TYPE K                                                                À  @                         K     '                     #DIM L   #SMOOTHING_LENGTH M   #X N   #VAL O                D                             L                                          Ý                                                     1                 D                             M              
                           Ý                     
                                 0D0               D                             N                            
            &                                                                   Ý              y
                                                          D                             O            X                
            &                                                                   Ý              y
                                                           D                             P     ¨       (             #GRADIENT_DIST_TYPE Q                           Ý              y#GRADIENT_DIST_TYPE Q                                                                À  @                         Q     '¨                    #GRAD R   #ANGLE S   #VALREF T   #X U   #Y V                 D                             R                
                 D                             S               
                 D                             T               
              D                             U                             
            &                                                       D                             V            `                 
            &                                                       D                             W     ¨       0             #PWCONR_DIST_TYPE X                           Ý              y#PWCONR_DIST_TYPE X                                                                À  @                         X     '¨                    #NUMZON Y   #REFPNT Z   #RADZON [   #VALZON \                 D                             Y                                 D                             Z                             
  p          p            p                                      D                             [                             
            &                                                       D                             \            `                 
            &                                                       D                             ]            8             #HETE1_DIST_TYPE ^                           Ý              y#HETE1_DIST_TYPE ^                                                                À  @                         ^     '                    #NX _   #NZ `   #X0 a   #Z0 b   #DX c   #DZ d   #VAL e                 D                             _                                 D                             `                                D                             a               
                 D                             b               
                 D                             c               
                 D                             d                
               D                             e            (                 
            &                   &                                                                                       f     à       x              #QC_SPLINE_TYPE g                 @  @                         g     'à                    #N h   #KIND i   #X j   #Y k   #DY l                                              h                                          Ý                                                      0                                               i                                         Ý                                                      0                                             j                            
            &                                                                   Ý              y
                                                                                        k            P                
            &                                                                   Ý              y
                                                                                        l                            
            &                                                                   Ý              y
                                                              @  @                         m     '                    #TAG n   #EX o   #EZ p                                               n                                                               o                               p          p            p                                                                      p                               p          p            p                                        @  @                          q     '¸                   #NPOIN r   #NGNOD s   #NELEM t   #COORD u   #KNODS v   #TAG w   #REF x   #BNDS y   #FLAT z   #EDGECONN_ELEM {   #EDGECONN_EDGE |   #VERTEXCONN }                $                              r                                          Ý                                                      0                 $                              s                                         Ý                                                      0                 $                              t                                         Ý                                                      0              $                              u                            
            &                   &                                                                   Ý              y
                                                         $                              v            p                            &                   &                                                                   Ý              y                                                         $                              w            Ð                            &                                                                   Ý              y                                                          $                              x                                       &                                                                   Ý              y                                                         $                              y            `      H           #BND_GRID_TYPE              &                                                                   Ý              y#BND_GRID_TYPE                                                                $                              z     ¨      	                             Ý                                                                        $                              {            °             
              &                   &                                                                   Ý              y                                                          $                              |                                       &                   &                                                                   Ý              y                                                          $                              }            p                  #VERTEXCONN_TYPE              &                                                                   Ý              y#VERTEXCONN_TYPE                                                                     @                          ~     '(                    #KIND    #CART    #LAYERS    #EMC2    #MESH2D                  D                                                              D                                                        #MESH_CART_TYPE                  À  @                               '                    #XMIN    #XMAX    #ZMIN    #ZMAX    #SPLITD    #NDOM    #NZ    #NX    #EZFLT    #FZTAG    #FZNZ    #SPLIT    #DOMAINS                  D                                              
                 D                                             
                 D                                             
                 D                                             
                 D                                              
                 D                                   (                           D                                   ,                           D                                   0                           D                                   4       	                    D                                   8       
                    D                                   <                           D                                   @                         D                                          H                    #DOMAIN_TYPE m             &                                                        D                                                        #MESH_LAYERS_TYPE                 D                                   ¸                    #FEM_GRID_TYPE                 D                                   ¸                     #FEM_GRID_TYPE    #         @                                                       #MESH    #IIN                                  D @                                    (               #MESH_TYPE ~             
  @                                          #         @                                                      #MESH_BUILD%VERTEXCONN_TYPE    #MESH_BUILD%BND_GRID_TYPE    #MESH_BUILD%FEM_GRID_TYPE ¢   #GRID ¯   #MESH °                                                                                     @                              '                    #ELEM    #NODE              $                                                                       &                                                                   Ý              y                                                          $                                          H                            &                                                                   Ý              y                                                              @  @                              'H                   #NELEM    #NPOIN    #NGNOD    #TAG    #IBOOL    #ELEM    #EDGE     #NODE ¡                $                                                                        Ý                                                      0                 $                                                                       Ý                                                      0                 $                                                                       Ý                                                      0                 $                                                                       Ý                                                      0               $                                                                      &                   &                                                                   Ý              y                                                          $                                          p                            &                                                                   Ý              y                                                          $                                           ¸                            &                                                                   Ý              y                                                          $                              ¡                                        &                                                                   Ý              y                                                                 @                          ¢     '¸                   #NPOIN £   #NGNOD ¤   #NELEM ¥   #COORD ¦   #KNODS §   #TAG ¨   #REF ©   #BNDS ª   #FLAT «   #EDGECONN_ELEM ¬   #EDGECONN_EDGE ­   #VERTEXCONN ®                $                              £                                          Ý                                                      0                 $                              ¤                                         Ý                                                      0                 $                              ¥                                         Ý                                                      0               $                              ¦                            
            &                   &                                                                   Ý              y
                                                          $                              §            p                            &                   &                                                                   Ý              y                                                          $                              ¨            Ð                            &                                                                   Ý              y                                                          $                              ©                                       &                                                                   Ý              y                                                         $                              ª            `      H           #MESH_BUILD%BND_GRID_TYPE              &                                                                   Ý              y#MESH_BUILD%BND_GRID_TYPE                                                                $                              «     ¨      	                             Ý                                                                        $                              ¬            °             
              &                   &                                                                   Ý              y                                                          $                              ­                                       &                   &                                                                   Ý              y                                                          $                              ®            p                  #MESH_BUILD%VERTEXCONN_TYPE              &                                                                   Ý              y#MESH_BUILD%VERTEXCONN_TYPE                                                             
D @                               ¯     ¸              #MESH_BUILD%FEM_GRID_TYPE ¢             
 @                               °     (               #MESH_TYPE ~   #         @                                   ±                    #MESH ²   #H ³             
                                  ²     (              #MESH_TYPE ~             D @                               ³     
                    fn#fn    ¾   6   b   uapp(MESH_GEN    ô   @   J  MESH_CARTESIAN    4  @   J  MESH_LAYERS    t  @   J  MESH_EMC2    ´  @   J  MESH_MESH2D    ô  N   J  FEM_GRID '   B  ã      FEM_GRID_TYPE+FEM_GRID -   %  ¥   a   FEM_GRID_TYPE%NPOIN+FEM_GRID -   Ê  ¥   a   FEM_GRID_TYPE%NGNOD+FEM_GRID -   o  ¥   a   FEM_GRID_TYPE%NELEM+FEM_GRID -       a   FEM_GRID_TYPE%COORD+FEM_GRID -        a   FEM_GRID_TYPE%KNODS+FEM_GRID +   ,  ô   a   FEM_GRID_TYPE%TAG+FEM_GRID +      ô   a   FEM_GRID_TYPE%REF+FEM_GRID ,   	    a   FEM_GRID_TYPE%BNDS+FEM_GRID '   .
  £      BND_GRID_TYPE+BND_GRID -   Ñ
  ¥   a   BND_GRID_TYPE%NELEM+BND_GRID -   v  ¥   a   BND_GRID_TYPE%NPOIN+BND_GRID -     ¥   a   BND_GRID_TYPE%NGNOD+BND_GRID +   À  ¥   a   BND_GRID_TYPE%TAG+BND_GRID -   e    a   BND_GRID_TYPE%IBOOL+BND_GRID ,   q  ô   a   BND_GRID_TYPE%ELEM+BND_GRID ,   e  ô   a   BND_GRID_TYPE%EDGE+BND_GRID ,   Y  ô   a   BND_GRID_TYPE%NODE+BND_GRID ,   M  ¤   a   FEM_GRID_TYPE%FLAT+FEM_GRID 5   ñ    a   FEM_GRID_TYPE%EDGECONN_ELEM+FEM_GRID 5   ý    a   FEM_GRID_TYPE%EDGECONN_EDGE+FEM_GRID 2   	    a   FEM_GRID_TYPE%VERTEXCONN+FEM_GRID )   '  d      VERTEXCONN_TYPE+FEM_GRID .     ô   a   VERTEXCONN_TYPE%ELEM+FEM_GRID .     ô   a   VERTEXCONN_TYPE%NODE+FEM_GRID -   s  À      MESH_LAYERS_TYPE+MESH_LAYERS 7   3  H   %   MESH_LAYERS_TYPE%XMIN+MESH_LAYERS=XMIN 7   {  H   %   MESH_LAYERS_TYPE%XMAX+MESH_LAYERS=XMAX 7   Ã  H   %   MESH_LAYERS_TYPE%ZMIN+MESH_LAYERS=ZMIN ;     H   %   MESH_LAYERS_TYPE%NLAYER+MESH_LAYERS=NLAYER 9   S  H   %   MESH_LAYERS_TYPE%NGNOD+MESH_LAYERS=NGNOD 3     H   %   MESH_LAYERS_TYPE%NZ+MESH_LAYERS=NZ 3   ã  H   %   MESH_LAYERS_TYPE%NX+MESH_LAYERS=NX 9   +  H   %   MESH_LAYERS_TYPE%EZFLT+MESH_LAYERS=EZFLT 9   s  H   %   MESH_LAYERS_TYPE%FZTAG+MESH_LAYERS=FZTAG 7   »  H   %   MESH_LAYERS_TYPE%FZNZ+MESH_LAYERS=FZNZ 9       %   MESH_LAYERS_TYPE%LAYER+MESH_LAYERS=LAYER '           LAYER_TYPE+MESH_LAYERS +     ¥   a   LAYER_TYPE%NEZ+MESH_LAYERS +   B  ¥   a   LAYER_TYPE%TAG+MESH_LAYERS +   ç    a   LAYER_TYPE%TOP+MESH_LAYERS .   ó  ]   a   LAYER_TYPE%ZTOPIN+MESH_LAYERS (   P  ^      CD_TYPE+DISTRIBUTION_CD ,   ®  §   %   CD_TYPE%C+DISTRIBUTION_CD=C ,   U   Þ   %   CD_TYPE%D+DISTRIBUTION_CD=D 7   3!  ±      DISTRIBUTION_TYPE+DISTRIBUTION_GENERAL A   ä!  ¥   %   DISTRIBUTION_TYPE%KIND+DISTRIBUTION_GENERAL=KIND E   "  Ü   %   DISTRIBUTION_TYPE%ORDER0+DISTRIBUTION_GENERAL=ORDER0 5   e#        ORDER0_DIST_TYPE+DISTRIBUTION_ORDER0 G   ô#  H   %   ORDER0_DIST_TYPE%X_NZONES+DISTRIBUTION_ORDER0=X_NZONES G   <$  H   %   ORDER0_DIST_TYPE%Z_NZONES+DISTRIBUTION_ORDER0=Z_NZONES E   $     %   ORDER0_DIST_TYPE%X_BOUND+DISTRIBUTION_ORDER0=X_BOUND E   %     %   ORDER0_DIST_TYPE%Z_BOUND+DISTRIBUTION_ORDER0=Z_BOUND =   ¬%  ¬   %   ORDER0_DIST_TYPE%VAL+DISTRIBUTION_ORDER0=VAL I   X&  à   %   DISTRIBUTION_TYPE%GAUSSIAN+DISTRIBUTION_GENERAL=GAUSSIAN 9   8'        GAUSSIAN_DIST_TYPE+DISTRIBUTION_GAUSSIAN A   Í'  §   %   GAUSSIAN_DIST_TYPE%X_0+DISTRIBUTION_GAUSSIAN=X_0 A   t(  §   %   GAUSSIAN_DIST_TYPE%Z_0+DISTRIBUTION_GAUSSIAN=Z_0 ?   )  §   %   GAUSSIAN_DIST_TYPE%LX+DISTRIBUTION_GAUSSIAN=LX ?   Â)  §   %   GAUSSIAN_DIST_TYPE%LZ+DISTRIBUTION_GAUSSIAN=LZ I   i*  §   %   GAUSSIAN_DIST_TYPE%LEVEL_0+DISTRIBUTION_GAUSSIAN=LEVEL_0 E   +  §   %   GAUSSIAN_DIST_TYPE%AMPLI+DISTRIBUTION_GAUSSIAN=AMPLI E   ·+  ¥   %   GAUSSIAN_DIST_TYPE%ORDER+DISTRIBUTION_GAUSSIAN=ORDER E   \,  Ü   %   DISTRIBUTION_TYPE%SPLINE+DISTRIBUTION_GENERAL=SPLINE 5   8-  i      SPLINE_DIST_TYPE+DISTRIBUTION_SPLINE =   ¡-  ¥   %   SPLINE_DIST_TYPE%DIM+DISTRIBUTION_SPLINE=DIM 9   F.  ô   %   SPLINE_DIST_TYPE%X+DISTRIBUTION_SPLINE=X =   :/  ô   %   SPLINE_DIST_TYPE%VAL+DISTRIBUTION_SPLINE=VAL E   .0  Ü   %   DISTRIBUTION_TYPE%LINEAR+DISTRIBUTION_GENERAL=LINEAR 5   
1        LINEAR_DIST_TYPE+DISTRIBUTION_LINEAR =   1  ¥   %   LINEAR_DIST_TYPE%DIM+DISTRIBUTION_LINEAR=DIM W   .2  §   %   LINEAR_DIST_TYPE%SMOOTHING_LENGTH+DISTRIBUTION_LINEAR=SMOOTHING_LENGTH 9   Õ2  ô   %   LINEAR_DIST_TYPE%X+DISTRIBUTION_LINEAR=X =   É3  ô   %   LINEAR_DIST_TYPE%VAL+DISTRIBUTION_LINEAR=VAL I   ½4  à   %   DISTRIBUTION_TYPE%GRADIENT+DISTRIBUTION_GENERAL=GRADIENT 9   5        GRADIENT_DIST_TYPE+DISTRIBUTION_GRADIENT C   6  H   %   GRADIENT_DIST_TYPE%GRAD+DISTRIBUTION_GRADIENT=GRAD E   d6  H   %   GRADIENT_DIST_TYPE%ANGLE+DISTRIBUTION_GRADIENT=ANGLE G   ¬6  H   %   GRADIENT_DIST_TYPE%VALREF+DISTRIBUTION_GRADIENT=VALREF =   ô6     %   GRADIENT_DIST_TYPE%X+DISTRIBUTION_GRADIENT=X =   7     %   GRADIENT_DIST_TYPE%Y+DISTRIBUTION_GRADIENT=Y E   8  Ü   %   DISTRIBUTION_TYPE%PWCONR+DISTRIBUTION_GENERAL=PWCONR 5   ø8        PWCONR_DIST_TYPE+DISTRIBUTION_PWCONR C   x9  H   %   PWCONR_DIST_TYPE%NUMZON+DISTRIBUTION_PWCONR=NUMZON C   À9     %   PWCONR_DIST_TYPE%REFPNT+DISTRIBUTION_PWCONR=REFPNT C   \:     %   PWCONR_DIST_TYPE%RADZON+DISTRIBUTION_PWCONR=RADZON C   ð:     %   PWCONR_DIST_TYPE%VALZON+DISTRIBUTION_PWCONR=VALZON C   ;  Ú   %   DISTRIBUTION_TYPE%HETE1+DISTRIBUTION_GENERAL=HETE1 3   ^<        HETE1_DIST_TYPE+DISTRIBUTION_HETE1 9   ç<  H   %   HETE1_DIST_TYPE%NX+DISTRIBUTION_HETE1=NX 9   /=  H   %   HETE1_DIST_TYPE%NZ+DISTRIBUTION_HETE1=NZ 9   w=  H   %   HETE1_DIST_TYPE%X0+DISTRIBUTION_HETE1=X0 9   ¿=  H   %   HETE1_DIST_TYPE%Z0+DISTRIBUTION_HETE1=Z0 9   >  H   %   HETE1_DIST_TYPE%DX+DISTRIBUTION_HETE1=DX 9   O>  H   %   HETE1_DIST_TYPE%DZ+DISTRIBUTION_HETE1=DZ ;   >  ¬   %   HETE1_DIST_TYPE%VAL+DISTRIBUTION_HETE1=VAL 1   C?  d   a   LAYER_TYPE%QC_SPLINE+MESH_LAYERS +   §?  w      QC_SPLINE_TYPE+MESH_LAYERS -   @  ¥   a   QC_SPLINE_TYPE%N+MESH_LAYERS 0   Ã@  ¥   a   QC_SPLINE_TYPE%KIND+MESH_LAYERS -   hA  ô   a   QC_SPLINE_TYPE%X+MESH_LAYERS -   \B  ô   a   QC_SPLINE_TYPE%Y+MESH_LAYERS .   PC  ô   a   QC_SPLINE_TYPE%DY+MESH_LAYERS +   DD  i      DOMAIN_TYPE+MESH_CARTESIAN /   ­D  H   a   DOMAIN_TYPE%TAG+MESH_CARTESIAN .   õD     a   DOMAIN_TYPE%EX+MESH_CARTESIAN .   E     a   DOMAIN_TYPE%EZ+MESH_CARTESIAN '   -F  ã      FEM_GRID_TYPE+FEM_GRID -   G  ¥   a   FEM_GRID_TYPE%NPOIN+FEM_GRID -   µG  ¥   a   FEM_GRID_TYPE%NGNOD+FEM_GRID -   ZH  ¥   a   FEM_GRID_TYPE%NELEM+FEM_GRID -   ÿH    a   FEM_GRID_TYPE%COORD+FEM_GRID -   J    a   FEM_GRID_TYPE%KNODS+FEM_GRID +   K  ô   a   FEM_GRID_TYPE%TAG+FEM_GRID +   L  ô   a   FEM_GRID_TYPE%REF+FEM_GRID ,   ÿL    a   FEM_GRID_TYPE%BNDS+FEM_GRID ,   N  ¤   a   FEM_GRID_TYPE%FLAT+FEM_GRID 5   ½N    a   FEM_GRID_TYPE%EDGECONN_ELEM+FEM_GRID 5   ÉO    a   FEM_GRID_TYPE%EDGECONN_EDGE+FEM_GRID 2   ÕP    a   FEM_GRID_TYPE%VERTEXCONN+FEM_GRID    óQ         MESH_TYPE    yR  H   !   MESH_TYPE%KIND    ÁR  d   !   MESH_TYPE%CART .   %S  Ö      MESH_CART_TYPE+MESH_CARTESIAN 8   ûS  H   %   MESH_CART_TYPE%XMIN+MESH_CARTESIAN=XMIN 8   CT  H   %   MESH_CART_TYPE%XMAX+MESH_CARTESIAN=XMAX 8   T  H   %   MESH_CART_TYPE%ZMIN+MESH_CARTESIAN=ZMIN 8   ÓT  H   %   MESH_CART_TYPE%ZMAX+MESH_CARTESIAN=ZMAX <   U  H   %   MESH_CART_TYPE%SPLITD+MESH_CARTESIAN=SPLITD 8   cU  H   %   MESH_CART_TYPE%NDOM+MESH_CARTESIAN=NDOM 4   «U  H   %   MESH_CART_TYPE%NZ+MESH_CARTESIAN=NZ 4   óU  H   %   MESH_CART_TYPE%NX+MESH_CARTESIAN=NX :   ;V  H   %   MESH_CART_TYPE%EZFLT+MESH_CARTESIAN=EZFLT :   V  H   %   MESH_CART_TYPE%FZTAG+MESH_CARTESIAN=FZTAG 8   ËV  H   %   MESH_CART_TYPE%FZNZ+MESH_CARTESIAN=FZNZ :   W  H   %   MESH_CART_TYPE%SPLIT+MESH_CARTESIAN=SPLIT >   [W  ¥   %   MESH_CART_TYPE%DOMAINS+MESH_CARTESIAN=DOMAINS !    X  f   !   MESH_TYPE%LAYERS    fX  c   !   MESH_TYPE%EMC2 !   ÉX  c   !   MESH_TYPE%MESH2D    ,Y  o       MESH_READ    Y  W   a   MESH_READ%MESH    òY  @   a   MESH_READ%IIN    2Z  ø       MESH_BUILD D   *[  d      MESH_BUILD%VERTEXCONN_TYPE+FEM_GRID=VERTEXCONN_TYPE 9   [  ô   a   MESH_BUILD%VERTEXCONN_TYPE%ELEM+FEM_GRID 9   \  ô   a   MESH_BUILD%VERTEXCONN_TYPE%NODE+FEM_GRID @   v]  £      MESH_BUILD%BND_GRID_TYPE+BND_GRID=BND_GRID_TYPE 8   ^  ¥   a   MESH_BUILD%BND_GRID_TYPE%NELEM+BND_GRID 8   ¾^  ¥   a   MESH_BUILD%BND_GRID_TYPE%NPOIN+BND_GRID 8   c_  ¥   a   MESH_BUILD%BND_GRID_TYPE%NGNOD+BND_GRID 6   `  ¥   a   MESH_BUILD%BND_GRID_TYPE%TAG+BND_GRID 8   ­`    a   MESH_BUILD%BND_GRID_TYPE%IBOOL+BND_GRID 7   ¹a  ô   a   MESH_BUILD%BND_GRID_TYPE%ELEM+BND_GRID 7   ­b  ô   a   MESH_BUILD%BND_GRID_TYPE%EDGE+BND_GRID 7   ¡c  ô   a   MESH_BUILD%BND_GRID_TYPE%NODE+BND_GRID 2   d  ã      MESH_BUILD%FEM_GRID_TYPE+FEM_GRID 8   xe  ¥   a   MESH_BUILD%FEM_GRID_TYPE%NPOIN+FEM_GRID 8   f  ¥   a   MESH_BUILD%FEM_GRID_TYPE%NGNOD+FEM_GRID 8   Âf  ¥   a   MESH_BUILD%FEM_GRID_TYPE%NELEM+FEM_GRID 8   gg    a   MESH_BUILD%FEM_GRID_TYPE%COORD+FEM_GRID 8   sh    a   MESH_BUILD%FEM_GRID_TYPE%KNODS+FEM_GRID 6   i  ô   a   MESH_BUILD%FEM_GRID_TYPE%TAG+FEM_GRID 6   sj  ô   a   MESH_BUILD%FEM_GRID_TYPE%REF+FEM_GRID 7   gk  0  a   MESH_BUILD%FEM_GRID_TYPE%BNDS+FEM_GRID 7   l  ¤   a   MESH_BUILD%FEM_GRID_TYPE%FLAT+FEM_GRID @   ;m    a   MESH_BUILD%FEM_GRID_TYPE%EDGECONN_ELEM+FEM_GRID @   Gn    a   MESH_BUILD%FEM_GRID_TYPE%EDGECONN_EDGE+FEM_GRID =   So  4  a   MESH_BUILD%FEM_GRID_TYPE%VERTEXCONN+FEM_GRID     p  f   a   MESH_BUILD%GRID     íp  W   a   MESH_BUILD%MESH    Dq  Y       MESH_H    q  W   a   MESH_H%MESH    ôq  @   a   MESH_H%H 