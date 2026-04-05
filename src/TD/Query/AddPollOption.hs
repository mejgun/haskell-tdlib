module TD.Query.AddPollOption
  (AddPollOption(..)
  , defaultAddPollOption
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputPollOption as InputPollOption

-- | Adds an option to a poll. Returns 'TD.Data.Ok.Ok'
data AddPollOption
  = AddPollOption
    { chat_id    :: Maybe Int                             -- ^ Identifier of the chat to which the poll belongs
    , message_id :: Maybe Int                             -- ^ Identifier of the message containing the poll. Use messagePoll.can_add_option to check whether an option can be added
    , option     :: Maybe InputPollOption.InputPollOption -- ^ The new option
    }
  deriving (Eq, Show)

instance I.ShortShow AddPollOption where
  shortShow
    AddPollOption
      { chat_id    = chat_id_
      , message_id = message_id_
      , option     = option_
      }
        = "AddPollOption"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "option"     `I.p` option_
          ]

instance AT.ToJSON AddPollOption where
  toJSON
    AddPollOption
      { chat_id    = chat_id_
      , message_id = message_id_
      , option     = option_
      }
        = A.object
          [ "@type"      A..= AT.String "addPollOption"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "option"     A..= option_
          ]

defaultAddPollOption :: AddPollOption
defaultAddPollOption =
  AddPollOption
    { chat_id    = Nothing
    , message_id = Nothing
    , option     = Nothing
    }

