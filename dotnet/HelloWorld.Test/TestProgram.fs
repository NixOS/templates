namespace HelloWorld.Test

open HelloWorld
open NUnit.Framework
open FsUnitTyped

[<TestFixture>]
module TestSchema =

    [<Test>]
    let ``Interpolates correctly`` () =
        Program.construct "Nix" |> shouldEqual "Hello, Nix!"
