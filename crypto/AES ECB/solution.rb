require'socket';
require'base64'

sock = TCPSocket.open('localhost', 8000);


loop{
	resp = sock.gets
	puts resp
	break if resp =~ /^Your goal/
}


inp_len = 0;
sock.puts('')
resp = Base64.decode64(sock.gets[/The result : (.+)/,1]);
initial_length = resp.length;
=begin
limit_len = nil;
1.upto(16){|i|
	sock.puts(?a*i);
	if initial_length < Base64.decode64(sock.gets[/The result : (.+)/,1]).length
		limit_len = i;
		break;
	end
}
puts "[+] limit_len = #{limit_len}"
=end
printable = (?a .. ?z).to_a + (?0 .. ?9).to_a + [?_] + (?A..?Z).to_a + %w({ });
flag = '';
part_flag = '';
iv = ?a * 16;
k = 0;
begin
loop{
	1.upto(16){|i|
		enc_blocs = printable.map{|c|
			sock.puts(iv[i .. 16-1] + part_flag + c);
			resp = Base64.decode64(sock.gets[/The result : (.+)/,1]);
			resp[0,16];
		}

		sock.puts(iv[i .. 16-1])
		resp = Base64.decode64(sock.gets[/The result : (.+)/,1])[k*16,16];
		ind = enc_blocs.index(resp)
		unless ind
			flag += part_flag
			puts "ALL FLAG READ!";
			raise StopIteration
			exit 1;
		end
		part_flag += printable[ind];
		puts part_flag
	}
	flag += part_flag;
	iv = part_flag;
	part_flag = '';
	k += 1;
}
rescue Exception => e
	p e.message;
	p e.backtrace;
ensure
	puts flag
	gets
end
