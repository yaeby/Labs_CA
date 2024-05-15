Pentru afișarea unui caracter în NASM, se poate utiliza instrucțiunea mov pentru a încărca caracterul într-un registru și apoi instrucțiunea int cu codul corespunzător al funcției de afișare a caracterului într-un mediu specific. De exemplu:
assembly
Copy code
mov ah, 0x0E   ; Setează funcția pentru afișarea unui caracter
mov al, 'A'    ; Caracterul de afișat
int 0x10       ; Afișează caracterul

Compararea a două numere întregi în NASM se face cu instrucțiunea cmp, care setează starea flagurilor în funcție de rezultatul comparării. De exemplu:
assembly
Copy code
mov ax, 10    ; Încarcă primul număr într-un registru
mov bx, 20    ; Încarcă al doilea număr în alt registru
cmp ax, bx    ; Compară cele două numere

Înmulțirea a două numere întregi în NASM se face cu instrucțiunea imul. De exemplu:
assembly
Copy code
mov ax, 10    ; Încarcă primul număr într-un registru
mov bx, 20    ; Încarcă al doilea număr în alt registru
imul ax, bx   ; Înmulțește ax cu bx

Instrucțiunea AND în NASM realizează operația logică "și" între doi operanzi. Aceasta pune 1 în rezultat doar acolo unde ambii operanzi au biți de 1. De exemplu:
assembly
Copy code
mov ax, 1010b  ; Încarcă un număr într-un registru
mov bx, 1100b  ; Încarcă alt număr în alt registru
and ax, bx     ; Realizează operația AND între cei doi registre

Instrucțiunea JMP în NASM este utilizată pentru a transfera controlul la o altă locație de program. De exemplu:
assembly
Copy code
jmp eticheta   ; Saltă la eticheta specificată

Instrucțiunea INT în NASM este utilizată pentru a provoca o întrerupere de software, care poate fi utilizată pentru a executa o funcție de serviciu de sistem sau pentru a comunica cu BIOS-ul. De exemplu:
assembly
Copy code
mov ah, 0x01   ; Setează funcția pentru a citi de la tastatură
int 0x16       ; Provoacă o întrerupere pentru a citi de la tastatură

Împărțirea a două numere întregi în NASM se face cu instrucțiunea idiv. De exemplu:
assembly
Copy code
mov ax, 100    ; Încarcă primul număr într-un registru
mov bx, 10     ; Încarcă al doilea număr (divizorul) în alt registru
idiv bx        ; Împarte ax la bx

Instrucțiunea OR în NASM realizează operația logică "sau" între doi operanzi. Aceasta pune 1 în rezultat acolo unde cel puțin unul dintre operanzi are biți de 1. De exemplu:
assembly
Copy code
mov ax, 1010b  ; Încarcă un număr într-un registru
mov bx, 1100b  ; Încarcă alt număr în alt registru
or ax, bx      ; Realizează operația OR între cei doi registre

Instrucțiunea XOR în NASM realizează operația logică "sau exclusiv" între doi operanzi. Aceasta pune 1 în rezultat acolo unde unul dintre operanzi are biți de 1, dar nu amândoi. De exemplu:
assembly
Copy code
mov ax, 1010b  ; Încarcă un număr într-un registru
mov bx, 1100b  ; Încarcă alt număr în alt registru
xor ax, bx     ; Realizează operația XOR între cei doi registre

Instrucțiunea NOT în NASM realizează negarea logică a unui operand, inversând toți biții acestuia. De exemplu:
assembly
Copy code
mov ax, 1010b  ; Încarcă un număr într-un registru
not ax         ; Negă registru

Instrucțiunea TEST în NASM realizează o operație logică "și" între doi operanzi, dar nu stochează rezultatul, ci doar setează starea flagurilor. De exemplu:
assembly
Copy code
mov ax, 1010b  ; Încarcă un număr într-un registru
test ax, ax    ; Testează registru cu el însuși

Sintaxa corectă pentru saltul la o instrucțiune în NASM este jmp, urmat de eticheta instrucțiunii la care se dorește să se sara. De exemplu:
assembly
Copy code
jmp eticheta   ; Saltă la eticheta specificată

Sintaxa corectă pentru încărcarea unui număr întreg într-un registru în NASM este mov, urmat de numărul și registru în care se dorește încărcarea. De exemplu:
assembly
Copy code
mov ax, 10     ; Încarcă 10 în registrul ax

Sintaxa corectă pentru încărcarea unei adrese de memorie într-un registru în NASM este lea, urmat de adresa de memorie și registru în care se dorește încărcarea. De exemplu:
assembly
Copy code
lea bx, variabila ; Încarcă adresa variabilei în registrul bx

Instrucțiunea LEA în NASM încarcă adresa efectivă a unei variabile într-un registru, fără să efectueze vreo operație aritmetică. Este utilizată în special pentru a încărca adrese de memorie în registre. De exemplu:
assembly
Copy code
lea bx, variabila ; Încarcă adresa variabilei în registrul bx

Sintaxa corectă pentru transferul controlului la o subrutină în NASM este call, urmat de eticheta subrutinei. De exemplu:
assembly
Copy code
call subrutina  ; Transferă controlul la subrutină

Instrucțiunea JZ în NASM realizează un salt (jump) la o anumită etichetă dacă registrul de starea flagurilor indică că ultima operație a rezultat într-o valoare zero. De exemplu:
assembly
Copy code
jz eticheta   ; Saltă la eticheta specificată dacă ZF este setat

