from typing import Tuple

# EMU units per inch
EMU_PER_INCH: int = 914400
# PowerPoint default DPI
DPI: int = 96
# EMU units per pixel
EMU_PER_PX: float = EMU_PER_INCH / DPI

# Slide width (16 inches)
SLIDE_WIDTH: int = 16 * EMU_PER_INCH
# Slide height (9 inches)
SLIDE_HEIGHT: int = 9 * EMU_PER_INCH

# Supported image file extensions
IMAGE_EXTENSIONS: Tuple[str, ...] = (
    '.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff'
)