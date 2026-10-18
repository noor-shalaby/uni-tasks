import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle


def bresenham(x1, y1, x2, y2):
  dx = x2 - x1
  dy = y2 - y1

  x = x1
  y = y1
  points = []
  table = []

  # Handle direction steps if coordinates go backwards
  x_inc = 1 if x2 >= x1 else -1
  y_inc = 1 if y2 >= y1 else -1

  adx = abs(dx)
  ady = abs(dy)

  if ady <= adx:
    p = 2 * ady - adx
    while True:
      points.append((x, y))
      if x == x2:
        break
      if p < 0:
        new_p = p + 2 * ady
        table.append(((x, y), p, "Straight", new_p))
        x = x + x_inc
        p = new_p
      else:
        new_p = p + 2 * ady - 2 * adx
        table.append(((x, y), p, "Diagonal", new_p))
        x = x + x_inc
        y = y + y_inc
        p = new_p
  else:
    p = 2 * adx - ady
    while True:
      points.append((x, y))
      if y == y2:
        break
      if p < 0:
        new_p = p + 2 * adx
        table.append(((x, y), p, "Straight", new_p))
        y = y + y_inc
        p = new_p
      else:
        new_p = p + 2 * adx - 2 * ady
        table.append(((x, y), p, "Diagonal", new_p))
        x = x + x_inc
        y = y + y_inc
        p = new_p

  return points, table


def print_bresenham_table(table):
  print(f"{'Step':<7}{'Point (x,y)':<14}{'p':>5} {'Action':<10}Next p")
  for i, (pt, p, action, next_p) in enumerate(table):
    label = "Start" if i == 0 else str(i)
    print(f"{label:<7}{str(pt):<14}{p:>5} {action:<10}{next_p}")
  print(f"{'End':<7}{'Done':<14}{'-':>5} {'Done':<10}-")


def draw_bresenham(ax, pixels, p1, p2, title, color):
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
  p1, p2 = (2, 2), (5, 8)
  pixels, table = bresenham(*p1, *p2)

  print("=== Bresenham Line Algorithm Table ===")
  print_bresenham_table(table)

  fig, ax = plt.subplots(figsize=(6, 6))
  draw_bresenham(ax, pixels, p1, p2, "Bresenham Line Algorithm", "#b57edc")
  plt.tight_layout()
  plt.savefig("bresenham_output.png", dpi=150)
  plt.show()


if __name__ == "__main__":
  main()
