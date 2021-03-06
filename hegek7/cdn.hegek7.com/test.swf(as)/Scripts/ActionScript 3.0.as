/ / A c t i o n S c r i p t   3 . 0 
 / /     p a c k a g e   d e t e c t o r 3 _ f l a 
 / /         c l a s s   M a i n T i m e l i n e 
 p a c k a g e   d e t e c t o r 3 _ f l a   
 { 
         i m p o r t   f l a s h . d i s p l a y . * ; 
         i m p o r t   f l a s h . e v e n t s . * ; 
         i m p o r t   f l a s h . e x t e r n a l . * ; 
         i m p o r t   f l a s h . s y s t e m . * ; 
         i m p o r t   f l a s h . u t i l s . * ; 
         
         p u b l i c   d y n a m i c   c l a s s   M a i n T i m e l i n e   e x t e n d s   f l a s h . d i s p l a y . M o v i e C l i p 
         { 
                 p u b l i c   f u n c t i o n   M a i n T i m e l i n e ( ) 
                 { 
                         s u p e r ( ) ; 
                         a d d F r a m e S c r i p t ( 0 ,   f r a m e 1 ) ; 
                         r e t u r n ; 
                 } 
 
                 p u b l i c   f u n c t i o n   c h e c k I s I n V i e w ( ) : B o o l e a n 
                 { 
                         r e t u r n   v i e w S t a t e   = = =   I N _ V I E W ; 
                 } 
 
                 f u n c t i o n   f r a m e 1 ( ) : * 
                 { 
                         S e c u r i t y . a l l o w D o m a i n ( " * " ) ; 
                         S e c u r i t y . a l l o w I n s e c u r e D o m a i n ( " * " ) ; 
            // 监听 Event.ENTER_FRAME 事件
                         t h i s . a d d E v e n t L i s t e n e r ( E v e n t . E N T E R _ F R A M E ,   c h e c k F r a m e R a t e ) ; 
                         p r e v T i m e   =   0 ; 
                         a d d E v e n t L i s t e n e r ( E v e n t . E N T E R _ F R A M E ,   r e g i s t e r E x t e r n a l C a l l b a c k s ) ; 
                         r e t u r n ; 
                 } 
 
                 p u b l i c   f u n c t i o n   c h e c k F r a m e R a t e ( a r g 1 : f l a s h . e v e n t s . E v e n t ) : v o i d 
                 { 
                         v a r   l o c 1 : * = u n d e f i n e d ; 
                         v a r   l o c 2 : * = u n d e f i n e d ; 
                         l o c 1   =   g e t T i m e r ( ) ; 
                         l o c 2   =   l o c 1   -   p r e v T i m e ; 
            // 当 400ms 内未更新UI，认为广告未处于曝光区域
                         v i e w S t a t e   =   l o c 2   >   4 0 0   ?   O U T _ O F _ V I E W   :   I N _ V I E W ; 
                         p r e v S t a t e   =   v i e w S t a t e ; 
                         p r e v T i m e   =   l o c 1 ; 
                         r e t u r n ; 
                 } 
 
                 p u b l i c   f u n c t i o n   r e g i s t e r E x t e r n a l C a l l b a c k s ( a r g 1 : f l a s h . e v e n t s . E v e n t ) : v o i d 
                 { 
                         r e m o v e E v e n t L i s t e n e r ( E v e n t . E N T E R _ F R A M E ,   r e g i s t e r E x t e r n a l C a l l b a c k s ) ; 
                         i f   ( E x t e r n a l I n t e r f a c e . a v a i l a b l e )   
                         { 
                                 E x t e r n a l I n t e r f a c e . a d d C a l l b a c k ( " t e s t " ,   c h e c k I s I n V i e w ) ; 
                         } 
                         r e t u r n ; 
                 } 
 
                 p u b l i c   c o n s t   O U T _ O F _ V I E W : O b j e c t = " o u t   o f   v i e w " ; 
 
                 p u b l i c   c o n s t   I N _ V I E W : O b j e c t = " i n   v i e w " ; 
 
                 p u b l i c   v a r   v i e w S t a t e : O b j e c t ; 
 
                 p u b l i c   v a r   p r e v S t a t e : O b j e c t ; 
 
                 p u b l i c   v a r   p r e v T i m e : O b j e c t ; 
         } 
 } 
