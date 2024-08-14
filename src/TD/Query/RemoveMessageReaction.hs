module TD.Query.RemoveMessageReaction
  (RemoveMessageReaction(..)
  , defaultRemoveMessageReaction
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType

-- | Removes a reaction from a message. A chosen reaction can always be removed. Returns 'TD.Data.Ok.Ok'
data RemoveMessageReaction
  = RemoveMessageReaction
    { chat_id       :: Maybe Int                       -- ^ Identifier of the chat to which the message belongs
    , message_id    :: Maybe Int                       -- ^ Identifier of the message
    , reaction_type :: Maybe ReactionType.ReactionType -- ^ Type of the reaction to remove. The paid reaction can't be removed
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveMessageReaction where
  shortShow
    RemoveMessageReaction
      { chat_id       = chat_id_
      , message_id    = message_id_
      , reaction_type = reaction_type_
      }
        = "RemoveMessageReaction"
          ++ I.cc
          [ "chat_id"       `I.p` chat_id_
          , "message_id"    `I.p` message_id_
          , "reaction_type" `I.p` reaction_type_
          ]

instance AT.ToJSON RemoveMessageReaction where
  toJSON
    RemoveMessageReaction
      { chat_id       = chat_id_
      , message_id    = message_id_
      , reaction_type = reaction_type_
      }
        = A.object
          [ "@type"         A..= AT.String "removeMessageReaction"
          , "chat_id"       A..= chat_id_
          , "message_id"    A..= message_id_
          , "reaction_type" A..= reaction_type_
          ]

defaultRemoveMessageReaction :: RemoveMessageReaction
defaultRemoveMessageReaction =
  RemoveMessageReaction
    { chat_id       = Nothing
    , message_id    = Nothing
    , reaction_type = Nothing
    }

