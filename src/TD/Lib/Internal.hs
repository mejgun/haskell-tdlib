module TD.Lib.Internal where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.ByteString as BS
import Data.List (intercalate)
import qualified Data.Text as T
import qualified Text.Read as TR (readMaybe)

newtype Extra = Extra String
  deriving (Eq)

instance AT.FromJSON Extra where
  parseJSON v@(AT.Object obj) = Extra <$> obj A..: "@extra"

p :: (Show a) => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"

readInt64 :: String -> Int
readInt64 = read

readListInt64 :: Maybe [String] -> Maybe [Int]
readListInt64 = fmap (map read)

-- decode base64 string as bytestring
readBytes :: String -> BS.ByteString
readBytes = undefined

-- decode base64 string as bytestring
readListBytes :: Maybe [String] -> Maybe [BS.ByteString]
readListBytes = undefined

-- encode bytestring as base64 string
toB :: Maybe BS.ByteString -> AT.Value
toB (Just x) = undefined
toB Nothing = AT.Null

-- encode bytestring list as base64 string
toLB :: Maybe [BS.ByteString] -> AT.Value
toLB (Just xs) = undefined
toLB Nothing = AT.Null

toS :: (Show a) => Maybe a -> AT.Value
toS (Just x) = AT.String . T.pack $ show x
toS Nothing = AT.Null

toLS :: (Show a) => Maybe [a] -> [AT.Value]
toLS (Just xs) = map (AT.String . T.pack . show) xs
toLS Nothing = []