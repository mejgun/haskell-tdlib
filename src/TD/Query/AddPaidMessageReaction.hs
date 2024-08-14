module TD.Query.AddPaidMessageReaction
  (AddPaidMessageReaction(..)
  , defaultAddPaidMessageReaction
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Adds the paid message reaction to a message. Use getMessageAvailableReactions to receive the list of available reactions for the message. Returns 'TD.Data.Ok.Ok'
data AddPaidMessageReaction
  = AddPaidMessageReaction
    { chat_id      :: Maybe Int  -- ^ Identifier of the chat to which the message belongs
    , message_id   :: Maybe Int  -- ^ Identifier of the message
    , star_count   :: Maybe Int  -- ^ Number of Telegram Stars to be used for the reaction; 1-getOption("paid_reaction_star_count_max")
    , is_anonymous :: Maybe Bool -- ^ Pass true to make paid reaction of the user on the message anonymous; pass false to make the user's profile visible among top reactors
    }
  deriving (Eq, Show)

instance I.ShortShow AddPaidMessageReaction where
  shortShow
    AddPaidMessageReaction
      { chat_id      = chat_id_
      , message_id   = message_id_
      , star_count   = star_count_
      , is_anonymous = is_anonymous_
      }
        = "AddPaidMessageReaction"
          ++ I.cc
          [ "chat_id"      `I.p` chat_id_
          , "message_id"   `I.p` message_id_
          , "star_count"   `I.p` star_count_
          , "is_anonymous" `I.p` is_anonymous_
          ]

instance AT.ToJSON AddPaidMessageReaction where
  toJSON
    AddPaidMessageReaction
      { chat_id      = chat_id_
      , message_id   = message_id_
      , star_count   = star_count_
      , is_anonymous = is_anonymous_
      }
        = A.object
          [ "@type"        A..= AT.String "addPaidMessageReaction"
          , "chat_id"      A..= chat_id_
          , "message_id"   A..= message_id_
          , "star_count"   A..= star_count_
          , "is_anonymous" A..= is_anonymous_
          ]

defaultAddPaidMessageReaction :: AddPaidMessageReaction
defaultAddPaidMessageReaction =
  AddPaidMessageReaction
    { chat_id      = Nothing
    , message_id   = Nothing
    , star_count   = Nothing
    , is_anonymous = Nothing
    }

