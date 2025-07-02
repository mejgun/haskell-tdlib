module TD.Query.GetVideoMessageAdvertisements
  (GetVideoMessageAdvertisements(..)
  , defaultGetVideoMessageAdvertisements
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns advertisements to be shown while a video from a message is watched. Available only if messageProperties.can_get_video_advertisements. Returns 'TD.Data.VideoMessageAdvertisements.VideoMessageAdvertisements'
data GetVideoMessageAdvertisements
  = GetVideoMessageAdvertisements
    { chat_id    :: Maybe Int -- ^ Identifier of the chat with the message
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow GetVideoMessageAdvertisements where
  shortShow
    GetVideoMessageAdvertisements
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetVideoMessageAdvertisements"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetVideoMessageAdvertisements where
  toJSON
    GetVideoMessageAdvertisements
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getVideoMessageAdvertisements"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetVideoMessageAdvertisements :: GetVideoMessageAdvertisements
defaultGetVideoMessageAdvertisements =
  GetVideoMessageAdvertisements
    { chat_id    = Nothing
    , message_id = Nothing
    }

