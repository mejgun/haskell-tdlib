{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetGameScore where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Updates the game score of the specified user in the game; for bots only
data SetGameScore = SetGameScore
  { -- | Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
    force :: Maybe Bool,
    -- | The new score
    score :: Maybe Int,
    -- | User identifier
    user_id :: Maybe Int,
    -- | Pass true to edit the game message to include the current scoreboard
    edit_message :: Maybe Bool,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | The chat to which the message with the game belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetGameScore where
  show
    SetGameScore
      { force = force_,
        score = score_,
        user_id = user_id_,
        edit_message = edit_message_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "SetGameScore"
        ++ U.cc
          [ U.p "force" force_,
            U.p "score" score_,
            U.p "user_id" user_id_,
            U.p "edit_message" edit_message_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetGameScore where
  toJSON
    SetGameScore
      { force = force_,
        score = score_,
        user_id = user_id_,
        edit_message = edit_message_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setGameScore",
          "force" A..= force_,
          "score" A..= score_,
          "user_id" A..= user_id_,
          "edit_message" A..= edit_message_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
