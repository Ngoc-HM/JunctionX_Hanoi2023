import time
import pandas as pd
import responses
import discord
last_request_time = {}
import asyncio
import nltk
from nltk.sentiment import SentimentIntensityAnalyzer
from googletrans import Translator
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.pipeline import Pipeline
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
import nlp
import sentiment
cred = credentials.Certificate('path/serviceAccountKey.json')
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://junxhust-default-rtdb.asia-southeast1.firebasedatabase.app'
})
ref = db.reference('user')
# Create an instance of the translator
translator = Translator()
nltk.download('vader_lexicon')  # Tải dữ liệu cho SentimentIntensityAnalyzer

# Tạo một đối tượng SentimentIntensityAnalyzer
sia = SentimentIntensityAnalyzer()
users_data = ref.get()
passwords = {}
for user_id, user_data in users_data.items():
    passwords[user_data['name']] = user_data['password']

def get_user_key(username):
    ref = db.reference('user')
    data = ref.get()

    for user_key, user_data in data.items():
        if user_data.get('name') == username:
            return user_key
    return None

# Thiết lập giá trị điểm ban đầu cho tất cả các người dùng.

async def send_message(message, user_message, username, is_private):
    try:
        response = responses.get_response(user_message, username)
        await message.author.send(response) if is_private else await message.channel.send(response)

    except Exception as e:
        print(e)

def predict(text, dataframe):
    if len(dataframe["label"] == 0) > 9 and len(dataframe["label"] == 1) > 9:
        text_clf = Pipeline([
            ('vect', CountVectorizer()),  # Chuyển đổi văn bản thành ma trận đếm các từ
            ('clf', LogisticRegression(random_state=42))  # Sử dụng mô hình Logistic Regression để phân loại
        ])
        from sklearn.model_selection import train_test_split

        X = dataframe["message"]
        y = dataframe["label"]

        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
        # Huấn luyện mô hình trên tập dữ liệu huấn luyện
        text_clf.fit(X_train, y_train)
        t = text_clf.predict([text])
    else:
        t = 1
    return t

def predict2(text, dataframe):
    if len(dataframe["label"] == 0) > 9 and len(dataframe["label"] == 1) > 9:
        text_clf = Pipeline([
            ('vect', CountVectorizer()),  # Chuyển đổi văn bản thành ma trận đếm các từ
            ('clf', LogisticRegression(random_state=42))  # Sử dụng mô hình Logistic Regression để phân loại
        ])
        from sklearn.model_selection import train_test_split

        X = dataframe["message"]
        y = dataframe["label"]

        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
        # Huấn luyện mô hình trên tập dữ liệu huấn luyện
        text_clf.fit(X_train, y_train)
        t = text_clf.predict([text])
    else:
        t = 1
    return t

