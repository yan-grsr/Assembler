
ASM = nasm
LD = ld
ASMFLAGS = -f elf64

TMPDIR = tmp
BINDIR = bin
SRCDIR = src


# assemble source file from src/ to object file in tmp/
$(TMPDIR)/%.o: $(SRCDIR)/%.asm
	@mkdir -p $(TMPDIR)
	$(ASM) $(ASMFLAGS) $< -o $@

# build binaries in bin/
%: $(TMPDIR)/%.o
	@mkdir -p $(BINDIR)
	$(LD) $< -o $(BINDIR)/$@

.PHONY: clean
clean:
	rm -fr $(TMPDIR) $(BINDIR)


