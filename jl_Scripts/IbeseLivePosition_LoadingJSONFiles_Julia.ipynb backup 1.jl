{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "2c493cc3",
   "metadata": {},
   "outputs": [],
   "source": [
    "using JSON3\n",
    "using DataFrames"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "a24f4d82",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "978-element Vector{String}:\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 08-00-10-937088.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 09-00-10-752455.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 10-00-10-590121.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 11-00-10-834454.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 12-00-10-414822.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 13-00-10-403351.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 14-00-10-870962.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 15-00-10-140289.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 16-00-10-385213.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 17-00-10-131293.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 18-00-10-600503.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 19-00-10-869135.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-06-10 20-00-10-380494.json\"\n",
       " ⋮\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 15-33-26-462340.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 15-48-26-114606.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 16-04-26-540538.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 16-49-26-403560.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 17-04-26-750034.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 17-21-26-369440.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 17-35-26-411152.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 17-52-26-027126.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 18-04-26-474177.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 18-18-26-476665.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 18-33-26-005044.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 18-48-26-663855.json\""
      ]
     },
     "execution_count": 3,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "files = filter(endswith(\"json\"), readdir(raw\"../IbeseLivePosition/data\", join = true))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "5d0d6414",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "20-element Vector{String}:\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 13-33-26-441930.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 13-49-26-793684.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 14-04-26-903996.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 14-18-26-800312.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 14-33-26-696937.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 14-50-26-856318.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 15-04-26-130250.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 15-18-26-320579.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 15-33-26-462340.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 15-48-26-114606.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 16-04-26-540538.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 16-49-26-403560.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 17-04-26-750034.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 17-21-26-369440.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 17-35-26-411152.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 17-52-26-027126.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 18-04-26-474177.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 18-18-26-476665.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 18-33-26-005044.json\"\n",
       " \"../IbeseLivePosition/data\\\\livePosition-2022-07-26 18-48-26-663855.json\""
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "files_10 = last(files, 24)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "5cb6ae4a",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "  6.415305 seconds (4.49 M allocations: 1.514 GiB, 9.64% gc time, 32.18% compilation time)\n"
     ]
    }
   ],
   "source": [
    "@time df = JSON3.read.(read.(files_10, String)) |> DataFrame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "91a1b4ad",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Julia 1.7.1",
   "language": "julia",
   "name": "julia-1.7"
  },
  "language_info": {
   "file_extension": ".jl",
   "mimetype": "application/julia",
   "name": "julia",
   "version": "1.7.1"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
