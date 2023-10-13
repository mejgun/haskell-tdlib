module TD.Query.GetMessageAddedReactions(GetMessageAddedReactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType
import qualified Data.Text as T

data GetMessageAddedReactions -- ^ Returns reactions added for a message, along with their sender
  = GetMessageAddedReactions
    { chat_id       :: Maybe Int                       -- ^ Identifier of the chat to which the message belongs
    , message_id    :: Maybe Int                       -- ^ Identifier of the message
    , reaction_type :: Maybe ReactionType.ReactionType -- ^ Type of the reactions to return; pass null to return all added reactions
    , offset        :: Maybe T.Text                    -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit         :: Maybe Int                       -- ^ The maximum number of reactions to be returned; must be positive and can't be greater than 100
    }
  deriving (Eq)

instance Show GetMessageAddedReactions where
  show
    GetMessageAddedReactions
      { chat_id       = chat_id_
      , message_id    = message_id_
      , reaction_type = reaction_type_
      , offset        = offset_
      , limit         = limit_
      }
        = "GetMessageAddedReactions"
          ++ I.cc
          [ "chat_id"       `I.p` chat_id_
          , "message_id"    `I.p` message_id_
          , "reaction_type" `I.p` reaction_type_
          , "offset"        `I.p` offset_
          , "limit"         `I.p` limit_
          ]

instance AT.ToJSON GetMessageAddedReactions where
  toJSON
    GetMessageAddedReactions
      { chat_id       = chat_id_
      , message_id    = message_id_
      , reaction_type = reaction_type_
      , offset        = offset_
      , limit         = limit_
      }
        = A.object
          [ "@type"         A..= AT.String "getMessageAddedReactions"
          , "chat_id"       A..= chat_id_
          , "message_id"    A..= message_id_
          , "reaction_type" A..= reaction_type_
          , "offset"        A..= offset_
          , "limit"         A..= limit_
          ]
