"""Generate the original RoddSoft Edition title ribbon.

Requires Pillow. The output is authored mod artwork and contains no ROM data.
"""
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "assets" / "roddsoft_edition.png"
OUT.parent.mkdir(parents=True, exist_ok=True)

# Draw at 1x with Pillow's built-in bitmap font, then scale 2x with nearest
# neighbour for deliberately crisp pixels.
label = "RoddSoft Edition"
font = ImageFont.load_default()
probe = Image.new("RGBA", (1, 1))
draw = ImageDraw.Draw(probe)
box = draw.textbbox((0, 0), label, font=font)
w, h = box[2] - box[0], box[3] - box[1]
small = Image.new("RGBA", (64, 8), (0, 0, 0, 0))
d = ImageDraw.Draw(small)
x = max(0, (64 - w) // 2)
y = max(-1, (8 - h) // 2 - box[1])
d.text((x, y), label, font=font, fill=(0, 0, 0, 255))
img = small.resize((128, 16), Image.Resampling.NEAREST)
img.save(OUT)
print(OUT)
