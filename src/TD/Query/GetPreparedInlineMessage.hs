module TD.Query.GetPreparedInlineMessage
  (GetPreparedInlineMessage(..)
  , defaultGetPreparedInlineMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Saves an inline message to be sent by the given user. Returns 'TD.Data.PreparedInlineMessage.PreparedInlineMessage'
data GetPreparedInlineMessage
  = GetPreparedInlineMessage
    { bot_user_id         :: Maybe Int    -- ^ Identifier of the bot that created the message
    , prepared_message_id :: Maybe T.Text -- ^ Identifier of the prepared message
    }
  deriving (Eq, Show)

instance I.ShortShow GetPreparedInlineMessage where
  shortShow
    GetPreparedInlineMessage
      { bot_user_id         = bot_user_id_
      , prepared_message_id = prepared_message_id_
      }
        = "GetPreparedInlineMessage"
          ++ I.cc
          [ "bot_user_id"         `I.p` bot_user_id_
          , "prepared_message_id" `I.p` prepared_message_id_
          ]

instance AT.ToJSON GetPreparedInlineMessage where
  toJSON
    GetPreparedInlineMessage
      { bot_user_id         = bot_user_id_
      , prepared_message_id = prepared_message_id_
      }
        = A.object
          [ "@type"               A..= AT.String "getPreparedInlineMessage"
          , "bot_user_id"         A..= bot_user_id_
          , "prepared_message_id" A..= prepared_message_id_
          ]

defaultGetPreparedInlineMessage :: GetPreparedInlineMessage
defaultGetPreparedInlineMessage =
  GetPreparedInlineMessage
    { bot_user_id         = Nothing
    , prepared_message_id = Nothing
    }

