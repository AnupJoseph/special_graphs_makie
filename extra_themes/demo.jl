include("rosepine.jl")
using .RosePine
using CairoMakie

function demoscatter(theme::Attributes=Makie.current_default_theme(); legend_vertical=true, legend_outside_axis=true)
    CairoMakie.with_theme(theme) do
        fig, ax, p1 = scatter(randn(20), randn(20); label="Variable 1")
        scatter!(ax, randn(20), randn(20); label="Variable 2")
        scatter!(ax, randn(20), randn(20); label="Variable 3")
        scatter!(ax, randn(20), randn(20); label="Variable 4")
        scatter!(ax, randn(20), randn(20); label="Variable 5")

        if legend_outside_axis
            if legend_vertical
                Legend(fig[1, 2], ax)
            else
                Legend(fig[2, 1], ax; orientation=:horizontal)
            end
        else
            axislegend(ax; orientation=legend_vertical ? :vertical : :horizontal)
        end
        return fig
    end
end

demoscatter(theme_rosepine(:rosepine))
