;
;
; Copyright (c) 2015 - 2019 by blindtiger. All rights reserved.
;
; The contents of this file are subject to the Mozilla Public License Version
; 2.0 (the "License"); you may not use this file except in compliance with
; the License. You may obtain a copy of the License at
; http://www.mozilla.org/MPL/
;
; Software distributed under the License is distributed on an "AS IS" basis,
; WITHOUT WARRANTY OF ANY KIND, either express or implied. SEe the License
; for the specific language governing rights and limitations under the
; License.
;
; The Initial Developer of the Original e is blindtiger.
;
;

include macamd64.inc

; BOOLEAN
;     NTAPI
;     _CmpByte(
;         __in CHAR b1,
;         __in CHAR b2
;     );

    LEAF_ENTRY _CmpByte, _TEXT$00
        
        cmp cl, dl
        setnz al
        ret

    LEAF_END _CmpByte, _TEXT$00
        
; BOOLEAN
;     NTAPI
;     _CmpShort(
;         __in SHORT s1,
;         __in SHORT s2
;     );

    LEAF_ENTRY _CmpShort, _TEXT$00
        
        cmp cx, dx
        setnz al
        ret

    LEAF_END _CmpShort, _TEXT$00
    
; BOOLEAN
;     NTAPI
;     _CmpLong(
;         __in LONG l1,
;         __in LONG l2
;     );

    LEAF_ENTRY _CmpLong, _TEXT$00
        
        cmp ecx, edx
        setnz al
        ret

    LEAF_END _CmpLong, _TEXT$00
    
; BOOLEAN
;     NTAPI
;     _CmpLongLong(
;         __in LONGLONG ll1,
;         __in LONGLONG ll2
;     );

    LEAF_ENTRY _CmpLongLong, _TEXT$00
        
        cmp rcx, rdx
        setnz al
        ret

    LEAF_END _CmpLongLong, _TEXT$00

        end
