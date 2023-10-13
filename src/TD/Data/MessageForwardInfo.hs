module TD.Data.MessageForwardInfo
  ( MessageForwardInfo(..)    
  , defaultMessageForwardInfo 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageForwardOrigin as MessageForwardOrigin
import qualified Data.Text as T

data MessageForwardInfo
  = MessageForwardInfo -- ^ Contains information about a forwarded message
    { origin                           :: Maybe MessageForwardOrigin.MessageForwardOrigin -- ^ Origin of a forwarded message
    , date                             :: Maybe Int                                       -- ^ Point in time (Unix timestamp) when the message was originally sent
    , public_service_announcement_type :: Maybe T.Text                                    -- ^ The type of a public service announcement for the forwarded message
    , from_chat_id                     :: Maybe Int                                       -- ^ For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group, the identifier of the chat from which the message was forwarded last time; 0 if unknown
    , from_message_id                  :: Maybe Int                                       -- ^ For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group, the identifier of the original message from which the new message was forwarded last time; 0 if unknown
    }
  deriving (Eq)

instance Show MessageForwardInfo where
  show MessageForwardInfo
    { origin                           = origin_
    , date                             = date_
    , public_service_announcement_type = public_service_announcement_type_
    , from_chat_id                     = from_chat_id_
    , from_message_id                  = from_message_id_
    }
      = "MessageForwardInfo"
        ++ I.cc
        [ "origin"                           `I.p` origin_
        , "date"                             `I.p` date_
        , "public_service_announcement_type" `I.p` public_service_announcement_type_
        , "from_chat_id"                     `I.p` from_chat_id_
        , "from_message_id"                  `I.p` from_message_id_
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
        public_service_announcement_type_ <- o A..:?  "public_service_announcement_type"
        from_chat_id_                     <- o A..:?  "from_chat_id"
        from_message_id_                  <- o A..:?  "from_message_id"
        pure $ MessageForwardInfo
          { origin                           = origin_
          , date                             = date_
          , public_service_announcement_type = public_service_announcement_type_
          , from_chat_id                     = from_chat_id_
          , from_message_id                  = from_message_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageForwardInfo where
  toJSON MessageForwardInfo
    { origin                           = origin_
    , date                             = date_
    , public_service_announcement_type = public_service_announcement_type_
    , from_chat_id                     = from_chat_id_
    , from_message_id                  = from_message_id_
    }
      = A.object
        [ "@type"                            A..= AT.String "messageForwardInfo"
        , "origin"                           A..= origin_
        , "date"                             A..= date_
        , "public_service_announcement_type" A..= public_service_announcement_type_
        , "from_chat_id"                     A..= from_chat_id_
        , "from_message_id"                  A..= from_message_id_
        ]

defaultMessageForwardInfo :: MessageForwardInfo
defaultMessageForwardInfo =
  MessageForwardInfo
    { origin                           = Nothing
    , date                             = Nothing
    , public_service_announcement_type = Nothing
    , from_chat_id                     = Nothing
    , from_message_id                  = Nothing
    }

