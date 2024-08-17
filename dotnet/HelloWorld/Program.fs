namespace HelloWorld

[<RequireQualifiedAccess>]
module Program =

    let construct (name : string) : string = sprintf "Hello, %s!" name

    [<EntryPoint>]
    let main argv =
        match argv |> Array.tryExactlyOne with
        | Some name ->
            printfn "%s" (construct name)
            0
        | None ->
            eprintfn "Expected exactly one argument"
            1
