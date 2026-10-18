import math
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle


def ROUND(v):
  return int(math.floor(v + 0.5))


def dda(x1, y1, x2, y2):
  dx = x2 - x1
  dy = y2 - y1

  steps = abs(dx) if abs(dx) > abs(dy) else abs(dy)
  if steps == 0:
    return [(x1, y1)], [(0, float(x1), float(y1), x1, y1)]

  x_increment = dx / steps
  y_increment = dy / steps

  x = float(x1)
  y = float(y1)

  points = []
  table = []

  for i in range(0, steps + 1):
    rounded_x = ROUND(x)
    rounded_y = ROUND(y)
    points.append((rounded_x, rounded_y))
    table.append((i, x, y, rounded_x, rounded_y))

    x = x + x_increment
    y = y + y_increment

  return points, table


def print_dda_table(table):
  print(f"{'Step':<5}{'x':>8}{'y':>8}{'Round(x)':>10}{'Round(y)':>10} Plot Point")
  for i, x, y, rx, ry in table:
    print(f"{i:<5}{x:>8.3f}{y:>8.3f}{rx:>10}{ry:>10} ({rx},{ry})")


def draw_dda(ax, pixels, p1, p2, title, color):
  for px, py in pixels:
    ax.add_patch(
        Rectangle(
            (px - 0.5, py - 0.5), 1, 1, facecolor=color, edgecolor="gray", alpha=0.8
        )
    )

  xs = [p[0] for p in pixels]
  ys = [p[1] for p in pixels]

  ax.plot(
      xs,
      ys,
      "o--",
      color="black",
      markersize=4,
      linewidth=0.8,
      label="plotted pixels",
  )
  ax.plot(
      [p1[0], p2[0]],
      [p1[1], p2[1]],
      "-",
      color="blue",
      linewidth=1.5,
      label="ideal line",
  )

  for px, py in pixels:
    ax.annotate(
        f"({px},{py})",
        (px, py),
        textcoords="offset points",
        xytext=(0, 9),
        ha="center",
        fontsize=7,
    )

  ax.set_xlim(min(xs) - 1.5, max(xs) + 1.5)
  ax.set_ylim(min(ys) - 1.5, max(ys) + 1.5)
  ax.set_xticks(range(min(xs) - 1, max(xs) + 2))
  ax.set_yticks(range(min(ys) - 1, max(ys) + 2))
  ax.set_aspect("equal")
  ax.grid(True, linestyle=":", alpha=0.6)
  ax.set_xlabel("X-axis")
  ax.set_ylabel("Y-axis")
  ax.set_title(title, fontsize=10)
  ax.legend(loc="upper left", fontsize=7)


def main():
  p1, p2 = (2, 2), (8, 6)
  pixels, table = dda(*p1, *p2)

  print("=== DDA Line Algorithm Table ===")
  print_dda_table(table)

  fig, ax = plt.subplots(figsize=(6, 6))
  draw_dda(ax, pixels, p1, p2, "DDA Line Algorithm", "#ff7f7f")
  plt.tight_layout()
  plt.savefig("dda_output.png", dpi=150)
  plt.show()


if __name__ == "__main__":
  main()
