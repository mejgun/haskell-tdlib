module TD.Data.MessageForwardInfo
  (MessageForwardInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageOrigin as MessageOrigin
import qualified TD.Data.ForwardSource as ForwardSource
import qualified Data.Text as T

data MessageForwardInfo
  = MessageForwardInfo -- ^ Contains information about a forwarded message
    { origin                           :: Maybe MessageOrigin.MessageOrigin -- ^ Origin of the forwarded message
    , date                             :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the message was originally sent
    , source                           :: Maybe ForwardSource.ForwardSource -- ^ For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group, information about the source message from which the message was forwarded last time; may be null for other forwards or if unknown
    , public_service_announcement_type :: Maybe T.Text                      -- ^ The type of public service announcement for the forwarded message
    }
  deriving (Eq, Show)

instance I.ShortShow MessageForwardInfo where
  shortShow MessageForwardInfo
    { origin                           = origin_
    , date                             = date_
    , source                           = source_
    , public_service_announcement_type = public_service_announcement_type_
    }
      = "MessageForwardInfo"
        ++ I.cc
        [ "origin"                           `I.p` origin_
        , "date"                             `I.p` date_
        , "source"                           `I.p` source_
        , "public_service_announcement_type" `I.p` public_service_announcement_type_
        ]

instance AT.FromJSON MessageForwardInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageForwardInfo" -> parseMessageForwardInfo v
      _                    -> mempty
    
    where
      parseMessageForwardInfo :: A.Value -> AT.Parser MessageForwardInfo
      parseMessageForwardInfo = A.withObject "MessageForwardInfo" $ \o -> do
        origin_                           <- o A..:?  "origin"
        date_                             <- o A..:?  "date"
        source_                           <- o A..:?  "source"
        public_service_announcement_type_ <- o A..:?  "public_service_announcement_type"
        pure $ MessageForwardInfo
          { origin                           = origin_
          , date                             = date_
          , source                           = source_
          , public_service_announcement_type = public_service_announcement_type_
          }
  parseJSON _ = mempty

