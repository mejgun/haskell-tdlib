module TD.Query.CreateVideoChat
  (CreateVideoChat(..)
  , defaultCreateVideoChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates a video chat (a group call bound to a chat). Available only for basic groups, supergroups and channels; requires can_manage_video_chats administrator right. Returns 'TD.Data.GroupCallId.GroupCallId'
data CreateVideoChat
  = CreateVideoChat
    { chat_id        :: Maybe Int    -- ^ Identifier of a chat in which the video chat will be created
    , title          :: Maybe T.Text -- ^ Group call title; if empty, chat title will be used
    , start_date     :: Maybe Int    -- ^ Point in time (Unix timestamp) when the group call is expected to be started by an administrator; 0 to start the video chat immediately. The date must be at least 10 seconds and at most 8 days in the future
    , is_rtmp_stream :: Maybe Bool   -- ^ Pass true to create an RTMP stream instead of an ordinary video chat
    }
  deriving (Eq, Show)

instance I.ShortShow CreateVideoChat where
  shortShow
    CreateVideoChat
      { chat_id        = chat_id_
      , title          = title_
      , start_date     = start_date_
      , is_rtmp_stream = is_rtmp_stream_
      }
        = "CreateVideoChat"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "title"          `I.p` title_
          , "start_date"     `I.p` start_date_
          , "is_rtmp_stream" `I.p` is_rtmp_stream_
          ]

instance AT.ToJSON CreateVideoChat where
  toJSON
    CreateVideoChat
      { chat_id        = chat_id_
      , title          = title_
      , start_date     = start_date_
      , is_rtmp_stream = is_rtmp_stream_
      }
        = A.object
          [ "@type"          A..= AT.String "createVideoChat"
          , "chat_id"        A..= chat_id_
          , "title"          A..= title_
          , "start_date"     A..= start_date_
          , "is_rtmp_stream" A..= is_rtmp_stream_
          ]

defaultCreateVideoChat :: CreateVideoChat
defaultCreateVideoChat =
  CreateVideoChat
    { chat_id        = Nothing
    , title          = Nothing
    , start_date     = Nothing
    , is_rtmp_stream = Nothing
    }

