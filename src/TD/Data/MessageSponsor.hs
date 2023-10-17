module TD.Data.MessageSponsor
  (MessageSponsor(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSponsorType as MessageSponsorType
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified Data.Text as T

data MessageSponsor
  = MessageSponsor -- ^ Information about the sponsor of a message
    { _type :: Maybe MessageSponsorType.MessageSponsorType -- ^ Type of the sponsor
    , photo :: Maybe ChatPhotoInfo.ChatPhotoInfo           -- ^ Photo of the sponsor; may be null if must not be shown
    , info  :: Maybe T.Text                                -- ^ Additional optional information about the sponsor to be shown along with the message
    }
  deriving (Eq, Show)

instance I.ShortShow MessageSponsor where
  shortShow MessageSponsor
    { _type = _type_
    , photo = photo_
    , info  = info_
    }
      = "MessageSponsor"
        ++ I.cc
        [ "_type" `I.p` _type_
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
        _type_ <- o A..:?  "type"
        photo_ <- o A..:?  "photo"
        info_  <- o A..:?  "info"
        pure $ MessageSponsor
          { _type = _type_
          , photo = photo_
          , info  = info_
          }
  parseJSON _ = mempty

