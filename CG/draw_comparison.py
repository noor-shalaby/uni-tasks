import matplotlib.pyplot as plt

# Import the core algorithms from your separate scripts
from draw_bresenham_line import bresenham, draw_bresenham
from draw_dda_line import dda, draw_dda


def main():
  p1, p2 = (2, 2), (8, 6)
  q1, q2 = (2, 2), (5, 8)

  dda_pixels, _ = dda(*p1, *p2)
  br1_pixels, _ = bresenham(*p1, *p2)
  br2_pixels, _ = bresenham(*q1, *q2)

  fig, axes = plt.subplots(1, 3, figsize=(17, 6))

  draw_dda(
      axes[0], dda_pixels, p1, p2, "DDA: line from (2,2) to (8,6)", "#ff7f7f"
  )

  draw_bresenham(
      axes[1],
      br1_pixels,
      p1,
      p2,
      "Bresenham (m <= 1): (2,2) to (8,6)",
      "#9e9e9e",
  )

  draw_bresenham(
      axes[2], br2_pixels, q1, q2, "Bresenham (m > 1): (2,2) to (5,8)", "#b57edc"
  )

  fig.suptitle("Line Drawing Algorithms - DDA vs Bresenham", fontsize=13)

  plt.tight_layout()
  plt.savefig("line_algorithms_comparison.png", dpi=150)
  print("Saved comparison figure successfully as line_algorithms_comparison.png!")
  plt.show()


if __name__ == "__main__":
  main()
