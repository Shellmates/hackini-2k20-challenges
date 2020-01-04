require'openssl';

class String
	def as_number
		self.each_codepoint.map{|c| c.to_s(16).rjust(2,?0)}.join.to_i(16);
	end
end

class Integer
	def as_string
		x = self;
		s = '';
		while x != 0
			s << (x & 0xff).chr;
			x >>= 8;
		end
		s.reverse;
	end
end

class OpenSSL::BN
	def next_prime
		x = self + 1;
		x += 1 until x.prime_fasttest?;
		x;
	end
end

class RSA
	def initialize
		prime1 = OpenSSL::BN.generate_prime(512, true);
		prime2 = prime1.next_prime;
		n = prime1 * prime2;
		e = 0x10001;
		phi = (prime1 - 1) * (prime2 - 1);
		d = e.to_bn.mod_inverse(phi).to_i;
		@pubkey = { n: n, e: e };
		@privkey = { primes: [prime1, prime2], d: d };
	end
	
	def encrypt message
		message = message.as_number if message.is_a?(String);
		message.to_bn.mod_exp(@pubkey[:e], @pubkey[:n]).to_i;
	end
	
	def decrypt ciphertext
		ciphertext = ciphertext.as_number if ciphertext.is_a?(String);
		ciphertext.to_bn.mod_exp(@privkey[:d], @pubkey[:n]).to_i.as_string;
	end
	attr_reader :pubkey;
end

rsa = RSA.new;

puts "[+] Pubkey = {\n\tN = #{rsa.pubkey[:n]}\n\te = #{rsa.pubkey[:e]}\n}";

flag = File.read('flag.txt');

encrypted = rsa.encrypt(flag)
puts "ciphertext = #{encrypted}"

# flag is rsa.decrypt(flag)
