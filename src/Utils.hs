module Utils where

import Data.List (intercalate)
import qualified Text.Read as TR (readMaybe)

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"

rm :: Read a => String -> Maybe a
rm = TR.readMaybe
