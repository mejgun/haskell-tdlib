module TD.Lib.Internal
  ( Extra (..),
    ShortShow (..),
    p,
    cc,
    readInt64,
    writeInt64,
    readBytes,
    writeBytes,
  )
where

import Data.Aeson qualified as A
import Data.Aeson.Types qualified as AT
import Data.ByteString qualified as BS
import Data.ByteString.Base64 qualified as B64
import Data.Hashable (Hashable)
import Data.List (intercalate)
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import GHC.Generics (Generic)

newtype Extra = Extra String
  deriving (Eq, Generic)

instance Hashable Extra

instance AT.FromJSON Extra where
  parseJSON (AT.Object obj) = Extra <$> obj A..: "@extra"
  parseJSON _ = mempty

-- | Show class alternative that hides unset and bytes values,
-- multiline text values are shown as single line
class ShortShow a where
  shortShow :: a -> String

instance ShortShow Int where
  shortShow = show

instance ShortShow Double where
  shortShow = show

instance ShortShow Bool where
  shortShow = show

instance ShortShow T.Text where
  shortShow x =
    T.unpack
      . T.cons '"'
      . T.intercalate " "
      . T.lines
      $ T.snoc x '"'

instance ShortShow BS.ByteString where
  shortShow _ = "<bytes>"

instance (ShortShow a) => ShortShow [a] where
  shortShow xs = "[" <> intercalate ", " (map shortShow xs) <> "]"

p :: (ShortShow a) => String -> Maybe a -> String
p k (Just v) = k ++ " = " ++ shortShow v
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"

readInt64 :: String -> Int
readInt64 = read

writeInt64 :: Int -> AT.Value
writeInt64 = AT.String . T.pack . show

-- decode base64 string as bytestring
readBytes :: String -> BS.ByteString
readBytes = B64.decodeLenient . TE.encodeUtf8 . T.pack

-- encode bytestring as base64 string
writeBytes :: BS.ByteString -> AT.Value
writeBytes x = AT.String . TE.decodeUtf8 $ B64.encode x
