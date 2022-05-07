{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetGameHighScores where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the high scores for a game and some part of the high score table in the range of the specified user; for bots only @chat_id The chat that contains the message with the game @message_id Identifier of the message @user_id User identifier
data GetGameHighScores = GetGameHighScores
  { -- |
    user_id :: Maybe Int,
    -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetGameHighScores where
  show
    GetGameHighScores
      { user_id = user_id,
        message_id = message_id,
        chat_id = chat_id
      } =
      "GetGameHighScores"
        ++ U.cc
          [ U.p "user_id" user_id,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetGameHighScores where
  toJSON
    GetGameHighScores
      { user_id = user_id,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getGameHighScores",
          "user_id" A..= user_id,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
