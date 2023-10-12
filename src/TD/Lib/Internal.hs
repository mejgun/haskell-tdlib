module TD.Lib.Internal where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.ByteString as BS
import qualified Data.ByteString.Base64 as B64
import Data.List (intercalate)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
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
readBytes = B64.decodeLenient . TE.encodeUtf8 . T.pack

-- encode bytestring as base64 string
writeBytes :: BS.ByteString -> AT.Value
writeBytes x = AT.String . TE.decodeUtf8 $ B64.encode x

writeInt64 :: Int -> AT.Value
writeInt64 = AT.String . T.pack . show
