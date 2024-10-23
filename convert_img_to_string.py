from PIL import Image
import base64


if __name__ == "__main__":
    with open("tile_images/hex_place_logo.png", "rb") as f:
        encoded_image = base64.b64encode(f.read())
        print("image encoded:")
        print(encoded_image.decode('utf-8'))

