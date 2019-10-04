using Formatting


printVert(a) = (for aᵢ in a;    println(aᵢ);    end)


#-------------------------------------------------------------------------------
function printVert(a, decimals)
    pad_leftSide = 0
    for aᵢ in a

        digits_leftSide = 1 + convert(Int64, floor(log10(abs(aᵢ))))
        commas = (digits_leftSide - 1) ÷ 3

        if aᵢ < 0
            chars_leftSide = 1 + digits_leftSide + commas
        else
            chars_leftSide = digits_leftSide + commas
        end

        if chars_leftSide > pad_leftSide
            pad_leftSide = chars_leftSide
        end
    end

    pad_total = pad_leftSide + 1 + decimals
    for aᵢ in a
        println(lpad(format(aᵢ, commas=true, precision=decimals), pad_total))
    end
end
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
function textVert(a)
    res = ""
    for aᵢ in a
        res *= string(aᵢ) * "\n"
    end

    res # returned
end
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
function textVert(a, decimals)
    res = ""

    pad_leftSide = 0
    for aᵢ in a

        digits_leftSide = 1 + convert(Int64, floor(log10(abs(aᵢ))))
        commas = (digits_leftSide - 1) ÷ 3

        if aᵢ < 0
            chars_leftSide = 1 + digits_leftSide + commas
        else
            chars_leftSide = digits_leftSide + commas
        end

        if chars_leftSide > pad_leftSide
            pad_leftSide = chars_leftSide
        end
    end

    pad_total = pad_leftSide + 1 + decimals
    for aᵢ in a
        aᵢ_fmd = lpad(format(aᵢ, commas=true, precision=decimals), pad_total)
        res *=  aᵢ_fmd * "\n"
    end

    res # returned
end
#-------------------------------------------------------------------------------



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function main()
    println("\n", "-"^50, "\n")

    N = 20
    pwr_lim = 7
    decimals = 5


    arr = [10^(2pwr_lim*rand() - pwr_lim)    for i = 1 : N]

    for i = 1 : length(arr)
        if rand(Bool);    arr[i] *= -1;    end
    end

    println("Array of $N random elements:\n")
    println(arr)
    println("\n"^4, "Using printVert():\n")
    printVert(arr, decimals)
    println("\n"^4, "Using print(textVert()):\n")
    print(textVert(arr, decimals))
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
main()
