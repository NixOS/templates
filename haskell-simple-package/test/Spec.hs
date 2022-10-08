import Test.Hspec
import ExampleLibrary(invert)

main :: IO ()
main = hspec $ do
    describe "test simple functions" $ do
        it "ensures invert True is False" $ do
            invert True `shouldBe` False

