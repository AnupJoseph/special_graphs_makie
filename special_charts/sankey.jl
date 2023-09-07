using PlotlyJS
using ColorSchemes
using Colors


src = [1, 1, 1, 1, 2, 2, 2, 3, 4, 5]
dst = [6, 3, 7, 4, 3, 7, 4, 7, 8, 8]
weights = [0.1, 0.3, 0.5, 0.5, 0.2, 2.8, 1, 0.45, 4.5, 3.3]
node_colors = hex.(get(colorschemes[:Spectral_10], collect(0.1:0.1:0.8)))
node_colors = "#" .* node_colors
fig = plot(sankey(
        node=attr(
            pad=15,
            thickness=20,
            line=attr(color="black", width=0.5),
            label=["A1", "A2", "B1", "B2", "C1", "C2"],
            color=node_colors
        ),
        link=attr(
            source=src, # indices correspond to labels, eg A1, A2, A1, B1, ...
            target=dst,
            value=weights
        )),
    Layout(title_text="Basic Sankey Diagram", font_size=10)
)
