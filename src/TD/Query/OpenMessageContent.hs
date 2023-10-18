module TD.Query.OpenMessageContent
  (OpenMessageContent(..)
  , defaultOpenMessageContent
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that the message content has been opened (e.g., the user has opened a photo, video, document, location or venue, or has listened to an audio file or voice note message). An updateMessageContentOpened update will be generated if something has changed. Returns 'TD.Data.Ok.Ok'
data OpenMessageContent
  = OpenMessageContent
    { chat_id    :: Maybe Int -- ^ Chat identifier of the message
    , message_id :: Maybe Int -- ^ Identifier of the message with the opened content
    }
  deriving (Eq, Show)

instance I.ShortShow OpenMessageContent where
  shortShow
    OpenMessageContent
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "OpenMessageContent"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON OpenMessageContent where
  toJSON
    OpenMessageContent
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "openMessageContent"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultOpenMessageContent :: OpenMessageContent
defaultOpenMessageContent =
  OpenMessageContent
    { chat_id    = Nothing
    , message_id = Nothing
    }

