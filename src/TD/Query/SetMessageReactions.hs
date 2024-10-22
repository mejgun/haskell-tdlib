module TD.Query.SetMessageReactions
  (SetMessageReactions(..)
  , defaultSetMessageReactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType

-- | Sets reactions on a message; for bots only. Returns 'TD.Data.Ok.Ok'
data SetMessageReactions
  = SetMessageReactions
    { chat_id        :: Maybe Int                         -- ^ Identifier of the chat to which the message belongs
    , message_id     :: Maybe Int                         -- ^ Identifier of the message
    , reaction_types :: Maybe [ReactionType.ReactionType] -- ^ Types of the reaction to set; pass an empty list to remove the reactions
    , is_big         :: Maybe Bool                        -- ^ Pass true if the reactions are added with a big animation
    }
  deriving (Eq, Show)

instance I.ShortShow SetMessageReactions where
  shortShow
    SetMessageReactions
      { chat_id        = chat_id_
      , message_id     = message_id_
      , reaction_types = reaction_types_
      , is_big         = is_big_
      }
        = "SetMessageReactions"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "message_id"     `I.p` message_id_
          , "reaction_types" `I.p` reaction_types_
          , "is_big"         `I.p` is_big_
          ]

instance AT.ToJSON SetMessageReactions where
  toJSON
    SetMessageReactions
      { chat_id        = chat_id_
      , message_id     = message_id_
      , reaction_types = reaction_types_
      , is_big         = is_big_
      }
        = A.object
          [ "@type"          A..= AT.String "setMessageReactions"
          , "chat_id"        A..= chat_id_
          , "message_id"     A..= message_id_
          , "reaction_types" A..= reaction_types_
          , "is_big"         A..= is_big_
          ]

defaultSetMessageReactions :: SetMessageReactions
defaultSetMessageReactions =
  SetMessageReactions
    { chat_id        = Nothing
    , message_id     = Nothing
    , reaction_types = Nothing
    , is_big         = Nothing
    }

