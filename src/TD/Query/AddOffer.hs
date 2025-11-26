module TD.Query.AddOffer
  (AddOffer(..)
  , defaultAddOffer
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSendOptions as MessageSendOptions

-- | Sends a suggested post based on a previously sent message in a channel direct messages chat. Can be also used to suggest price or time change for an existing suggested post. Returns the sent message. Returns 'TD.Data.Message.Message'
data AddOffer
  = AddOffer
    { chat_id    :: Maybe Int                                   -- ^ Identifier of the channel direct messages chat
    , message_id :: Maybe Int                                   -- ^ Identifier of the message in the chat which will be sent as suggested post. Use messageProperties.can_add_offer to check whether an offer can be added or messageProperties.can_edit_suggested_post_info to check whether price or time of sending of the post can be changed
    , options    :: Maybe MessageSendOptions.MessageSendOptions -- ^ Options to be used to send the message. New information about the suggested post must always be specified
    }
  deriving (Eq, Show)

instance I.ShortShow AddOffer where
  shortShow
    AddOffer
      { chat_id    = chat_id_
      , message_id = message_id_
      , options    = options_
      }
        = "AddOffer"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "options"    `I.p` options_
          ]

instance AT.ToJSON AddOffer where
  toJSON
    AddOffer
      { chat_id    = chat_id_
      , message_id = message_id_
      , options    = options_
      }
        = A.object
          [ "@type"      A..= AT.String "addOffer"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "options"    A..= options_
          ]

defaultAddOffer :: AddOffer
defaultAddOffer =
  AddOffer
    { chat_id    = Nothing
    , message_id = Nothing
    , options    = Nothing
    }

