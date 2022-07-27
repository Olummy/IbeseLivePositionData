using JSON3
using DataFrames

files = filter(endswith("json"), readdir(raw"../IbeseLivePosition/data", join = true))


files_10 = last(files, 24)

df = JSON3.read.(read.(files_10, String)) |> DataFrame

