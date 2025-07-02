module TD.Data.AdvertisementSponsor
  (AdvertisementSponsor(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Photo as Photo

data AdvertisementSponsor
  = AdvertisementSponsor -- ^ Information about the sponsor of an advertisement
    { url   :: Maybe T.Text      -- ^ URL of the sponsor to be opened when the advertisement is clicked
    , photo :: Maybe Photo.Photo -- ^ Photo of the sponsor; may be null if must not be shown
    , info  :: Maybe T.Text      -- ^ Additional optional information about the sponsor to be shown along with the advertisement
    }
  deriving (Eq, Show)

instance I.ShortShow AdvertisementSponsor where
  shortShow AdvertisementSponsor
    { url   = url_
    , photo = photo_
    , info  = info_
    }
      = "AdvertisementSponsor"
        ++ I.cc
        [ "url"   `I.p` url_
        , "photo" `I.p` photo_
        , "info"  `I.p` info_
        ]

instance AT.FromJSON AdvertisementSponsor where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "advertisementSponsor" -> parseAdvertisementSponsor v
      _                      -> mempty
    
    where
      parseAdvertisementSponsor :: A.Value -> AT.Parser AdvertisementSponsor
      parseAdvertisementSponsor = A.withObject "AdvertisementSponsor" $ \o -> do
        url_   <- o A..:?  "url"
        photo_ <- o A..:?  "photo"
        info_  <- o A..:?  "info"
        pure $ AdvertisementSponsor
          { url   = url_
          , photo = photo_
          , info  = info_
          }
  parseJSON _ = mempty

