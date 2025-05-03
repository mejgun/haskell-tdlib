module TD.Data.Data
  (Data(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

data Data
  = Data -- ^ Contains some binary data
    { _data :: Maybe BS.ByteString -- ^ Data
    }
  deriving (Eq, Show)

instance I.ShortShow Data where
  shortShow Data
    { _data = _data_
    }
      = "Data"
        ++ I.cc
        [ "_data" `I.p` _data_
        ]

instance AT.FromJSON Data where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "data" -> parseData v
      _      -> mempty
    
    where
      parseData :: A.Value -> AT.Parser Data
      parseData = A.withObject "Data" $ \o -> do
        _data_ <- fmap I.readBytes <$> o A..:?  "data"
        pure $ Data
          { _data = _data_
          }
  parseJSON _ = mempty

