module TD.Query.TogglePaidMessageReactionIsAnonymous
  (TogglePaidMessageReactionIsAnonymous(..)
  , defaultTogglePaidMessageReactionIsAnonymous
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes whether the paid message reaction of the user to a message is anonymous. The message must have paid reaction added by the user. Returns 'TD.Data.Ok.Ok'
data TogglePaidMessageReactionIsAnonymous
  = TogglePaidMessageReactionIsAnonymous
    { chat_id      :: Maybe Int  -- ^ Identifier of the chat to which the message belongs
    , message_id   :: Maybe Int  -- ^ Identifier of the message
    , is_anonymous :: Maybe Bool -- ^ Pass true to make paid reaction of the user on the message anonymous; pass false to make the user's profile visible among top reactors
    }
  deriving (Eq, Show)

instance I.ShortShow TogglePaidMessageReactionIsAnonymous where
  shortShow
    TogglePaidMessageReactionIsAnonymous
      { chat_id      = chat_id_
      , message_id   = message_id_
      , is_anonymous = is_anonymous_
      }
        = "TogglePaidMessageReactionIsAnonymous"
          ++ I.cc
          [ "chat_id"      `I.p` chat_id_
          , "message_id"   `I.p` message_id_
          , "is_anonymous" `I.p` is_anonymous_
          ]

instance AT.ToJSON TogglePaidMessageReactionIsAnonymous where
  toJSON
    TogglePaidMessageReactionIsAnonymous
      { chat_id      = chat_id_
      , message_id   = message_id_
      , is_anonymous = is_anonymous_
      }
        = A.object
          [ "@type"        A..= AT.String "togglePaidMessageReactionIsAnonymous"
          , "chat_id"      A..= chat_id_
          , "message_id"   A..= message_id_
          , "is_anonymous" A..= is_anonymous_
          ]

defaultTogglePaidMessageReactionIsAnonymous :: TogglePaidMessageReactionIsAnonymous
defaultTogglePaidMessageReactionIsAnonymous =
  TogglePaidMessageReactionIsAnonymous
    { chat_id      = Nothing
    , message_id   = Nothing
    , is_anonymous = Nothing
    }

