{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetGameScore where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Updates the game score of the specified user in the game; for bots only @chat_id The chat to which the message with the game belongs @message_id Identifier of the message
data SetGameScore = SetGameScore
  { -- | Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
    force :: Maybe Bool,
    -- |
    score :: Maybe Int,
    -- |
    user_id :: Maybe Int,
    -- | Pass true to edit the game message to include the current scoreboard @user_id User identifier @score The new score
    edit_message :: Maybe Bool,
    -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetGameScore where
  show
    SetGameScore
      { force = force,
        score = score,
        user_id = user_id,
        edit_message = edit_message,
        message_id = message_id,
        chat_id = chat_id
      } =
      "SetGameScore"
        ++ U.cc
          [ U.p "force" force,
            U.p "score" score,
            U.p "user_id" user_id,
            U.p "edit_message" edit_message,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetGameScore where
  toJSON
    SetGameScore
      { force = force,
        score = score,
        user_id = user_id,
        edit_message = edit_message,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setGameScore",
          "force" A..= force,
          "score" A..= score,
          "user_id" A..= user_id,
          "edit_message" A..= edit_message,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
