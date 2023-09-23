module RosePine

# using ..MakieThemes
using Makie, Colors

export theme_rosepine, ggthemr, style_rosepine, color_rosepine, rosepine_colorthemes


rosepine_colorthemes() = collect(keys(ColorTheme))


function style_rosepine(basewidth=2, spinewidth=basewidth * 0.75)
    return Attributes(
        linewidth=basewidth, fonts=(
            regular="Noto Sans",
            bold="Noto Sans Bold",
            italic="Noto Sans Italic",
            bold_italic="Noto Sans Bold Italic",
        ), Axis=Attributes(
            spinewidth=spinewidth,
            bottomspinevisible=true,
            topspinevisible=false,
            leftspinevisible=true,
            rightspinevisible=false,
            xgridwidth=basewidth,
            ygridwidth=basewidth,
            xgridstyle=:dash,
            ygridstyle=:dash,
        ), Axis3=Attributes(
            xspinewidth=spinewidth,
            yspinewidth=spinewidth,
            zspinewidth=spinewidth,
            xspinestyle=:dash,
            yspinestyle=:dash,
            zspinestyle=:dash,
            xgridstyle=:dash,
            ygridstyle=:dash,
            zgridstyle=:dash,
        ),
        Legend=Attributes(
            bgcolor=:transparent,
            framevisible=false,
        ),
        Scatter=Attributes(
            markersize=15,
            strokewidth=0,
        ),
    )
end

function color_rosepine(theme::Symbol)
    ct = ColorTheme[theme]
    palettes = merge(
        Attributes(
            color=ct[:swatch][2:end],
            patchcolor=ct[:swatch][2:end],
        ),
        Makie.default_palettes,
    )

    Attributes(
        backgroundcolor=Makie.to_color(ct[:background]),
        palette=palettes,
        color=ct[:swatch][2], # maybe it should be ct[:swatch][1], this is the color to use in absence of grouping
        textcolor=ct[:text][2],
        colormap=Makie.to_colormap(Makie.to_color.(ct[:gradient])),
        Axis=Attributes(
            backgroundcolor=:transparent,
            topspinecolor=Makie.to_color(ct[:line][2]),
            bottomspinecolor=Makie.to_color(ct[:line][2]),
            leftspinecolor=Makie.to_color(ct[:line][2]),
            rightspinecolor=Makie.to_color(ct[:line][2]),
            xgridcolor=Makie.to_color(ct[:gridline]),
            ygridcolor=Makie.to_color(ct[:gridline]),
            xminorgridcolor=Makie.to_color(ct[:gridline]),
            yminorgridcolor=Makie.to_color(ct[:gridline]),
            xtickcolor=Makie.to_color(ct[:gridline]),
            ytickcolor=Makie.to_color(ct[:gridline]),
        ),
        Axis3=Attributes(
            xspinecolor_1=Makie.to_color(ct[:line][2]),
            xspinecolor_2=Makie.to_color(ct[:line][2]),
            xspinecolor_3=Makie.to_color(ct[:line][2]),
            yspinecolor_1=Makie.to_color(ct[:line][2]),
            yspinecolor_2=Makie.to_color(ct[:line][2]),
            yspinecolor_3=Makie.to_color(ct[:line][2]),
            zspinecolor_1=Makie.to_color(ct[:line][2]),
            zspinecolor_2=Makie.to_color(ct[:line][2]),
            zspinecolor_3=Makie.to_color(ct[:line][2]),
            xgridcolor=Makie.to_color(ct[:gridline]),
            ygridcolor=Makie.to_color(ct[:gridline]),
            zgridcolor=Makie.to_color(ct[:gridline]),
            xtickcolor=Makie.to_color(ct[:gridline]),
            ytickcolor=Makie.to_color(ct[:gridline]),
            ztickcolor=Makie.to_color(ct[:gridline]),
        ),
        Legend=Attributes(
            framecolor=Makie.to_color(ct[:line][2]),
        ),
        Scatter=Attributes(
            strokecolor=Makie.to_color(ct[:background]),
        ),
    )
end

function theme_rosepine(theme::Symbol)
    merge(style_rosepine(), color_rosepine(theme))
end

rosepine(theme) = theme_rosepine(theme)

const ColorTheme = Dict{Symbol,Dict{Symbol,Any}}()


ColorTheme[:rosepinedawn] = Dict(
    :background => "#ffffff",
    :text => ["#555555", "#111111"],
    :line => ["#826A50", "#362C21"],
    :gridline => "#eee4da",
    :swatch => ["#111111", "#65ADC2", "#233B43", "#E84646", "#C29365", "#362C21", "#316675", "#168E7F", "#109B37"],
    :gradient => ["#65ADC2", "#362C21"]
)

ColorTheme[:rosepinemoon] = Dict(
    :background => "#36312C",
    :text => ["#555555", "#F8F8F0"],
    :line => ["#ffffff", "#827D77"],
    :gridline => "#504940",
    :swatch => ["#F8F8F0", "#DB784D", "#95CC5E", "#E84646", "#F8BB39", "#7A7267", "#E1AA93", "#168E7F", "#2B338E"],
    :gradient => ["#7A7267", "#DB784D"]
)

ColorTheme[:rosepine] = Dict(
    :background => "#191724",
    :text => ["#908caa", "#e0def4"],
    :line => ["#908caa", "#524f67"],
    :gridline => "#403d52",
    :swatch => ["#eb6f92", "#f6c177", "#ebbcba", "#31748f", "#9ccfd8", "#c4a7e7"],
    :gradient => ["#f1c40f", "#c0392b"]
)




end #module