Instrucțiunea JNZ în NASM realizează un salt la o anumită etichetă dacă registrul de starea flagurilor indică că ultima operație nu a rezultat într-o valoare zero. De exemplu:
assembly
Copy code
jnz eticheta  ; Saltă la eticheta specificată dacă ZF nu este setat

Instrucțiunea JA în NASM realizează un salt la o anumită etichetă dacă ultima comparație a indicat că primul operand este mai mare decât al doilea. De exemplu:
assembly
Copy code
ja eticheta   ; Saltă la eticheta specificată dacă primul operand este mai mare decât al doilea

Instrucțiunea JB în NASM realizează un salt la o anumită etichetă dacă ultima comparație a indicat că primul operand este mai mic decât al doilea. De exemplu:
assembly
Copy code
jb eticheta   ; Saltă la eticheta specificată dacă primul operand este mai mic decât al doilea

Instrucțiunea JAE în NASM realizează un salt la o anumită etichetă dacă ultima comparație a indicat că primul operand este mai mare sau egal cu al doilea. De exemplu:
assembly
Copy code
jae eticheta  ; Saltă la eticheta specificată dacă primul operand este mai mare sau egal cu al doilea

Instrucțiunea JBE în NASM realizează un salt la o anumită etichetă dacă ultima comparație a indicat că primul operand este mai mic sau egal cu al doilea. De exemplu:
assembly
Copy code
jbe eticheta  ; Saltă la eticheta specificată dacă primul operand este mai mic sau egal cu al doilea

Instrucțiunea LOOP în NASM este utilizată pentru a itera un număr de ori specificat prin decrementarea registrului de iterație și saltând la o etichetă specificată atâta timp cât registrul este diferit de zero. De exemplu:
assembly
Copy code
loop eticheta  ; Iterează și saltă la etichetă până când registrul CX devine zero

Sintaxa corectă pentru declarația unei constante în NASM este equ, urmată de numele constantei și valoarea acesteia. De exemplu:
assembly
Copy code
NUMAR equ 10  ; Definirea unei constante NUMAR cu valoarea 10

Instrucțiunea SHR în NASM realizează o deplasare la dreapta a biților dintr-un operand la poziții specificate, umplând bitul cel mai semnificativ cu zero. De exemplu:
assembly
Copy code
shr ax, 1    ; Deplasează biții din registrul ax la dreapta cu o poziție

Instrucțiunea NOT în NASM realizează negarea logică a unui operand, inversând toți biții acestuia. De exemplu:
assembly
Copy code
mov ax, 1010b  ; Încarcă un număr într-un registru
not ax         ; Negă registru

Instrucțiunea MUL în NASM realizează înmulțirea unui operand cu conținutul registrului AX, iar rezultatul este stocat în registrul AX (și eventual DX pentru numere întregi mai mari). De exemplu:
assembly
Copy code
mov ax, 10   ; Încarcă un multiplicand în registrul AX
mov bx, 20   ; Încarcă un multiplu în registrul BX
mul bx       ; Înmulțește AX cu BX

Sintaxa corectă pentru declarația unei variabile în NASM este să aloci spațiu pentru aceasta în secțiunea de date a programului, folosind directivele db, dw, sau dd pentru a specifica tipul datelor și dimensiunea variabilei. De exemplu:
assembly
Copy code
variabila db 1    ; Declara o variabilă de 1 byte

Instrucțiunea MOVZX în NASM efectuează o încărcare cu extensie zero a unui operand de dimensiune mai mică într-un operand de dimensiune mai mare. De exemplu:
assembly
Copy code
movzx ebx, al   ; Încarcă conținutul registrului AL în EBX, extinzându-l cu zero

Instrucțiunea CALL în NASM este utilizată pentru a apela o subrutină. Ea pune adresa următoarei instrucțiuni (adresa de revenire) pe stiva de apel și transferă controlul la subrutină. De exemplu:
assembly
Copy code
call subrutina  ; Apelează subrutina

Instrucțiunea RET în NASM este utilizată pentru a reveni la instrucția care a apelat o subrutină. Aceasta scoate adresa de revenire de pe stiva de apel și transferă controlul la acea adresă. De exemplu:
assembly
Copy code
ret             ; Revenire la instrucția care a apelat subrutina

Un registru de 16 biți în NASM este, de exemplu, ax, bx, cx, dx, si, di, bp, sau sp.

NASM (Netwide Assembler) este un asamblor gratuit și open-source pentru platforme x86 și x86-64. Este utilizat pentru a traduce codul sursă scris în limbaj de asamblare în cod de mașină executabil.

Un registru în NASM este o locație de memorie de dimensiuni fixe utilizată pentru a stoca date temporare și adrese. Registrele sunt parte integrantă a procesorului și sunt utilizate pentru a efectua operații aritmetice, logice și de control.

Sintaxa corectă pentru adunarea a două numere întregi în NASM este să încarci cele două numere în registre și apoi să folosești instrucțiunea add pentru a aduna conținutul acestora. De exemplu:
assembly
Copy code
mov ax, 10   ; Încarcă primul număr într-un registru
mov bx, 20   ; Încarcă al doilea număr în alt registru
add ax, bx   ; Adună cele două numere

Instrucțiunea MOV în NASM este utilizată pentru a transfera date între registre, între registre și adrese de memorie sau între adrese de memorie. De exemplu:
assembly
Copy code
mov ax, bx   ; Transferă conținutul registrului BX în registrul AX