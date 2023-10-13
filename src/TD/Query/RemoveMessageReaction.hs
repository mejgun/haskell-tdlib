module TD.Query.RemoveMessageReaction(RemoveMessageReaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType

data RemoveMessageReaction -- ^ Removes a reaction from a message. A chosen reaction can always be removed
  = RemoveMessageReaction
    { chat_id       :: Maybe Int                       -- ^ Identifier of the chat to which the message belongs
    , message_id    :: Maybe Int                       -- ^ Identifier of the message
    , reaction_type :: Maybe ReactionType.ReactionType -- ^ Type of the reaction to remove
    }
  deriving (Eq)

instance Show RemoveMessageReaction where
  show
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
