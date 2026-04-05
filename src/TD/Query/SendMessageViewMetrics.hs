module TD.Query.SendMessageViewMetrics
  (SendMessageViewMetrics(..)
  , defaultSendMessageViewMetrics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib about details of a message view by the user from a chat, a message thread or a forum topic history. The method must be called if the message wasn't seen for more than 300 milliseconds, the viewport was destroyed, or the total view duration exceeded 5 minutes. Returns 'TD.Data.Ok.Ok'
data SendMessageViewMetrics
  = SendMessageViewMetrics
    { chat_id                            :: Maybe Int -- ^ Chat identifier
    , message_id                         :: Maybe Int -- ^ The identifier of the message being viewed
    , time_in_view_ms                    :: Maybe Int -- ^ The amount of time the message was seen by at least 1 pixel; in milliseconds
    , active_time_in_view_ms             :: Maybe Int -- ^ The amount of time the message was seen by at least 1 pixel within 15 seconds after any action from the user; in milliseconds
    , height_to_viewport_ratio_per_mille :: Maybe Int -- ^ The ratio of the post height to the viewport height in 1/1000 fractions
    , seen_range_ratio_per_mille         :: Maybe Int -- ^ The ratio of the viewed post height to the full post height in 1/1000 fractions; 0-1000
    }
  deriving (Eq, Show)

instance I.ShortShow SendMessageViewMetrics where
  shortShow
    SendMessageViewMetrics
      { chat_id                            = chat_id_
      , message_id                         = message_id_
      , time_in_view_ms                    = time_in_view_ms_
      , active_time_in_view_ms             = active_time_in_view_ms_
      , height_to_viewport_ratio_per_mille = height_to_viewport_ratio_per_mille_
      , seen_range_ratio_per_mille         = seen_range_ratio_per_mille_
      }
        = "SendMessageViewMetrics"
          ++ I.cc
          [ "chat_id"                            `I.p` chat_id_
          , "message_id"                         `I.p` message_id_
          , "time_in_view_ms"                    `I.p` time_in_view_ms_
          , "active_time_in_view_ms"             `I.p` active_time_in_view_ms_
          , "height_to_viewport_ratio_per_mille" `I.p` height_to_viewport_ratio_per_mille_
          , "seen_range_ratio_per_mille"         `I.p` seen_range_ratio_per_mille_
          ]

instance AT.ToJSON SendMessageViewMetrics where
  toJSON
    SendMessageViewMetrics
      { chat_id                            = chat_id_
      , message_id                         = message_id_
      , time_in_view_ms                    = time_in_view_ms_
      , active_time_in_view_ms             = active_time_in_view_ms_
      , height_to_viewport_ratio_per_mille = height_to_viewport_ratio_per_mille_
      , seen_range_ratio_per_mille         = seen_range_ratio_per_mille_
      }
        = A.object
          [ "@type"                              A..= AT.String "sendMessageViewMetrics"
          , "chat_id"                            A..= chat_id_
          , "message_id"                         A..= message_id_
          , "time_in_view_ms"                    A..= time_in_view_ms_
          , "active_time_in_view_ms"             A..= active_time_in_view_ms_
          , "height_to_viewport_ratio_per_mille" A..= height_to_viewport_ratio_per_mille_
          , "seen_range_ratio_per_mille"         A..= seen_range_ratio_per_mille_
          ]

defaultSendMessageViewMetrics :: SendMessageViewMetrics
defaultSendMessageViewMetrics =
  SendMessageViewMetrics
    { chat_id                            = Nothing
    , message_id                         = Nothing
    , time_in_view_ms                    = Nothing
    , active_time_in_view_ms             = Nothing
    , height_to_viewport_ratio_per_mille = Nothing
    , seen_range_ratio_per_mille         = Nothing
    }

