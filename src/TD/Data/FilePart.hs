module TD.Data.FilePart
  (FilePart(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

data FilePart
  = FilePart -- ^ Contains a part of a file
    { _data :: Maybe BS.ByteString -- ^ File bytes
    }
  deriving (Eq, Show)

instance I.ShortShow FilePart where
  shortShow FilePart
    { _data = _data_
    }
      = "FilePart"
        ++ I.cc
        [ "_data" `I.p` _data_
        ]

instance AT.FromJSON FilePart where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "filePart" -> parseFilePart v
      _          -> mempty
    
    where
      parseFilePart :: A.Value -> AT.Parser FilePart
      parseFilePart = A.withObject "FilePart" $ \o -> do
        _data_ <- fmap I.readBytes <$> o A..:?  "data"
        pure $ FilePart
          { _data = _data_
          }
  parseJSON _ = mempty

