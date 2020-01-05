require'openssl'
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


exponent1 = <<D
    37:39:0f:fa:b0:ba:18:5d:3e:c0:6e:9c:a6:6a:36:
    96:43:56:9f:b6:f3:e4:9e:3a:25:df:27:3d:fb:49:
    f4:1e:b4:52:25:98:3c:e0:e7:b7:69:e8:69:7e:90:
    7a:38:14:98:3f:18:53:97:f9:4c:86:88:2a:07:09:
    2f:ff:67:0b:4b:51:88:61:1d:cf:42:69:09:ac:cd:
    01:a5:95:aa:fc:5c:d1:da:36:c9:d4:05:8e:ce:af:
    cc:87:2c:fa:7d:8f:16:3b:b8:04:0c:79:a1:09:7b:
    f0:26:47:93:a3:35:b8:a5:32:c9:41:43:58:d5:bd:
    37:14:de:04:ee:c2:d1:a4:f0:d2:81:3a:08:ec:ac:
    19:bb:8c:77:df:11:7d:6b:25:9d:3b:ec:16:9b:61:
    32:9c:31:49:b5:95:be:b6:2a:12:93:7a:3c:31:6f:
    79:73:e5:97:69:79:93:90:c1:9f:dd:99:a8:5d:a3:
    4b:d2:df:fe:6d:d2:6d:74:56:86:47:a3:c7:b1:c0:
    f2:84:91:34:bd:03:10:d1:1d:db:f6:29:c1:42:eb:
    d4:4e:1e:96:dc:d1:d2:59:d3:e7:70:8b:4e:68:e5:
    24:b9:a9:2c:c7:35:86:8a:8a:ea:7b:e8:f2:f6:a4:
    fe:d0:27:74:6f:ed:dc:e9:40:3e:33:71:a2:a6:4c:
    07
D
exponent2 = <<D
    00:9f:94:9b:d7:83:c4:96:44:cc:7e:32:97:34:a1:
    68:eb:ea:5a:8b:66:bf:f5:b0:c0:35:cf:93:0a:01:
    05:a2:d6:45:d0:00:e8:21:10:ec:0a:fc:b1:19:cc:
    65:ab:02:e4:46:d6:1a:60:7f:12:97:82:bf:18:16:
    db:37:c4:f2:0a:9f:3c:eb:3b:5d:33:e1:10:8d:57:
    5d:e4:88:4a:5c:99:b0:52:c0:86:6e:45:96:06:b5:
    99:ad:8d:99:59:6f:cd:63:b1:a0:7d:39:d2:75:07:
    40:0f:0f:4f:f5:2b:55:26:b9:aa:a9:ac:5a:fb:3a:
    4f:d3:f2:8e:1b:2e:04:91:06:1b:22:04:12:85:04:
    b1:bf:ba:31:94:78:ad:47:9f:ee:ab:37:55:00:5e:
    b6:6b:75:27:06:46:81:18:4e:5d:1b:75:f3:4d:42:
    71:88:db:d0:74:e5:ad:65:2e:f5:5e:ee:fe:a4:d0:
    27:be:7f:6f:63:fa:9f:eb:a9:d0:64:f8:dd:8d:d7:
    98:14:8c:2c:ca:f5:50:55:64:9a:8c:9c:9f:18:9b:
    c6:d4:22:1c:8f:37:57:53:b8:c9:b9:00:a1:80:86:
    88:db:95:71:09:57:18:ae:95:20:89:87:01:54:a2:
    02:e7:da:56:d3:df:69:71:41:b7:81:d3:05:d4:73:
    66:61
