FasdUAS 1.101.10   ��   ��    k             l      ��  ��   

	Open Terminal Here
	
	A toolbar script for Mac OS X
	
	Written by Marc Liyanage
	
	
	See http://www.apple.com/applescript/macosx/toolbar_scripts/ for
	more information about toolbar scripts.
	
	See http://www.entropy.ch/software/applescript/ for the latest
	version of this script.
	
	
	History:
	
	30-OCT-2001: Version 1.0, adapted from one of the example toolbar scripts
	30-OCT-2001: Now handles embedded single quote characters in file names
	30-OCT-2001: Now handles folders on volumes other than the startup volume
	30-OCT-2001: Now handles click on icon in top-level (machine) window
	31-OCT-2001: Now displays a nicer terminal window title, courtesy of Alain Content
	11-NOV-2001: Now folders within application packages (.app directories) and has a new icon
	12-NOV-2001: New properties to set terminal columns and rows as the Terminal does not use default settings
	14-NOV-2001: Major change, now handles 8-bit characters in all shells, and quotes and spaces in tcsh
	18-NOV-2001: Version 1.1: Rewrite, now uses a temporary file  ~/.OpenTerminalHere to communicate
	             the directory name between AppleScript and the shell because this is much more reliable for 8-bit characters
	16-JAN-2006: Version 2.0: Rewrite, now uses "quoted form of" and "POSIX Path". This gets rid of
	             Perl and temp files, but it no longer handles files instead of folders.
	24-JAN-2007: Version 2.1: Integrated enhancements by Stephan Hradek, can again handle dropped files.
	06-AUG-2008: Version 2.2: Added terminal control sequence to clear the visible cd command.
    	26-OCT-2008: Version 2.3: Incorporated changes from Florian ?, handling case where Terminal was not already running
	14-JUL-2012: Version 2.3.1: Modified to activate iTerm
	07-JUL-2015: Version 2.3.2: Modified to activate iTerm3
     � 	 	( 
 
 	 O p e n   T e r m i n a l   H e r e 
 	 
 	 A   t o o l b a r   s c r i p t   f o r   M a c   O S   X 
 	 
 	 W r i t t e n   b y   M a r c   L i y a n a g e 
 	 
 	 
 	 S e e   h t t p : / / w w w . a p p l e . c o m / a p p l e s c r i p t / m a c o s x / t o o l b a r _ s c r i p t s /   f o r 
 	 m o r e   i n f o r m a t i o n   a b o u t   t o o l b a r   s c r i p t s . 
 	 
 	 S e e   h t t p : / / w w w . e n t r o p y . c h / s o f t w a r e / a p p l e s c r i p t /   f o r   t h e   l a t e s t 
 	 v e r s i o n   o f   t h i s   s c r i p t . 
 	 
 	 
 	 H i s t o r y : 
 	 
 	 3 0 - O C T - 2 0 0 1 :   V e r s i o n   1 . 0 ,   a d a p t e d   f r o m   o n e   o f   t h e   e x a m p l e   t o o l b a r   s c r i p t s 
 	 3 0 - O C T - 2 0 0 1 :   N o w   h a n d l e s   e m b e d d e d   s i n g l e   q u o t e   c h a r a c t e r s   i n   f i l e   n a m e s 
 	 3 0 - O C T - 2 0 0 1 :   N o w   h a n d l e s   f o l d e r s   o n   v o l u m e s   o t h e r   t h a n   t h e   s t a r t u p   v o l u m e 
 	 3 0 - O C T - 2 0 0 1 :   N o w   h a n d l e s   c l i c k   o n   i c o n   i n   t o p - l e v e l   ( m a c h i n e )   w i n d o w 
 	 3 1 - O C T - 2 0 0 1 :   N o w   d i s p l a y s   a   n i c e r   t e r m i n a l   w i n d o w   t i t l e ,   c o u r t e s y   o f   A l a i n   C o n t e n t 
 	 1 1 - N O V - 2 0 0 1 :   N o w   f o l d e r s   w i t h i n   a p p l i c a t i o n   p a c k a g e s   ( . a p p   d i r e c t o r i e s )   a n d   h a s   a   n e w   i c o n 
 	 1 2 - N O V - 2 0 0 1 :   N e w   p r o p e r t i e s   t o   s e t   t e r m i n a l   c o l u m n s   a n d   r o w s   a s   t h e   T e r m i n a l   d o e s   n o t   u s e   d e f a u l t   s e t t i n g s 
 	 1 4 - N O V - 2 0 0 1 :   M a j o r   c h a n g e ,   n o w   h a n d l e s   8 - b i t   c h a r a c t e r s   i n   a l l   s h e l l s ,   a n d   q u o t e s   a n d   s p a c e s   i n   t c s h 
 	 1 8 - N O V - 2 0 0 1 :   V e r s i o n   1 . 1 :   R e w r i t e ,   n o w   u s e s   a   t e m p o r a r y   f i l e     ~ / . O p e n T e r m i n a l H e r e   t o   c o m m u n i c a t e 
 	                           t h e   d i r e c t o r y   n a m e   b e t w e e n   A p p l e S c r i p t   a n d   t h e   s h e l l   b e c a u s e   t h i s   i s   m u c h   m o r e   r e l i a b l e   f o r   8 - b i t   c h a r a c t e r s 
 	 1 6 - J A N - 2 0 0 6 :   V e r s i o n   2 . 0 :   R e w r i t e ,   n o w   u s e s   " q u o t e d   f o r m   o f "   a n d   " P O S I X   P a t h " .   T h i s   g e t s   r i d   o f 
 	                           P e r l   a n d   t e m p   f i l e s ,   b u t   i t   n o   l o n g e r   h a n d l e s   f i l e s   i n s t e a d   o f   f o l d e r s . 
 	 2 4 - J A N - 2 0 0 7 :   V e r s i o n   2 . 1 :   I n t e g r a t e d   e n h a n c e m e n t s   b y   S t e p h a n   H r a d e k ,   c a n   a g a i n   h a n d l e   d r o p p e d   f i l e s . 
 	 0 6 - A U G - 2 0 0 8 :   V e r s i o n   2 . 2 :   A d d e d   t e r m i n a l   c o n t r o l   s e q u e n c e   t o   c l e a r   t h e   v i s i b l e   c d   c o m m a n d . 
         	 2 6 - O C T - 2 0 0 8 :   V e r s i o n   2 . 3 :   I n c o r p o r a t e d   c h a n g e s   f r o m   F l o r i a n   ? ,   h a n d l i n g   c a s e   w h e r e   T e r m i n a l   w a s   n o t   a l r e a d y   r u n n i n g 
 	 1 4 - J U L - 2 0 1 2 :   V e r s i o n   2 . 3 . 1 :   M o d i f i e d   t o   a c t i v a t e   i T e r m 
 	 0 7 - J U L - 2 0 1 5 :   V e r s i o n   2 . 3 . 2 :   M o d i f i e d   t o   a c t i v a t e   i T e r m 3 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    . ( when the toolbar script icon is clicked     �   P   w h e n   t h e   t o o l b a r   s c r i p t   i c o n   i s   c l i c k e d      l     ��������  ��  ��        i         I     ������
�� .aevtoappnull  �   � ****��  ��    k     0       O     '    k    &        I   	������
�� .miscactvnull��� ��� obj ��  ��      ! " ! l  
 
��������  ��  ��   "  # $ # Q   
 $ % & ' % r     ( ) ( c     * + * l    ,���� , l    -���� - n     . / . 1    ��
�� 
fvtg / l    0���� 0 4   �� 1
�� 
cwin 1 m    ���� ��  ��  ��  ��  ��  ��   + m    ��
�� 
alis ) o      ���� 0 this_folder   & R      ������
�� .ascrerr ****      � ****��  ��   ' r    $ 2 3 2 1    "��
�� 
sdsk 3 o      ���� 0 this_folder   $  4�� 4 l  % %��������  ��  ��  ��    m      5 5�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��     6 7 6 l  ( (��������  ��  ��   7  8 9 8 I   ( .�� :���� 0 process_item   :  ;�� ; o   ) *���� 0 this_folder  ��  ��   9  <�� < l  / /��������  ��  ��  ��     = > = l     ��������  ��  ��   >  ? @ ? l     ��������  ��  ��   @  A B A l     ��������  ��  ��   B  C D C l     �� E F��   E J D This handler processes folders dropped onto the toolbar script icon    F � G G �   T h i s   h a n d l e r   p r o c e s s e s   f o l d e r s   d r o p p e d   o n t o   t h e   t o o l b a r   s c r i p t   i c o n D  H I H l     ��������  ��  ��   I  J K J i     L M L I     �� N��
�� .aevtodocnull  �    alis N o      ���� 0 these_items  ��   M X      O�� P O n    Q R Q I    �� S���� 0 process_item   S  T�� T o    ���� 0 	this_item  ��  ��   R  f    �� 0 	this_item   P o    ���� 0 these_items   K  U V U l     ��������  ��  ��   V  W X W l     ��������  ��  ��   X  Y Z Y l     ��������  ��  ��   Z  [ \ [ l     �� ] ^��   ] + % this subroutine does the actual work    ^ � _ _ J   t h i s   s u b r o u t i n e   d o e s   t h e   a c t u a l   w o r k \  ` a ` l     ��������  ��  ��   a  b c b i     d e d I      �� f���� 0 process_item   f  g�� g o      ���� 0 	this_item  ��  ��   e k     y h h  i j i r      k l k n      m n m 1    ��
�� 
psxp n o     ���� 0 	this_item   l o      ���� 0 the_path   j  o p o W      q r q r     s t s n     u v u 7   �� w x
�� 
ctxt w m    ����  x m    ������ v o    ���� 0 the_path   t o      ���� 0 the_path   r D   
  y z y o   
 ���� 0 the_path   z m     { { � | |  / p  } ~ } l  ! !��������  ��  ��   ~   �  r   ! * � � � b   ! ( � � � b   ! & � � � m   ! " � � � � �  c d   � n   " % � � � 1   # %��
�� 
strq � o   " #���� 0 the_path   � m   & ' � � � � � (   & &   p r i n t f   ' \ x 1 b c \ n ' � o      ���� 0 cmd   �  � � � l  + +��������  ��  ��   �  � � � O   + w � � � k   / v � �  � � � I  / 4������
�� .miscactvnull��� ��� obj ��  ��   �  � � � Z   5 J � ����� � =  5 > � � � l  5 < ����� � I  5 <�� ���
�� .corecnte****       **** � 2  5 8��
�� 
cwin��  ��  ��   � m   < =����   � I  A F������
�� .miscactvnull��� ��� obj ��  ��  ��  ��   �  � � � I  K S�� ���
�� .Itrmslctnull���     obj  � 4  K O�� �
�� 
cwin � m   M N���� ��   �  � � � O   T ` � � � I  Z _����~
�� .Itrmntwnnull���     obj �  �~   � 1   T W�}
�} 
Crwn �  ��| � O   a v � � � O   g u � � � I  m t�{�z �
�{ .Itrmsntxnull���     obj �z   � �y ��x
�y 
Text � l  o p ��w�v � o   o p�u�u 0 cmd  �w  �v  �x   � 1   g j�t
�t 
Wcsn � 1   a d�s
�s 
Crwn�|   � m   + , � ��                                                                                  ITRM  alis    0  Macintosh HD                   BD ����	iTerm.app                                                      ����            ����  
 cu             	Utilities   #/:Applications:Utilities:iTerm.app/    	 i T e r m . a p p    M a c i n t o s h   H D   Applications/Utilities/iTerm.app  / ��   �  ��r � l  x x�q�p�o�q  �p  �o  �r   c  ��n � l     �m�l�k�m  �l  �k  �n       �j � � � � ��i�h�j   � �g�f�e�d�c�b
�g .aevtoappnull  �   � ****
�f .aevtodocnull  �    alis�e 0 process_item  �d 0 this_folder  �c  �b   � �a �`�_ � ��^
�a .aevtoappnull  �   � ****�`  �_   �   � 
 5�]�\�[�Z�Y�X�W�V�U
�] .miscactvnull��� ��� obj 
�\ 
cwin
�[ 
fvtg
�Z 
alis�Y 0 this_folder  �X  �W  
�V 
sdsk�U 0 process_item  �^ 1� $*j O *�k/�,�&E�W X  *�,E�OPUO*�k+ 	OP � �T M�S�R � ��Q
�T .aevtodocnull  �    alis�S 0 these_items  �R   � �P�O�P 0 these_items  �O 0 	this_item   � �N�M�L�K
�N 
kocl
�M 
cobj
�L .corecnte****       ****�K 0 process_item  �Q  �[��l kh )�k+ [OY�� � �J e�I�H � ��G�J 0 process_item  �I �F ��F  �  �E�E 0 	this_item  �H   � �D�C�B�D 0 	this_item  �C 0 the_path  �B 0 cmd   � �A {�@�? ��> � ��=�<�;�:�9�8�7�6�5
�A 
psxp
�@ 
ctxt�?��
�> 
strq
�= .miscactvnull��� ��� obj 
�< 
cwin
�; .corecnte****       ****
�: .Itrmslctnull���     obj 
�9 
Crwn
�8 .Itrmntwnnull���     obj 
�7 
Wcsn
�6 
Text
�5 .Itrmsntxnull���     obj �G z��,E�O h���[�\[Zk\Z�2E�[OY��O��,%�%E�O� I*j O*�-j 
j  
*j Y hO*�k/j O*�, *j UO*�, *�, 	*�l UUUOP ��alis    �  Macintosh HD                   BD ����Scripts                                                        ����            ����  
 cu             OpenInITermDroplet  S/:Users:ctipper:Documents:Develop:scripting:applescript:OpenInITermDroplet:Scripts/     S c r i p t s    M a c i n t o s h   H D  PUsers/ctipper/Documents/Develop/scripting/applescript/OpenInITermDroplet/Scripts  /    ��  �i  �h  ascr  ��ޭ