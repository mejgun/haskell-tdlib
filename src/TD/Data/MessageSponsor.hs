module TD.Data.MessageSponsor
  (MessageSponsor(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Photo as Photo

data MessageSponsor
  = MessageSponsor -- ^ Information about the sponsor of a message
    { url   :: Maybe T.Text      -- ^ URL of the sponsor to be opened when the message is clicked
    , photo :: Maybe Photo.Photo -- ^ Photo of the sponsor; may be null if must not be shown
    , info  :: Maybe T.Text      -- ^ Additional optional information about the sponsor to be shown along with the message
    }
  deriving (Eq, Show)

instance I.ShortShow MessageSponsor where
  shortShow MessageSponsor
    { url   = url_
    , photo = photo_
    , info  = info_
    }
      = "MessageSponsor"
        ++ I.cc
        [ "url"   `I.p` url_
        , "photo" `I.p` photo_
        , "info"  `I.p` info_
        ]

instance AT.FromJSON MessageSponsor where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageSponsor" -> parseMessageSponsor v
      _                -> mempty
    
    where
      parseMessageSponsor :: A.Value -> AT.Parser MessageSponsor
      parseMessageSponsor = A.withObject "MessageSponsor" $ \o -> do
        url_   <- o A..:?  "url"
        photo_ <- o A..:?  "photo"
        info_  <- o A..:?  "info"
        pure $ MessageSponsor
          { url   = url_
          , photo = photo_
          , info  = info_
          }
  parseJSON _ = mempty