D
coefficient = <<D
    00:84:a1:45:7d:01:28:8b:4f:69:45:65:76:37:ff:
    3e:d7:15:7a:51:79:2e:cf:12:2b:c9:a3:bf:9d:8d:
    d5:52:50:37:af:f9:b2:6d:91:d7:32:33:90:cd:91:
    b7:e7:f1:f9:34:20:35:31:c3:41:52:f2:ab:82:d0:
    70:66:1e:32:d5:5e:89:28:05:6a:b7:60:6d:10:99:
    50:ae:ad:ae:f3:2f:58:b9:2c:7e:fe:44:9c:a1:d4:
    9a:c3:48:20:80:4e:4d:8e:68:74:91:05:d7:24:0d:
    a6:81:c7:51:bf:f0:b8:3c:2c:33:9e:02:f0:13:f5:
    c7:b6:17:c6:9b:8f:e2:65:34:0b:e8:90:89:63:a1:
    67:c4:a4:f7:28:9b:7b:d7:fe:06:10:28:dd:ac:ed:
    f6:60:3c:3e:73:1e:d6:83:ae:43:8e:ed:8c:83:cc:
    47:4f:a2:7e:26:fd:9b:e7:2e:31:b0:c1:3d:7a:7e:
    18:68:d2:d9:6a:d3:28:31:8d:7e:0b:6a:76:53:88:
    10:0c:5d:81:cf:76:97:d5:32:e9:ed:3e:68:7e:47:
    c5:1a:e2:36:73:98:e2:12:8c:be:98:bf:94:d6:02:
    ac:8e:72:b9:33:cd:85:74:34:12:38:78:93:eb:6a:
    50:70:38:c6:c6:6b:34:df:bb:e6:0e:46:5b:79:af:
    d3:9f
D
exponent1 = exponent1.scan(/[0-9a-f]{2}/).join.to_i(16);
exponent2 = exponent2.scan(/[0-9a-f]{2}/).join.to_i(16);
coefficient = coefficient.scan(/[0-9a-f]{2}/).join.to_i(16);
N = 0xC16C6C5F260B6E78392F6DB6E5A702C19CE059443BBA4C7DD10D07D5BC1A55D0A894E4CE794F4866DE2E20E358476B2AB29EF14BEACE9FA83929DD14DBB2A9C104F17938DC86669A14A4A6EE89800C9530F880757200B597F0D38D3B14FA7742FFA7B3E82E45BF61694281A3EBF8C2B0E5F848F773B4D070CCB48B73EC23EBF324012311E170F7E08D6EF406434C78B30335AE30818306E0C4DD2869834308D1D39747B633EED765D2483804BFAAB5066A2D57A54E735BF83C5DF7750D8B0DCD106345E9C7A1C302E839A80C4C0FB31A3724FC6CDF794E4A3699E71DC47C3A93D701A54FEFC80745F6ECD4105F27912EDB04B67FFD42FA920617F6297D9552CED6519E03E1A2A73254D5268A24CD587EFDBE5D275ED305514D5F03CD60A278E66CCAFC8E1F683A1FFBB5A59B951B67484AA8484B3FEF8F681104EB99DBC639C83D051C4F3925C742E49252AD01A52E95A1C2C168549F893DEEA651C24820163960C826DEC22A1BE1065F22DCECF890C82AC23A2187F8E22E5F571544616249BB7E3FB5899E0555ED3D04092D2A79B13970517355816FD487674AA1AC960850EB6BA702E8DA61B58D9C7C5513A99467D220EBC5A1FCCE3F24DB8BB37E228787EB04182B812DAFAAAD5CED8CADBCB3DAF47B1108C9A0465BD5708045902FD95E0EAD36FCB92EC981AD07A91749B61DBB0C6BD9EB7FF99D6DEA4A696458F67AE9B5;
e = 0x10001

# e dp - 1 = k(p-1)

m = e * exponent1 - 1
small_factors = 2.upto(e).select{|x| m % x == 0 && x.to_bn.prime?};
large_factor = m / small_factors.inject(:*)


1.upto(4){|k|
	small_factors.combination(k){|comb|
		k = comb.inject(:*);
		next if k > e;
		p_candidate = (small_factors - comb).inject(:*) * large_factor + 1
		next unless p_candidate.to_bn.prime_fasttest?;
		puts "[?] k = #{k} && p = #{p_candidate.to_s(16)}";
		q_candidate = N / p_candidate
		d_candidate = e.to_bn.mod_inverse( (p_candidate-1) * (q_candidate-1) )
		File.open('encrypted.bin', 'rb') do|f|
			data = f.read.as_number;
			puts data.to_bn.mod_exp(d_candidate,N).to_i.as_string[/\x00[^\x00]*$/];
		end
	}
}
