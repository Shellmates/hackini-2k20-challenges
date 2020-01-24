require'openssl';
require'socket';
require'base64';

SECRET_KEY = 16.times.map{ rand(0..255).chr }.join
FLAG = File.read('flag.txt')
#"shellmates{ECB_0ne_by7e_4t_4_t1me_4ttack_;)}"


banner = "\e[1;92;49m" + <<BANNER
   Oo    o.OOoOoo .oOOOo.        o.OOoOoo  .oOOOo.  o.oOOOo.  
  o  O    O       o     o         O       .O     o   o     o                                                                         
 O    o   o       O.              o       o          O     O                                                                         
oOooOoOo  ooOO     `OOoo.         ooOO    o          oOooOO.                                                                         
o      O  O             `O        O       o          o     `O                                                                        
O      o  o              o        o       O          O      o                                                                        
o      O  O       O.    .O        O       `o     .o  o     .O                                                                        
O.     O ooOooOoO  `oooO'        ooOooOoO  `OoooO'   `OooOO'                                                                         
                                                                                                                                     
                                 
BANNER
banner += "\e[0m"
banner += "You send me a string, I send you: BASE64(AES_ECB(input + flag, SECRET_KEY))\n"
banner += "Your goal is to get the flag back\n"

PROMPT = "=> ";


server = TCPServer.open(8000);

puts "[+] RUNNING WITH flag = #{FLAG}";
loop{
	client = server.accept;
	#sock_domain, remote_port, remote_hostname, remote_ip = client.peeraddr;
	puts "[+] New connection from #{client.peeraddr.join(', ')}";
	pid = fork{
		client.puts banner;
		loop{
			client.print PROMPT;
			client.flush;
			input = client.gets.chomp;
			exit 0 unless input;
			client.print "The result : ";
			client.flush
			aes = OpenSSL::Cipher::AES128.new(:ECB);
			aes.encrypt;
			aes.key = SECRET_KEY;
			input_debug = input + FLAG
			puts "[+] bloc1 = #{input_debug[0,16]}\n[+] bloc2 = #{input_debug[16,16]}\n[+] bloc3 = #{input_debug[32,16]}";
			aes_encrypted = aes.update(input + FLAG) + aes.final;
			client.puts Base64.encode64(aes_encrypted).gsub(/\s+/,'');
			client.flush;
		}
	}
	Process.detach pid;
}
