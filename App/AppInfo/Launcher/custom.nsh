${SegmentFile}

${Segment.OnInit}
	; Borrowed the following from PAL 2.2, Remove on release of PAL 2.2
		; Work out if it's 64-bit or 32-bit
	System::Call kernel32::GetCurrentProcess()i.s
	System::Call kernel32::IsWow64Process(is,*i.r0)
	${If} $0 == 0
		StrCpy $Bits 32
		Rename "$EXEDIR\App\MKVToolNix\doc" "$EXEDIR\App\MKVToolNix32\doc"
		Rename "$EXEDIR\App\MKVToolNix\examples" "$EXEDIR\App\MKVToolNix32\examples"
		Rename "$EXEDIR\App\MKVToolNix\locale" "$EXEDIR\App\MKVToolNix32\locale"
	${Else}
		StrCpy $Bits 64
		Rename "$EXEDIR\App\MKVToolNix32\doc" "$EXEDIR\App\MKVToolNix\doc"
		Rename "$EXEDIR\App\MKVToolNix32\examples" "$EXEDIR\App\MKVToolNix\examples"
		Rename "$EXEDIR\App\MKVToolNix32\locale" "$EXEDIR\App\MKVToolNix\locale"
	${EndIf}
!macroend

${SegmentInit}
    ${If} $Bits = 64
        ${SetEnvironmentVariablesPath} FullAppDir "$EXEDIR\App\MKVToolNix"
	${Else}
        ${SetEnvironmentVariablesPath} FullAppDir "$EXEDIR\App\MKVToolNix32"
	${EndIf}
!macroend
