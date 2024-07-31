module TD.Query.GetMessageStatistics
  (GetMessageStatistics(..)
  , defaultGetMessageStatistics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns detailed statistics about a message. Can be used only if messageProperties.can_get_statistics == true. Returns 'TD.Data.MessageStatistics.MessageStatistics'
data GetMessageStatistics
  = GetMessageStatistics
    { chat_id    :: Maybe Int  -- ^ Chat identifier
    , message_id :: Maybe Int  -- ^ Message identifier
    , is_dark    :: Maybe Bool -- ^ Pass true if a dark theme is used by the application
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageStatistics where
  shortShow
    GetMessageStatistics
      { chat_id    = chat_id_
      , message_id = message_id_
      , is_dark    = is_dark_
      }
        = "GetMessageStatistics"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "is_dark"    `I.p` is_dark_
          ]

instance AT.ToJSON GetMessageStatistics where
  toJSON
    GetMessageStatistics
      { chat_id    = chat_id_
      , message_id = message_id_
      , is_dark    = is_dark_
      }
        = A.object
          [ "@type"      A..= AT.String "getMessageStatistics"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "is_dark"    A..= is_dark_
          ]

defaultGetMessageStatistics :: GetMessageStatistics
defaultGetMessageStatistics =
  GetMessageStatistics
    { chat_id    = Nothing
    , message_id = Nothing
    , is_dark    = Nothing
    }

