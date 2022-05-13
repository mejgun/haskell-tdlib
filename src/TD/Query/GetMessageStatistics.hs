{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessageStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns detailed statistics about a message. Can be used only if message.can_get_statistics == true @chat_id Chat identifier @message_id Message identifier @is_dark Pass true if a dark theme is used by the application
data GetMessageStatistics = GetMessageStatistics
  { -- |
    is_dark :: Maybe Bool,
    -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageStatistics where
  show
    GetMessageStatistics
      { is_dark = is_dark_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetMessageStatistics"
        ++ U.cc
          [ U.p "is_dark" is_dark_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetMessageStatistics where
  toJSON
    GetMessageStatistics
      { is_dark = is_dark_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getMessageStatistics",
          "is_dark" A..= is_dark_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
