module TD.Query.GetChatStatistics
  (GetChatStatistics(..)
  , defaultGetChatStatistics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns detailed statistics about a chat. Currently, this method can be used only for supergroups and channels. Can be used only if supergroupFullInfo.can_get_statistics == true. Returns 'TD.Data.ChatStatistics.ChatStatistics'
data GetChatStatistics
  = GetChatStatistics
    { chat_id :: Maybe Int  -- ^ Chat identifier
    , is_dark :: Maybe Bool -- ^ Pass true if a dark theme is used by the application
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatStatistics where
  shortShow
    GetChatStatistics
      { chat_id = chat_id_
      , is_dark = is_dark_
      }
        = "GetChatStatistics"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "is_dark" `I.p` is_dark_
          ]

instance AT.ToJSON GetChatStatistics where
  toJSON
    GetChatStatistics
      { chat_id = chat_id_
      , is_dark = is_dark_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatStatistics"
          , "chat_id" A..= chat_id_
          , "is_dark" A..= is_dark_
          ]

defaultGetChatStatistics :: GetChatStatistics
defaultGetChatStatistics =
  GetChatStatistics
    { chat_id = Nothing
    , is_dark = Nothing
    }

