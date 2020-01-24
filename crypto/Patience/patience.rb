require'socket';

flag = "g00d_th1ngs_c0me_t0_th0se_wh0_wa1t";

server = TCPServer.open(8000);

wrong_banner = "\e[1;91;49m" + <<BANNER
_ _ _ ____ ____ _  _ ____ 
| | | |__/ |  | |\\ | | __ 
|_|_| |  \\ |__| | \\| |__] 
                          
BANNER
wrong_banner += "\e[0m"

correct_banner = "\e[1;92;49m" + <<BANNER
____ ____ ____ ____ ____ ____ ___ 
|    |  | |__/ |__/ |___ |     |  
|___ |__| |  \\ |  \\ |___ |___  |  
                                  
BANNER
correct_banner += "\e[0m"

loop{
	client = server.accept;
	puts "[+] New connection from #{client.peeraddr.join(', ')}";
	pid = fork{
		client.puts("Please enter the flag")
		input = client.gets;
		correct = true;
		flag.each_char.with_index{|c,i|
			if input[i] != c
				correct = false;
				break;
			end
			sleep 0.5;
		}
		if correct
			client.puts(correct_banner);
			client.puts("Correct input! the flag is shellmates{#{flag}}")
		else
			client.puts(wrong_banner);
			client.puts("Wrong input!");
		end
		client.close;
	}
	Process.detach pid;
}

=begin
s = input()
correct = True
for i in range(len(flag)):
	if s[i] != flag[i]:
		correct = False
		break
	sleep(0.5)

if correct:
	print("\e[1;92;49m____ ____ ____ ____ ____ ____ ___ \n|    |  | |__/ |__/ |___ |     |  \n|___ |__| |  \\ |  \\ |___ |___  |  \n                                  \n\e[0m")
	print("Correct input! the flag is {}".format(flag))
else:
	# Wrong
	print("\e[1;91;49m_ _ _ ____ ____ _  _ ____ \n| | | |__/ |  | |\\ | | __ \n|_|_| |  \\ |__| | \\| |__] \n                          \n\e[0m")
	
=end
