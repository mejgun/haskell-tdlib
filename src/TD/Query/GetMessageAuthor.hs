module TD.Query.GetMessageAuthor
  (GetMessageAuthor(..)
  , defaultGetMessageAuthor
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about actual author of a message sent on behalf of a channel. The method can be called if messageProperties.can_get_author == true. Returns 'TD.Data.User.User'
data GetMessageAuthor
  = GetMessageAuthor
    { chat_id    :: Maybe Int -- ^ Chat identifier
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageAuthor where
  shortShow
    GetMessageAuthor
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetMessageAuthor"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetMessageAuthor where
  toJSON
    GetMessageAuthor
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getMessageAuthor"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetMessageAuthor :: GetMessageAuthor
defaultGetMessageAuthor =
  GetMessageAuthor
    { chat_id    = Nothing
    , message_id = Nothing
    }

