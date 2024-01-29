module TD.Data.ForwardSource
  (ForwardSource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

data ForwardSource
  = ForwardSource -- ^ Contains information about the last message from which a new message was forwarded last time
    { chat_id     :: Maybe Int                         -- ^ Identifier of the chat to which the message that was forwarded belonged; may be 0 if unknown
    , message_id  :: Maybe Int                         -- ^ Identifier of the message; may be 0 if unknown
    , sender_id   :: Maybe MessageSender.MessageSender -- ^ Identifier of the sender of the message; may be null if unknown or the new message was forwarded not to Saved Messages
    , sender_name :: Maybe T.Text                      -- ^ Name of the sender of the message if the sender is hidden by their privacy settings
    , date        :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the message is sent; 0 if unknown
    , is_outgoing :: Maybe Bool                        -- ^ True, if the message that was forwarded is outgoing; always false if sender is unknown
    }
  deriving (Eq, Show)

instance I.ShortShow ForwardSource where
  shortShow ForwardSource
    { chat_id     = chat_id_
    , message_id  = message_id_
    , sender_id   = sender_id_
    , sender_name = sender_name_
    , date        = date_
    , is_outgoing = is_outgoing_
    }
      = "ForwardSource"
        ++ I.cc
        [ "chat_id"     `I.p` chat_id_
        , "message_id"  `I.p` message_id_
        , "sender_id"   `I.p` sender_id_
        , "sender_name" `I.p` sender_name_
        , "date"        `I.p` date_
        , "is_outgoing" `I.p` is_outgoing_
        ]

instance AT.FromJSON ForwardSource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "forwardSource" -> parseForwardSource v
      _               -> mempty
    
    where
      parseForwardSource :: A.Value -> AT.Parser ForwardSource
      parseForwardSource = A.withObject "ForwardSource" $ \o -> do
        chat_id_     <- o A..:?  "chat_id"
        message_id_  <- o A..:?  "message_id"
        sender_id_   <- o A..:?  "sender_id"
        sender_name_ <- o A..:?  "sender_name"
        date_        <- o A..:?  "date"
        is_outgoing_ <- o A..:?  "is_outgoing"
        pure $ ForwardSource
          { chat_id     = chat_id_
          , message_id  = message_id_
          , sender_id   = sender_id_
          , sender_name = sender_name_
          , date        = date_
          , is_outgoing = is_outgoing_
          }
  parseJSON _ = mempty

