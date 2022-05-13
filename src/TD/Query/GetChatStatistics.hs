{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns detailed statistics about a chat. Currently, this method can be used only for supergroups and channels. Can be used only if supergroupFullInfo.can_get_statistics == true @chat_id Chat identifier @is_dark Pass true if a dark theme is used by the application
data GetChatStatistics = GetChatStatistics
  { -- |
    is_dark :: Maybe Bool,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatStatistics where
  show
    GetChatStatistics
      { is_dark = is_dark_,
        chat_id = chat_id_
      } =
      "GetChatStatistics"
        ++ U.cc
          [ U.p "is_dark" is_dark_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatStatistics where
  toJSON
    GetChatStatistics
      { is_dark = is_dark_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatStatistics",
          "is_dark" A..= is_dark_,
          "chat_id" A..= chat_id_
        ]
