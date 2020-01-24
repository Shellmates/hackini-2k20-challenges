#include <MsgBoxConstants.au3>

Local $inp = InputBox("Authentification", "Entrez le flag de validation", "", "", -1, -1, 0, 0)

If StringLen($inp) == 0 Then
	  Exit(0)
Endif
If StringCompare ( $inp, "shellmates{Auto1t_1s_N1ce_f0r_aut0mating_t4sks_on_w1n_env5}") == 0 Then
	MsgBox(BitOR($MB_ICONINFORMATION, $MB_SYSTEMMODAL), "Congrats", "Your input is accepted, you can use it to validate the challenge")
Else
	MsgBox(BitOR($MB_ICONEXCLAMATION, $MB_SYSTEMMODAL), "Wrong", "Wrong input")
Endif
