module TD.Query.DeletePollOption
  (DeletePollOption(..)
  , defaultDeletePollOption
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Deletes an option from a poll. Returns 'TD.Data.Ok.Ok'
data DeletePollOption
  = DeletePollOption
    { chat_id    :: Maybe Int    -- ^ Identifier of the chat to which the poll belongs
    , message_id :: Maybe Int    -- ^ Identifier of the message containing the poll
    , option_id  :: Maybe T.Text -- ^ Unique identifier of the option. Use pollOptionProperties.can_be_deleted to check whether the option can be deleted by the user
    }
  deriving (Eq, Show)

instance I.ShortShow DeletePollOption where
  shortShow
    DeletePollOption
      { chat_id    = chat_id_
      , message_id = message_id_
      , option_id  = option_id_
      }
        = "DeletePollOption"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "option_id"  `I.p` option_id_
          ]

instance AT.ToJSON DeletePollOption where
  toJSON
    DeletePollOption
      { chat_id    = chat_id_
      , message_id = message_id_
      , option_id  = option_id_
      }
        = A.object
          [ "@type"      A..= AT.String "deletePollOption"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "option_id"  A..= option_id_
          ]

defaultDeletePollOption :: DeletePollOption
defaultDeletePollOption =
  DeletePollOption
    { chat_id    = Nothing
    , message_id = Nothing
    , option_id  = Nothing
    }

