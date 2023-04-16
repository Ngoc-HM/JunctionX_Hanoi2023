import random
import bot


def get_response(message: str, username: str) -> str:
    p_message = message.lower()
    if p_message == 'hello':
        return 'Hey there!'

    if message == 'roll':
        return str(random.randint(1, 6))

    if p_message == '!help':
        return '`This is a help message that you can modify.`'

    if p_message == 'balance':
        return bot.messagess

