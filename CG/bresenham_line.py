def bresenham_line(x1, y1, x2, y2):
    pixels = []
    dx = abs(x2 - x1)
    dy = abs(y2 - y1)
    x, y = x1, y1

    x_inc = 1 if x2 > x1 else -1
    y_inc = 1 if y2 > y1 else -1

    if dx >= dy:
        p = 2 * dy - dx
        while x != x2 + x_inc:
            pixels.append((x, y))
            if p >= 0:
                y += y_inc
                p -= 2 * dx
            p += 2 * dy
            x += x_inc
    else:
        p = 2 * dx - dy
        while y != y2 + y_inc:
            pixels.append((x, y))
            if p >= 0:
                x += x_inc
                p -= 2 * dy
            p += 2 * dx
            y += y_inc

    return pixels


line_pixels = bresenham_line(10, 10, 20, 35)
for pixel in line_pixels:
    print(pixel)
