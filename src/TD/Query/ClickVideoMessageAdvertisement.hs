module TD.Query.ClickVideoMessageAdvertisement
  (ClickVideoMessageAdvertisement(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that the user clicked a video message advertisement. Returns 'TD.Data.Ok.Ok'
data ClickVideoMessageAdvertisement
  = ClickVideoMessageAdvertisement
    { advertisement_unique_id :: Maybe Int -- ^ Unique identifier of the advertisement
    }
  deriving (Eq, Show)

instance I.ShortShow ClickVideoMessageAdvertisement where
  shortShow
    ClickVideoMessageAdvertisement
      { advertisement_unique_id = advertisement_unique_id_
      }
        = "ClickVideoMessageAdvertisement"
          ++ I.cc
          [ "advertisement_unique_id" `I.p` advertisement_unique_id_
          ]

instance AT.ToJSON ClickVideoMessageAdvertisement where
  toJSON
    ClickVideoMessageAdvertisement
      { advertisement_unique_id = advertisement_unique_id_
      }
        = A.object
          [ "@type"                   A..= AT.String "clickVideoMessageAdvertisement"
          , "advertisement_unique_id" A..= advertisement_unique_id_
          ]

