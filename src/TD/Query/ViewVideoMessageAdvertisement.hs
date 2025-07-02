module TD.Query.ViewVideoMessageAdvertisement
  (ViewVideoMessageAdvertisement(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that the user viewed a video message advertisement. Returns 'TD.Data.Ok.Ok'
data ViewVideoMessageAdvertisement
  = ViewVideoMessageAdvertisement
    { advertisement_unique_id :: Maybe Int -- ^ Unique identifier of the advertisement
    }
  deriving (Eq, Show)

instance I.ShortShow ViewVideoMessageAdvertisement where
  shortShow
    ViewVideoMessageAdvertisement
      { advertisement_unique_id = advertisement_unique_id_
      }
        = "ViewVideoMessageAdvertisement"
          ++ I.cc
          [ "advertisement_unique_id" `I.p` advertisement_unique_id_
          ]

instance AT.ToJSON ViewVideoMessageAdvertisement where
  toJSON
    ViewVideoMessageAdvertisement
      { advertisement_unique_id = advertisement_unique_id_
      }
        = A.object
          [ "@type"                   A..= AT.String "viewVideoMessageAdvertisement"
          , "advertisement_unique_id" A..= advertisement_unique_id_
          ]

