from pynput.keyboard import Key, Controller
import time

print("Spam-Bot")
print("""{}
 _______  _______  _______  __   __ 
|       ||       ||   _   ||  |_|  |
|  _____||    _  ||  |_|  ||       |
| |_____ |   |_| ||       ||       |
|_____  ||    ___||       ||       |
 _____| ||   |    |   _   || ||_|| |
|_______||___|    |__| |__||_|   |_|
 _______  _______  _______          
|  _    ||       ||       |         
| |_|   ||   _   ||_     _|         
|       ||  | |  |  |   |           
|  _   | |  |_|  |  |   |           
| |_|   ||       |  |   |           
|_______||_______|  |___|          
{}\n\tOlá\n\t*Ctrl + c para parar o script*\n\.\n{}""".format("="*100,"="*100,"="*100))                                    
message = input("Digite sua mensagem aqui --> ")
keyboard = Controller()

time.sleep(5)

for num in range(99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999):
	for letter in message:
		keyboard.press(letter)
		keyboard.release(letter)
	keyboard.press(Key.enter)
	keyboard.release(Key.enter)
	time.sleep(0.1)

