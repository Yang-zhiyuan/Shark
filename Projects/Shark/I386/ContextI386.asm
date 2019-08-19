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

.686p

        .xlist
include ks386.inc
include callconv.inc
        .list
        
_TEXT$00    SEGMENT PAGE 'CODE'

; DECLSPEC_NORETURN
;     VOID
;     STDCALL
;     _CaptureContext(
;         __in ULONG ProgramCounter,
;         __in PVOID Detour,
;         __in PGUARD Guard,
;         __in_opt PVOID Parameter,
;         __in_opt PVOID Reserved
;     );

StackPointer EQU 14h
Reserved EQU 10h
Parameter EQU 0ch
Guard EQU 8
Detour EQU 4
ProgramCounter EQU 0

    cPublicProc __CaptureContext, 5
    
        sub esp, ContextFrameLength
        
        push ebx
        
        lea ebx, [esp]

        and ebx, not 7

        pop [ebx].CsEbx

        mov [ebx].CsSegEs, es
        mov [ebx].CsSegCs, cs
        mov [ebx].CsSegSs, ss
        mov [ebx].CsSegDs, ds
        mov [ebx].CsSegFs, fs
        mov [ebx].CsSegGs, gs
        
        mov [ebx].CsEax, eax
        mov [ebx].CsEcx, ecx
        mov [ebx].CsEdx, edx

        mov [ebx].CsEbp, ebp
        mov [ebx].CsEsi, esi
        mov [ebx].CsEdi, edi
        
        pushfd
        pop [ebx].CsEFlags

        lea eax, [esp].ContextFrameLength.StackPointer
        mov [ebx].CsEsp, eax

        mov eax, [esp].ContextFrameLength.Detour
        mov [ebx].CsEip, eax
        
        mov eax, CONTEXT_FULL
        mov [ebx].CsContextFlags, eax
        
        mov edx, [esp].ContextFrameLength.ProgramCounter
        lea ecx, [ebx]
        mov edi, [esp].ContextFrameLength.Reserved
        mov esi, [esp].ContextFrameLength.Parameter
        mov eax, [esp].ContextFrameLength.Guard
        
        push edi
        push esi
        push edx
        push ecx

        call eax

    stdENDP __CaptureContext
    
_TEXT$00    ends

        end