def run_discord_bot():
    intents = discord.Intents.default()
    intents.message_content = True
    client = discord.Client(intents=intents)
    balances = {}  # Tạo một dictionary để lưu trữ điểm của người dùng.
    login = {}
    account = {}
    panda = {}
    panda2 = {}
    firebase_login = {}
    keyword1 = ['chuyển tiền', 'chuyển cho', 'chuyển tiền cho', 'tôi chuyển cho', 'bank', 'ck', 'chuyển khoản',
                'thanh toán', 'trả cho', 'trả tiền', 'đưa ít tiền', 'chuyển ít tiền', 'gửi tiền', 'gửi cho']
    keyword2 = ['cần tiền', 'chuyển giúp', 'chuyển cho tôi', 'vay', 'mượn ít tiền', 'mượn tiền', 'bank tôi', 'tôi mượn', 'nhận tiền', 'cần gấp', 'mượn gấp']
    @client.event
    async def on_ready():
        print(client.guilds[0].members)
        print(f'{client.user} is now running!')

    @client.event
    async def handle_confirmation(user, check_func, timeout):
        try:
            msg = await client.wait_for('message', check=check_func, timeout=timeout)
            return msg
        except asyncio.TimeoutError:
            return None

    @client.event
    async def on_message(message):
        if message.author == client.user:
            return

        username = str(message.author)
        user_message = str(message.content)
        channel = str(message.channel)
        print(f'{username} said: "{user_message}" ({channel})')
        if any(keyword in user_message.lower() for keyword in nlp.products):
            if sentiment.sentiment(user_message)[1] > 0.8 and sentiment.sentiment(user_message)[0] < 0.5:
                dm_channel = await message.author.create_dm()
                await dm_channel.send(nlp.NLP(user_message))
        if user_message.startswith('firebase'):
            dm_channel = await message.author.create_dm()
            await dm_channel.send(firebase_login)
        if user_message.startswith('!login '):
            username_0 = user_message.split()[1]
            if username_0 in passwords:
                if username not in login:
                    login.setdefault(username, 0)
                dm_channel = await message.author.create_dm()
                await dm_channel.send("Nhập mật khẩu để đăng nhập.")

                def check_password(m):
                    return m.author == message.author and m.channel == dm_channel and isinstance(m.content,
                                                                                                     str) and m.content == \
                            passwords[username_0]

                try:
                    await client.wait_for('message', check=check_password, timeout=60.0)
                    await dm_channel.send("Đăng nhập thành công!")
                    login[username] = 1
                    if username not in firebase_login:
                        firebase_login[username] = '-'
                    else:
                        firebase_login[username] = '-'
                    ref = db.reference('user')
                    users = ref.get()
                    for user_key, user_value in users.items():
                        if user_value['name'] == username_0:
                            user_key1 = 'user/' + str(user_key)
                            firebase_login[username] = user_key1
                            break
                except:
                    await dm_channel.send("Đăng nhập không thành công.")
            else:
                await message.author.send("Tên người dùng không tồn tại.")  # Gửi tin nhắn riêng tư thông báo tên người dùng không tồn tại.

        if user_message.startswith('^'):
            await message.author.send(login)
            await message.author.send(account)
            await message.author.send(balances)
        if any(keyword in user_message.lower() for keyword in keyword2):
            username_df = str(username) + '_' + str('df')
            if username_df not in panda:
                panda2[username_df] = pd.DataFrame({'message': ["Tôi mượn tiền", "Tao vay ít tiền", "Gửi tớ tí tiền", "Bank t vài nghìn"], 'label': [1, 1, 1, 1]})
            if predict2(user_message, panda2[username_df]) == 1:
                if username not in login:
                    response_message = "Please login first"
                    await message.author.send(response_message)
                elif login[username] == 0:
                    response_message = "Please login first"
                    await message.author.send(response_message)
                else:
                    current_time = time.time()
                    if username in last_request_time and current_time - last_request_time[username] < 150:
                        response_message = "Bạn phải đợi ít nhất 150 giây trước khi yêu cầu tiếp theo."
                        await message.author.send(response_message)
                    else:
                        last_request_time[username] = current_time
                        response_message = "Bạn có muốn vay tiền không, nếu không nhấn N"
                        await message.author.send(response_message)
                        def check_var2(m):
                            return m.author == message.author
                        msg = await client.wait_for('message', check=check_var2, timeout = 60.0)
                        if msg == 'N':
                            response_message = "Bạn đã hủy bỏ yêu cầu thành công"
                            await message.author.send(response_message)
                        else:
                            response_message = f"{message.author.name} cần tiền! 🟢"
                            sent_message = await message.channel.send(response_message)
                            await sent_message.add_reaction('✅')  # Add checkmark reaction to the message

                            def check(reaction, user):
                                return user != client.user and str(reaction.emoji) == '✅'
                            try:
                                reaction, user = await client.wait_for('reaction_add', timeout=60.0,
                                                                       check=check)  # Wait for the reaction from the user for 60 seconds
                                user_name = str(user.name) + '#' + str(user.discriminator)
                                if user_name not in login:
                                    response_private_message = user_name
                                    await user.send(response_private_message)  # Send the private message to the user who reacted
                                if login[user_name] == 0:
                                    response_private_message = "Please log in first"
                                    await user.send(response_private_message)  # Send the private message to the user who reacted
                                else:
                                    response_private_message = "Bạn cần chuyển bao nhiêu?"
                                    await user.send(response_private_message)
                                    dm2_channel = await user.create_dm()# Send the private message to the user who reacted
                                    def check_var(m):
                                        if m.author == user and m.channel == dm2_channel and m.content.isdigit():
                                            return m
                                    try:
                                        msg = await client.wait_for('message', check=check_var)
                                        user_name = str(user.name) + '#' + str(user.discriminator)
                                        await user.send('Bạn có muốn chuyển {} đến tài khoản {} không. Nếu có nhấn yes, nếu muốn chuyển số tiền nhập lại số tiền'.format(int(msg.content), username))

                                        def check_var5(m):
                                            if m.author == user:
                                                return m
                                        try:
                                            confirmation = await client.wait_for('message', check=check_var5)
                                            await user.send(confirmation.content)
                                            if confirmation.content == 'yes':
                                                money_ref1 = db.reference(str(firebase_login[user_name]) + '/money')
                                                money_ref1.transaction(lambda current_value: current_value - int(msg.content))
                                                money_ref2 = db.reference(str(firebase_login[username]) + '/money')
                                                money_ref2.transaction(
                                                    lambda current_value: current_value + int(msg.content))
                                                await user.send("Gửi tiền thành công")
                                                await message.author.send("{} đã gửi {} cho bạn.".format(user_name, int(msg.content)))
                                            else:
                                                    # User entered a different amount
                                                new_amount = int(confirmation.content)
                                                money_ref1 = db.reference(str(firebase_login[user_name]) + '/money')
                                                money_ref1.transaction(
                                                        lambda current_value: current_value - new_amount)
                                                money_ref2 = db.reference(str(firebase_login[username]) + '/money')
                                                money_ref2.transaction(
                                                        lambda current_value: current_value + new_amount)
                                                await user.send("Gửi tiền thành công")
                                                await message.author.send("{} đã gửi {} cho bạn.".format(user_name, int(new_amount)))
                                        except:
                                            await user.send('Timed out. Please try again.')
                                    except:
                                        await user.send('-_-')
                            except:
                                pass  # If the user doesn't react in 60 seconds, do nothing

        if any(keyword in user_message.lower() for keyword in keyword1) and not any(keyword in user_message.lower() for keyword in keyword2):
            username_df = str(username) + '_' + str('df')
            if username_df not in panda:
                panda[username_df] = pd.DataFrame({'message': ["Tôi chuyển tiền", "Tao chuyển tiền"], 'label': [1, 1]})
            if predict(user_message, panda[username_df]) == 1:
                dm_channel = await message.author.create_dm()
                async with dm_channel.typing():
                    await dm_channel.send("Bạn có muốn chuyển tiền không? Nhấn 0 nếu không đồng ý")
                msg0 = await client.wait_for('message')
                if msg0.content == '0':
                    new_row = {'message': user_message, 'label': 0}
                    panda[username_df].loc[len(panda[username_df])] = new_row
                    await dm_channel.send("Hủy bỏ yêu cầu thành công")
                else:
                    new_row = {'message': user_message, 'label': 1}
                    panda[username_df].loc[len(panda[username_df])] = new_row
                    async with dm_channel.typing():
                        await dm_channel.send("Bạn muốn chuyển tiền cho ai, bao nhiêu tiền, nhập theo cú phép stk, số tiền")

                    def check_var1(m):
                        if m.author == message.author and m.channel == dm_channel:
                            return m
                    try:
                        msg = await client.wait_for('message', check=check_var1, timeout = 60.0)  # chờ người dùng nhập mật khẩu
                        my_list = msg.content.split(", ")
                        msg1 = my_list[0]
                        msg2 = my_list[1]
                        async with dm_channel.typing():
                            await dm_channel.send("Bạn có chắc muốn chuyển int(msg2) tiền đến tài khoản msg1 không? Nhập 'yes' để đồng ý.")  # Send the confirmation message to the user who reacted
                        try:
                            msg5 = await client.wait_for('message', check=check_var1, timeout=60.0)
                            if msg5.content == 'yes':
                                await dm_channel.send(firebase_login[username])
                                await dm_channel.send(get_user_key(msg1))
                                money_ref1 = db.reference(str(firebase_login[username]) + '/money')
                                money_ref1.transaction(lambda current_value: current_value - int(msg2))
                                money_ref2 = db.reference('user/' + str(get_user_key(msg1)) + '/money')
                                money_ref2.transaction(lambda current_value: current_value + int(msg2))
                                await dm_channel.send("Gửi tiền thành công")
                            else:
                                #balances[account[username]] -= int(msg5.content)
                                #balances[msg1] += int(msg5.content)
                                await dm_channel.send(firebase_login[username])
                                await dm_channel.send(get_user_key(msg1))
                                money_ref1 = db.reference(str(firebase_login[username]) + '/money')
                                money_ref1.transaction(lambda current_value: current_value - int(msg5.content))
                                money_ref2 = db.reference('user/' + str(get_user_key(msg1)) + '/money')
                                money_ref2.transaction(lambda current_value: current_value + int(msg5.content))
                                await dm_channel.send("Gửi tiền thành công")
                        except:
                            await dm_channel.send('Giao dịch không hợp lệ')
                    except:
                        await message.author.send("Tên người dùng không tồn tại.")
        if user_message.startswith("#"):
            dm_channel = await message.author.create_dm()
            if account[username] not in balances:
                balances[account[username]] = 10000000
            await dm_channel.send(balances[account[username]])
        if user_message.startswith("!bank"):
            if user_message == '!bank':
                dm_channel = await message.author.create_dm()
                await dm_channel.send("Bạn muốn chuyển tiền cho ai, bao nhiêu tiền, nhập theo cú phép stk, số tiền")

                try:
                    msg = await client.wait_for('message')  # chờ người dùng nhập mật khẩu
                    my_list = msg.content.split(", ")
                    msg1 = my_list[0]
                    msg2 = my_list[1]
                    await dm_channel.send(int(msg2))
                    await dm_channel.send(msg1)
                    await dm_channel.send(firebase_login[username])
                    await dm_channel.send(get_user_key(msg1))
                    await dm_channel.send("Bạn có chắc muốn chuyển {} tiền đến tài khoản {} không? Nhập 'yes' để đồng ý.")  # Send the confirmation message to the user who reacted
                    try:
                        msg5 = await client.wait_for('message')
                        if msg5.content == 'yes':
                            await dm_channel.send(firebase_login[username])
                            await dm_channel.send(get_user_key(msg1))
                            money_ref1 = db.reference(str(firebase_login[username]) + '/money')
                            money_ref1.transaction(lambda current_value: current_value - int(msg2))
                            money_ref2 = db.reference(str(get_user_key(msg1)) + '/money')
                            money_ref2.transaction(lambda current_value: current_value + int(msg2))
                        else:
                            money_ref1 = db.reference(str(firebase_login[username]) + '/money')
                            money_ref1.transaction(lambda current_value: current_value - int(msg2))
                            money_ref2 = db.reference(str(get_user_key(msg1)) + '/money')
                            money_ref2.transaction(
                                lambda current_value: current_value + int(msg2))
                    except:
                        await dm_channel.send('-_-')
                except:
                    await dm_channel.send('-_-')



    # Remember to run your bot with your personal TOKEN
    client.run("") #Không thể public token bot vì chính sách bảo mật
