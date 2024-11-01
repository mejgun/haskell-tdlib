module TD.Query.GetChatRevenueStatistics
  (GetChatRevenueStatistics(..)
  , defaultGetChatRevenueStatistics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns detailed revenue statistics about a chat. Currently, this method can be used only for channels if supergroupFullInfo.can_get_revenue_statistics == true or bots if userFullInfo.bot_info.can_get_revenue_statistics == true. Returns 'TD.Data.ChatRevenueStatistics.ChatRevenueStatistics'
data GetChatRevenueStatistics
  = GetChatRevenueStatistics
    { chat_id :: Maybe Int  -- ^ Chat identifier
    , is_dark :: Maybe Bool -- ^ Pass true if a dark theme is used by the application
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatRevenueStatistics where
  shortShow
    GetChatRevenueStatistics
      { chat_id = chat_id_
      , is_dark = is_dark_
      }
        = "GetChatRevenueStatistics"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "is_dark" `I.p` is_dark_
          ]

instance AT.ToJSON GetChatRevenueStatistics where
  toJSON
    GetChatRevenueStatistics
      { chat_id = chat_id_
      , is_dark = is_dark_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatRevenueStatistics"
          , "chat_id" A..= chat_id_
          , "is_dark" A..= is_dark_
          ]

defaultGetChatRevenueStatistics :: GetChatRevenueStatistics
defaultGetChatRevenueStatistics =
  GetChatRevenueStatistics
    { chat_id = Nothing
    , is_dark = Nothing
    }

