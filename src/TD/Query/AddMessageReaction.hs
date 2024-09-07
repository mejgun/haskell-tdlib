module TD.Query.AddMessageReaction
  (AddMessageReaction(..)
  , defaultAddMessageReaction
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType

-- | Adds a reaction or a tag to a message. Use getMessageAvailableReactions to receive the list of available reactions for the message. Returns 'TD.Data.Ok.Ok'
data AddMessageReaction
  = AddMessageReaction
    { chat_id                 :: Maybe Int                       -- ^ Identifier of the chat to which the message belongs
    , message_id              :: Maybe Int                       -- ^ Identifier of the message
    , reaction_type           :: Maybe ReactionType.ReactionType -- ^ Type of the reaction to add. Use addPendingPaidMessageReaction instead to add the paid reaction
    , is_big                  :: Maybe Bool                      -- ^ Pass true if the reaction is added with a big animation
    , update_recent_reactions :: Maybe Bool                      -- ^ Pass true if the reaction needs to be added to recent reactions; tags are never added to the list of recent reactions
    }
  deriving (Eq, Show)

instance I.ShortShow AddMessageReaction where
  shortShow
    AddMessageReaction
      { chat_id                 = chat_id_
      , message_id              = message_id_
      , reaction_type           = reaction_type_
      , is_big                  = is_big_
      , update_recent_reactions = update_recent_reactions_
      }
        = "AddMessageReaction"
          ++ I.cc
          [ "chat_id"                 `I.p` chat_id_
          , "message_id"              `I.p` message_id_
          , "reaction_type"           `I.p` reaction_type_
          , "is_big"                  `I.p` is_big_
          , "update_recent_reactions" `I.p` update_recent_reactions_
          ]

instance AT.ToJSON AddMessageReaction where
  toJSON
    AddMessageReaction
      { chat_id                 = chat_id_
      , message_id              = message_id_
      , reaction_type           = reaction_type_
      , is_big                  = is_big_
      , update_recent_reactions = update_recent_reactions_
      }
        = A.object
          [ "@type"                   A..= AT.String "addMessageReaction"
          , "chat_id"                 A..= chat_id_
          , "message_id"              A..= message_id_
          , "reaction_type"           A..= reaction_type_
          , "is_big"                  A..= is_big_
          , "update_recent_reactions" A..= update_recent_reactions_
          ]

defaultAddMessageReaction :: AddMessageReaction
defaultAddMessageReaction =
  AddMessageReaction
    { chat_id                 = Nothing
    , message_id              = Nothing
    , reaction_type           = Nothing
    , is_big                  = Nothing
    , update_recent_reactions = Nothing
    }

