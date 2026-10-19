module TD.Query.GetFullRichMessage
  (GetFullRichMessage(..)
  , defaultGetFullRichMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the full version of a rich message. Returns 'TD.Data.RichMessage.RichMessage'
data GetFullRichMessage
  = GetFullRichMessage
    { chat_id    :: Maybe Int -- ^ Identifier of the chat the message belongs to
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow GetFullRichMessage where
  shortShow
    GetFullRichMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetFullRichMessage"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetFullRichMessage where
  toJSON
    GetFullRichMessage
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getFullRichMessage"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetFullRichMessage :: GetFullRichMessage
defaultGetFullRichMessage =
  GetFullRichMessage
    { chat_id    = Nothing
    , message_id = Nothing
    }

