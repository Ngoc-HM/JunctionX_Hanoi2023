import nltk
nltk.download('punkt')
nltk.download('stopwords')
from pyvi import ViTokenizer
products = ['phở', 'bún chả', 'bánh mì', 'cà phê', 'trà đá', 'nước ngọt', 'hamburger', 'cơm tấm', 'bánh xèo',
                'bún bò', 'bún riêu', 'chả cá', 'bún mắm', 'bánh cuốn', 'cà phê sữa đá', 'nước ép trái cây', 'sữa chua',
                'chè', 'gà rán', 'lẩu', 'sinh tố', 'cacao', 'trà đào', 'trà chanh', 'trà quất', 'trà tắc', 'sữa tươi', 'xúc xích', 'xiên nướng', 'xôi gấc', 'xôi xéo',
'socola', 'bánh quy', 'kẹo', 'bò húc', 'pizza', 'bim bim']
def NLP(message):
    new_products = [ViTokenizer.tokenize(product) for product in products]
    product_counts = {product: 0 for product in new_products}
    tokens = ViTokenizer.tokenize(message)

    # Kiểm tra từng từ trong new_products có trong tokens hay không
    for product in new_products:
        if product in tokens:
            product_counts[product] += 1

    result = []
    for product, count in product_counts.items():
        if count > 0:
            result.append(product)

    # Trả về danh sách các sản phẩm có số lượng lớn hơn 0
    return result
